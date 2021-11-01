/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderPart data model.
public class OrderPart : Model {

    /// Model field code.
    var code : String
    /// Model field sku.
    var sku : String
    /// Model field name.
    var name : String
    /// Model field quantity.
    var quantity : Int
    /// Model field total_quantity.
    var totalQuantity : Int
    /// Model field price.
    var price : Decimal
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case code
        case sku
        case name
        case quantity
        case totalQuantity = "total_quantity"
        case price
    }

    /**
     OrderPart Constructor.
     */
    public override init() {
        self.code = ""
        self.sku = ""
        self.name = ""
        self.quantity = 0
        self.totalQuantity = 0
        self.price = Decimal(0.00)

        super.init()
    }

    /**
     OrderPart Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.sku = try container.decodeIfPresent(String.self, forKey: .sku) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? 0
        self.totalQuantity = try container.decodeIfPresent(Int.self, forKey: .totalQuantity) ?? 0
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? Decimal(0.00)

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

        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.sku, forKey: .sku)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.totalQuantity, forKey: .totalQuantity)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .price)

        try super.encode(to: encoder)
    }

    /**
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for sku.

     - Returns:  String

     */
    public func getSku() -> String {
        return self.sku
    }

    /**
     Getter for name.

     - Returns:  String

     */
    public func getName() -> String {
        return self.name
    }

    /**
     Getter for quantity.

     - Returns:  Int

     */
    public func getQuantity() -> Int {
        return self.quantity
    }

    /**
     Getter for total_quantity.

     - Returns:  Int

     */
    public func getTotalQuantity() -> Int {
        return self.totalQuantity
    }

    /**
     Getter for price.

     - Returns:  Decimal     */
    public func getPrice() -> Decimal {
        return self.price
    }
}
