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
 Handles API Request OrderItemList_BackOrder.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderitemlist_backorder
 */
public class OrderItemListBackOrderRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderItemList_BackOrder"
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

    /// Request field Line_IDs.
    var lineIds : [Int] = []

    /// Request field Date_InStock.
    var dateInStock : Optional<Date> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderId = "Order_ID"
        case lineIds = "Line_IDs"
        case dateInStock = "Date_InStock"
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

        try container.encodeIfPresent(self.lineIds, forKey: .lineIds)
        if let dateInStock = self.dateInStock {
            try container.encodeIfPresent(Int64(dateInStock.timeIntervalSince1970), forKey: .dateInStock)
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderItemListBackOrderResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderItemListBackOrderResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderItemListBackOrderResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderItemListBackOrderResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderItemListBackOrderResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderItemListBackOrderResponse.self
    }

    /**
     Getter for Order_ID.

     - Returns:  Optional<Int>
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
    }

    /**
     Getter for Date_InStock.

     - Returns:  Optional<Date>
     */
    public func getDateInStock() -> Optional<Date> {
        return self.dateInStock
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
     Setter for Date_InStock.

     - Parameters:
        - value: Optional<Date>
     - Returns:  Self
     */
    @discardableResult
    public func setDateInStock(_ value: Optional<Date>) -> Self {
        self.dateInStock = value
        return self
    }

    /**
     Add Line_IDs.

     - Parameters:
        - lineId: Int
     - Returns: Self
     */
    @discardableResult
    public func addLineId(_ lineId : Int) -> Self {
        self.lineIds.append(lineId);
        return self
    }

    /**
     Add OrderItem model.

     - Parameters:
        - orderItem: OrderItem
     - Returns: Self
     */
    @discardableResult
    public func addOrderItem(_ orderItem: OrderItem) -> Self {
        if orderItem.lineId > 0 {
            self.lineIds.append(orderItem.lineId)
        }

        return self
    }
}
