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
 API Response for OrderItemList_CreateReturn.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderitemlist_createreturn
 */
public class OrderItemListCreateReturnResponse : Response {

    /// The response model
    public var orderReturn : Optional<OrderReturn> = nil

    /**
     Getter for orderReturn.

     - Returns: OrderReturn
     */
    public func getOrderReturn() -> Optional<OrderReturn> {
        return self.orderReturn
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case orderReturn = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.orderReturn = try container.decodeIfPresent(OrderReturn.self, forKey: .orderReturn)
        try super.init(from : decoder)
    }
}