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
 Handles API Request OrderItem_Split.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderitem_split
 */
public class OrderItemSplitRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderItem_Split"
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

    /// Request field Line_ID.
    var lineId : Optional<Int> = nil

    /// Request field Quantity.
    var quantity : Optional<Int> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderId = "Order_ID"
        case lineId = "Line_ID"
        case quantity = "Quantity"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - orderItem: An optional OrderItem instance.
     */
    public init(client: Optional<BaseClient> = nil, orderItem: Optional<OrderItem> = nil) {
        super.init(client: client)
        if let orderItem = orderItem {
            if orderItem.orderId > 0 {
                self.orderId = orderItem.orderId
            }

            if orderItem.lineId > 0 {
                self.lineId = orderItem.lineId
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

        if self.lineId != nil {
            try container.encodeIfPresent(self.lineId, forKey: .lineId)
        }

        try container.encodeIfPresent(self.quantity, forKey: .quantity)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderItemSplitResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderItemSplitResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderItemSplitResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderItemSplitResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderItemSplitResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderItemSplitResponse.self
    }

    /**
     Getter for Order_ID.

     - Returns:  Optional<Int>
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
    }

    /**
     Getter for Line_ID.

     - Returns:  Optional<Int>
     */
    public func getLineId() -> Optional<Int> {
        return self.lineId
    }

    /**
     Getter for Quantity.

     - Returns:  Optional<Int>
     */
    public func getQuantity() -> Optional<Int> {
        return self.quantity
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
     Setter for Line_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setLineId(_ value: Optional<Int>) -> Self {
        self.lineId = value
        return self
    }

    /**
     Setter for Quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setQuantity(_ value: Optional<Int>) -> Self {
        self.quantity = value
        return self
    }
}
