/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: OrderItemListCreateShipmentResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for OrderItemList_CreateShipment.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/orderitemlist_createshipment
 */
public class OrderItemListCreateShipmentResponse : Response {

    /// The response model
    public var orderShipment : Optional<OrderShipment>
    
    /**
     Getter for orderShipment.

     - Returns: OrderShipment
     */
    public func getOrderShipment() -> Optional<OrderShipment> {
        return self.orderShipment
    }
    
    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case orderShipment = "data"
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.orderShipment = try container.decodeIfPresent(OrderShipment.self, forKey: .orderShipment)
        try super.init(from : decoder)
    }
}