/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderTotalAndItem data model.
public class OrderTotalAndItem : OrderTotal {

    /// Model field orderitem
    var orderItem : OrderItem

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case orderItem = "orderitem"
    }

    /**
     OrderTotalAndItem Constructor.
     */
    public override init() {
        self.orderItem = OrderItem()

        super.init()
    }

    /**
     OrderTotalAndItem Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.orderItem = try container.decodeIfPresent(OrderItem.self, forKey: .orderItem) ?? OrderItem()

        try super.init(from : decoder)
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encoder: The Encoder instance.
     - Throws: error when unable to encode.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.orderItem, forKey: .orderItem)

        try super.encode(to: encoder)
    }

    /**
     Getter for orderitem.

     - Returns:  OrderItem
     */
    public func getOrderItem() -> OrderItem {
        return self.orderItem
    }
}
