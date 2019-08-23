/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// OrderDiscountTotal data model.
public class OrderDiscountTotal : Model {

    /// Model field order_id.
    var orderId : Int

    /// Model field pgrp_id.
    var priceGroupId : Int

    /// Model field name.
    var name : String

    /// Model field descrip.
    var description : String

    /// Model field total.
    var total : Decimal

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case priceGroupId = "pgrp_id"
        case name
        case description = "descrip"
        case total
    }

    /**
     OrderDiscountTotal Constructor.
     */
    public override init() {
        self.orderId = 0
        self.priceGroupId = 0
        self.name = ""
        self.description = ""
        self.total = Decimal(0.00)

        super.init()
    }

    /**
     OrderDiscountTotal Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.priceGroupId = try container.decodeIfPresent(Int.self, forKey: .priceGroupId) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.total = try container.decodeIfPresent(Decimal.self, forKey: .total) ?? Decimal(0.00)

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

        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.priceGroupId, forKey: .priceGroupId)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.total, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .total)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for order_id.
     
     - Returns:  Int
     */
    public func getOrderId() -> Int {
        return self.orderId
    }
    
    /**
     Getter for pgrp_id.
     
     - Returns:  Int
     */
    public func getPriceGroupId() -> Int {
        return self.priceGroupId
    }
    
    /**
     Getter for name.

     - Returns:  String
     */
    public func getName() -> String {
        return self.name
    }
    
    /**
     Getter for descrip.

     - Returns:  String
     */
    public func getDescription() -> String {
        return self.description
    }
    
    /**
     Getter for total.
     
     - Returns:  Decimal
     */
    public func getTotal() -> Decimal {
        return self.total
    }
}
