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
 API Response for SubscriptionAndOrderItem_Add.

 - SeeAlso: https://docs.miva.com/json-api/functions/subscriptionandorderitem_add
 */
public class SubscriptionAndOrderItemAddResponse : Response {

    /// The response model
    public var orderTotalAndItem : Optional<OrderTotalAndItem> = nil

    /**
     Getter for orderTotalAndItem.

     - Returns: OrderTotalAndItem
     */
    public func getOrderTotalAndItem() -> Optional<OrderTotalAndItem> {
        return self.orderTotalAndItem
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case orderTotalAndItem = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.orderTotalAndItem = try container.decodeIfPresent(OrderTotalAndItem.self, forKey: .orderTotalAndItem)
        try super.init(from : decoder)
    }
}