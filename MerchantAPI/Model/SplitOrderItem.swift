/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// SplitOrderItem data model.
public class SplitOrderItem : Model {

    /// Model field original_orderitem
    var originalOrderItem : OrderItem

    /// Model field split_orderitem
    var splitOrderItem : OrderItem

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case originalOrderItem = "original_orderitem"
        case splitOrderItem = "split_orderitem"
    }

    /**
     SplitOrderItem Constructor.
     */
    public override init() {
        self.originalOrderItem = OrderItem()
        self.splitOrderItem = OrderItem()

        super.init()
    }

    /**
     SplitOrderItem Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.originalOrderItem = try container.decodeIfPresent(OrderItem.self, forKey: .originalOrderItem) ?? OrderItem()
        self.splitOrderItem = try container.decodeIfPresent(OrderItem.self, forKey: .splitOrderItem) ?? OrderItem()

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

        try container.encodeIfPresent(self.originalOrderItem, forKey: .originalOrderItem)
        try container.encodeIfPresent(self.splitOrderItem, forKey: .splitOrderItem)

        try super.encode(to: encoder)
    }

    /**
     Getter for original_orderitem.

     - Returns:  OrderItem
     */
    public func getOriginalOrderItem() -> OrderItem {
        return self.originalOrderItem
    }

    /**
     Getter for split_orderitem.

     - Returns:  OrderItem
     */
    public func getSplitOrderItem() -> OrderItem {
        return self.splitOrderItem
    }
}
