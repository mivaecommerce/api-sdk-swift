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
 Handles API Request CustomerCreditHistory_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/customercredithistory_delete
 */
public class CustomerCreditHistoryDeleteRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CustomerCreditHistory_Delete"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field CustomerCreditHistory_ID.
    var customerCreditHistoryId : Optional<Int> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case customerCreditHistoryId = "CustomerCreditHistory_ID"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - customerCreditHistory: An optional CustomerCreditHistory instance.
     */
    public init(client: Optional<BaseClient> = nil, customerCreditHistory: Optional<CustomerCreditHistory> = nil) {
        super.init(client: client)
        if let customerCreditHistory = customerCreditHistory {
            self.customerCreditHistoryId = customerCreditHistory.id
        }
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

        try container.encodeIfPresent(self.customerCreditHistoryId, forKey: .customerCreditHistoryId)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CustomerCreditHistoryDeleteResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CustomerCreditHistoryDeleteResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CustomerCreditHistoryDeleteResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CustomerCreditHistoryDeleteResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CustomerCreditHistoryDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerCreditHistoryDeleteResponse.self
    }

    /**
     Getter for CustomerCreditHistory_ID.

     - Returns:  Optional<Int>
     */
    public func getCustomerCreditHistoryId() -> Optional<Int> {
        return self.customerCreditHistoryId
    }

    /**
     Setter for CustomerCreditHistory_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerCreditHistoryId(_ value: Optional<Int>) -> Self {
        self.customerCreditHistoryId = value
        return self
    }
}
