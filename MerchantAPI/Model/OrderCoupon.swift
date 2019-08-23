/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// OrderCoupon data model.
public class OrderCoupon : Model {

    /// Model field order_id.
    var orderId : Int

    /// Model field coupon_id.
    var couponId : Int

    /// Model field code.
    var code : String

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
        case couponId = "coupon_id"
        case code
        case description = "descrip"
        case total
    }

    /**
     OrderCoupon Constructor.
     */
    public override init() {
        self.orderId = 0
        self.couponId = 0
        self.code = ""
        self.description = ""
        self.total = Decimal(0.00)

        super.init()
    }

    /**
     OrderCoupon Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.couponId = try container.decodeIfPresent(Int.self, forKey: .couponId) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
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
        try container.encodeIfPresent(self.couponId, forKey: .couponId)
        try container.encodeIfPresent(self.code, forKey: .code)
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
     Getter for coupon_id.
     
     - Returns:  Int
     */
    public func getCouponId() -> Int {
        return self.couponId
    }
    
    /**
     Getter for code.

     - Returns:  String
     */
    public func getCode() -> String {
        return self.code
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
