/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderItemDiscount data model.
public class OrderItemDiscount : Model {

    /// Model field order_id.
    var orderId : Int
    /// Model field line_id.
    var lineId : Int
    /// Model field pgrp_id.
    var priceGroupId : Int
    /// Model field display.
    var display : Bool
    /// Model field descrip.
    var description : String
    /// Model field discount.
    var discount : Decimal
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case lineId = "line_id"
        case priceGroupId = "pgrp_id"
        case display
        case description = "descrip"
        case discount
    }

    /**
     OrderItemDiscount Constructor.
     */
    public override init() {
        self.orderId = 0
        self.lineId = 0
        self.priceGroupId = 0
        self.display = false
        self.description = ""
        self.discount = Decimal(0.00)

        super.init()
    }

    /**
     OrderItemDiscount Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.lineId = try container.decodeIfPresent(Int.self, forKey: .lineId) ?? 0
        self.priceGroupId = try container.decodeIfPresent(Int.self, forKey: .priceGroupId) ?? 0
        self.display = try container.decodeIfPresent(Bool.self, forKey: .display) ?? false
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.discount = try container.decodeIfPresent(Decimal.self, forKey: .discount) ?? Decimal(0.00)

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
        try container.encodeIfPresent(self.lineId, forKey: .lineId)
        try container.encodeIfPresent(self.priceGroupId, forKey: .priceGroupId)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.discount, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .discount)

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
     Getter for line_id.

     - Returns:  Int

     */
    public func getLineId() -> Int {
        return self.lineId
    }

    /**
     Getter for pgrp_id.

     - Returns:  Int

     */
    public func getPriceGroupId() -> Int {
        return self.priceGroupId
    }

    /**
     Getter for display.

     - Returns:  Bool     */
    public func getDisplay() -> Bool {
        return self.display
    }

    /**
     Getter for descrip.

     - Returns:  String

     */
    public func getDescription() -> String {
        return self.description
    }

    /**
     Getter for discount.

     - Returns:  Decimal     */
    public func getDiscount() -> Decimal {
        return self.discount
    }
}
