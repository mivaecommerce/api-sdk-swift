/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductVariantPart data model.
public class ProductVariantPart : Model {

    /// Model field product_id.
    var productId : Int

    /// Model field product_code.
    var productCode : String

    /// Model field product_name.
    var productName : String

    /// Model field product_sku.
    var productSku : String

    /// Model field quantity.
    var quantity : Int

    /// Model field offset.
    var offset : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case productCode = "product_code"
        case productName = "product_name"
        case productSku = "product_sku"
        case quantity
        case offset
    }

    /**
     ProductVariantPart Constructor.
     */
    public override init() {
        self.productId = 0
        self.productCode = ""
        self.productName = ""
        self.productSku = ""
        self.quantity = 0
        self.offset = 0

        super.init()
    }

    /**
     ProductVariantPart Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.productCode = try container.decodeIfPresent(String.self, forKey: .productCode) ?? ""
        self.productName = try container.decodeIfPresent(String.self, forKey: .productName) ?? ""
        self.productSku = try container.decodeIfPresent(String.self, forKey: .productSku) ?? ""
        self.quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? 0
        self.offset = try container.decodeIfPresent(Int.self, forKey: .offset) ?? 0

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

        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.productCode, forKey: .productCode)
        try container.encodeIfPresent(self.productName, forKey: .productName)
        try container.encodeIfPresent(self.productSku, forKey: .productSku)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.offset, forKey: .offset)

        try super.encode(to: encoder)
    }

    /**
     Getter for product_id.

     - Returns:  Int

     */
    public func getProductId() -> Int {
        return self.productId
    }

    /**
     Getter for product_code.

     - Returns:  String

     */
    public func getProductCode() -> String {
        return self.productCode
    }

    /**
     Getter for product_name.

     - Returns:  String

     */
    public func getProductName() -> String {
        return self.productName
    }

    /**
     Getter for product_sku.

     - Returns:  String

     */
    public func getProductSku() -> String {
        return self.productSku
    }

    /**
     Getter for quantity.

     - Returns:  Int

     */
    public func getQuantity() -> Int {
        return self.quantity
    }

    /**
     Getter for offset.

     - Returns:  Int

     */
    public func getOffset() -> Int {
        return self.offset
    }
}
