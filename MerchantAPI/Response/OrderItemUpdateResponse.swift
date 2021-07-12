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
 API Response for OrderItem_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderitem_update
 */
public class OrderItemUpdateResponse : Response {

    /// The response model
    public var orderTotal : Optional<OrderTotal> = nil

    /**
     Getter for orderTotal.

     - Returns: OrderTotal
     */
    public func getOrderTotal() -> Optional<OrderTotal> {
        return self.orderTotal
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case orderTotal = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.orderTotal = try container.decodeIfPresent(OrderTotal.self, forKey: .orderTotal)
        try super.init(from : decoder)
    }
}