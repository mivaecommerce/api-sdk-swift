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
 Handles API Request OrderPriceGroup_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderpricegroup_update_assigned
 */
public class OrderPriceGroupUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderPriceGroup_Update_Assigned"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Order_ID.
    var orderId : Optional<Int> = nil

    /// Request field PriceGroup_ID.
    var priceGroupId : Optional<Int> = nil

    /// Request field PriceGroup_Name.
    var priceGroupName : Optional<String> = nil

    /// Request field Assigned.
    var assigned : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderId = "Order_ID"
        case priceGroupId = "PriceGroup_ID"
        case priceGroupName = "PriceGroup_Name"
        case assigned = "Assigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - order: An optional Order instance.
     */
    public init(client: Optional<BaseClient> = nil, order: Optional<Order> = nil) {
        super.init(client: client)
        if let order = order {
            if order.id > 0 {
                self.orderId = order.id
            }
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

        if self.orderId != nil {
            try container.encodeIfPresent(self.orderId, forKey: .orderId)
        }

        if self.priceGroupId != nil {
            try container.encodeIfPresent(self.priceGroupId, forKey: .priceGroupId)
        } else if self.priceGroupName != nil {
            try container.encode(self.priceGroupName, forKey: .priceGroupName)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderPriceGroupUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderPriceGroupUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderPriceGroupUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderPriceGroupUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderPriceGroupUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderPriceGroupUpdateAssignedResponse.self
    }

    /**
     Getter for Order_ID.

     - Returns:  Optional<Int>
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
    }

    /**
     Getter for PriceGroup_ID.

     - Returns:  Optional<Int>
     */
    public func getPriceGroupId() -> Optional<Int> {
        return self.priceGroupId
    }

    /**
     Getter for PriceGroup_Name.

     - Returns:  Optional<String>
     */
    public func getPriceGroupName() -> Optional<String> {
        return self.priceGroupName
    }

    /**
     Getter for Assigned.

     - Returns:  Optional<Bool>
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
    }

    /**
     Setter for Order_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOrderId(_ value: Optional<Int>) -> Self {
        self.orderId = value
        return self
    }

    /**
     Setter for PriceGroup_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupId(_ value: Optional<Int>) -> Self {
        self.priceGroupId = value
        return self
    }

    /**
     Setter for PriceGroup_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupName(_ value: Optional<String>) -> Self {
        self.priceGroupName = value
        return self
    }

    /**
     Setter for Assigned.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setAssigned(_ value: Optional<Bool>) -> Self {
        self.assigned = value
        return self
    }
}
