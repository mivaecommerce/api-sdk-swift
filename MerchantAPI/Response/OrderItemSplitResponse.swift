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
 API Response for OrderItem_Split.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderitem_split
 */
public class OrderItemSplitResponse : Response {

    /// The response model
    public var splitOrderItem : Optional<SplitOrderItem> = nil

    /**
     Getter for splitOrderItem.

     - Returns: SplitOrderItem
     */
    public func getSplitOrderItem() -> Optional<SplitOrderItem> {
        return self.splitOrderItem
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case splitOrderItem = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.splitOrderItem = try container.decodeIfPresent(SplitOrderItem.self, forKey: .splitOrderItem)
        try super.init(from : decoder)
    }
}