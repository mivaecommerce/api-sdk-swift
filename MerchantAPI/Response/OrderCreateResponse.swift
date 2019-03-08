/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: OrderCreateResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for Order_Create.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/order_create
 */
public class OrderCreateResponse : Response {

    /// The response model
    public var order : Optional<Order>
    
    /**
     Getter for order.

     - Returns: Order
     */
    public func getOrder() -> Optional<Order> {
        return self.order
    }
    
    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case order = "data"
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.order = try container.decodeIfPresent(Order.self, forKey: .order)
        try super.init(from : decoder)
    }
}