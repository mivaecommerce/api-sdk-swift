/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/// Used to allow both a Request and a MultiCallOperation to be added.
public protocol MultiCallRequestType : Encodable {}

extension Request: MultiCallRequestType {}

/**
 API Response for MultiCallRequest.

 - SeeAlso: https://docs.miva.com/json-api/multicall
 */
public class MultiCallRequest : Request {
    /// Decoding user info key for context
    static var decoderMultiCallUserInfoKey : CodingUserInfoKey = CodingUserInfoKey(rawValue: "multicall_decode_context")!

    /// Encoding keys
    private enum CodingKeys: String, CodingKey
    {
        case operations = "Operations"
    }

    /// Holds all requests associated with the instance.
    var requests : [MultiCallRequestType] = []

    /// If the request should auto-continue on timed out operations
    var autoTimeoutContinue : Bool = false

    // Used internally when processing timeouts when autoTimeoutContinue is true
    var _initialResponse : MultiCallResponse? = nil

    var _storedCallback : ((MultiCallResponse?, Error?) -> Void)? = nil

    /// Callback used on each sub-request sent and on completion of auto timeout continue
    var autoCompleteCallback: ((MultiCallResponse?, Error?, Bool) -> Void)? = nil

    public func setAutoTimeoutContinue(state: Bool) -> Self {
        self.autoTimeoutContinue = state
        return self
    }

    public func getAutoTimeoutContinue() -> Bool {
        return  self.autoTimeoutContinue
    }

    /**
     * setAutoCompleteCallback
     */
    public func setAutoCompleteCallback(callback: ((MultiCallResponse?, Error?, Bool) -> Void)?) {
        self.autoCompleteCallback = callback
    }

    /**
     * getAutoCompleteCallback
     */
    public func getAutoCompleteCallback() -> ((MultiCallResponse?, Error?, Bool) -> Void)? {
        return self.autoCompleteCallback
    }

    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return ""
    }

    /**
     Required override, but not used for anything.

     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /**
     Constructor.

     - Parameters:
        - client: The Client to send the request from.
     */
    public override init(client: Optional<BaseClient> = nil) {
        super.init(client: client)
        self.encoderOptions.encodeFunction = false
        self.encoderOptions.encodeStore = false
    }
    
    /**
     Encodes the request into an Encoder instance.

     - SeeAlso: Encodable
     - Throws: When unable to encode the request.
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        var operations = container.nestedUnkeyedContainer(forKey: .operations)
                
        for request in self.requests {
            if request is MultiCallOperation {
                try operations.encode(request as! MultiCallOperation)
            } else {
                let r = request as! Request
                r.encoderOptions.encodeTimestamp = false
                
                try operations.encode(r)
            }
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (MultiCallResponse?, Error?).
     - Note: Overrides
     */
    public override func send(client: Optional<BaseClient> = nil, callback: @escaping (MultiCallResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                if let httpUrlResponse = response?.httpResponse as? HTTPURLResponse {
                    let mcresponse = response as! MultiCallResponse

                    if httpUrlResponse.statusCode == 206 {
                        mcresponse.timeout = true

                        var range = (0, 0)

                        if let rangeValue = httpUrlResponse.allHeaderFields["Content-Range"] {
                             range = mcresponse.readContentRange(range: rangeValue as! String)
                         }

                        if self.autoTimeoutContinue && self._initialResponse == nil {
                            if range.0 <= 0 && range.1 <= 0 {
                                return
                            }

                            mcresponse.completed = range.0
                            mcresponse.total = range.1

                            self._initialResponse = response as? MultiCallResponse
                            self._storedCallback = callback
                            mcresponse.processContinue()

                            return
                        }
                    }
                }

                callback(response as? MultiCallResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - httpResponse: The underlying HTTP response object
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> MultiCallResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[MultiCallRequest.decoderMultiCallUserInfoKey]  = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(MultiCallResponse.self, from: data)
    }

    /**
     Add a request to be sent.

     - Parameters:
        - request: A compatbile MultiCallRequestType
     - Returns: Self
     */
    @discardableResult
    public func addRequest(_ request: MultiCallRequestType) -> Self {
        self.requests.append(request)
        return self
    }

    /**
     Get the requests to be sent.

     - Returns: [MultiCallRequestType]
     */
    public func getRequests() -> [MultiCallRequestType] {
        return self.requests
    }

    /**
     Create and add a MultiCallOperation to the request.

     - Parameters:
         - request: An optional start Request
         - sharedData: Optional starting shared data
     - Returns: MultiCallOperation
     */
    @discardableResult
    public func operation(request: Optional<Request> = nil, sharedData: [String: AnyEncodable] = [:]) -> MultiCallOperation  {
        let op = MultiCallOperation(request: request, sharedData: sharedData)

        self.requests.append(op)

        return op
    }

    /**
     Add a MultiCallOperation to the request.

     - Parameters:
        - operation: MultiCallOperation
     - Returns: Self
     */
    @discardableResult
    public func addOperation(_ operation: MultiCallOperation) -> Self  {
        let op = MultiCallOperation()

        self.requests.append(op)

        return self
    }

    /**
     Check if the request has any MultiCallOpertaion's

     - Returns: Bool
     */
    public func hasOperations() -> Bool {
        for request in self.requests {
            if request is MultiCallOperation {
                return true
            }
        }

        return false
    }

    /**
        Manipulate the request headers
        - Parameters:
            - headers: The dictionary of headers to manipulate
     */
    override public func processRequestHeaders(headers: inout Dictionary<String, String>) {
        if let initialResponse = self._initialResponse {
            headers["RANGE"] = String(format:"Operations=%d-%d", initialResponse.completed + 1, initialResponse.total)
        }
    }
}
