/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/**
 Handles API Request OrderReturnList_Received.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderreturnlist_received
 */
public class OrderReturnListReceivedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderReturnList_Received"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Returns.
    var returns : [ReceivedReturn] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case returns = "Returns"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
     */
    public override init(client: Optional<BaseClient> = nil) {
        super.init(client: client)
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encode: A Encoder instance to encode to.
     - Throws: Error when unable to encode the request data.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.returns, forKey: .returns)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderReturnListReceivedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderReturnListReceivedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderReturnListReceivedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderReturnListReceivedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderReturnListReceivedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderReturnListReceivedResponse.self
    }

    /**
     Getter for Returns.

     - Returns:  [ReceivedReturn]
     */
    public func getReturns() -> [ReceivedReturn] {
        return self.returns
    }

    /**
     Add a ReceivedReturn.

     - Parameters:
        - receivedReturn: ReceivedReturn
     - Returns: Self
     */
    @discardableResult
    public func addReceivedReturn(_ receivedReturn : ReceivedReturn) -> Self {
        self.returns.append(receivedReturn)
        return self
    }

    /**
     Add an array of ReceivedReturn.

     - Parameters:
        - returns: [ReceivedReturn]
     - Returns: Self
     */
    @discardableResult
    public func addReturns(_ returns: [ReceivedReturn]) -> Self {
        for r in returns {
            self.returns.append(r);
        }

        return self
    }
}
