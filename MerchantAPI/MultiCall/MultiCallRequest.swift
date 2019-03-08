/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: MultiCallRequest.swift 73830 2019-03-05 23:40:40Z gidriss $
 */

import Foundation

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
                try operations.encode(request as! Request)
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
    public override func send(client: Optional<Client> = nil, callback: @escaping (MultiCallResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? MultiCallResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? MultiCallResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }
    
    /**
     Create a response object by decoding the response data.
     
     - Parameters:
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(data : Data) throws -> MultiCallResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[MultiCallRequest.decoderMultiCallUserInfoKey] = self
        
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
}
