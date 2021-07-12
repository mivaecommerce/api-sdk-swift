/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductInventoryAdjustment data model.
public class ProductInventoryAdjustment : Model {

    /// Model field product_id.
    var productId : Optional<Int>
    /// Model field product_code.
    var productCode : Optional<String>
    /// Model field product_sku.
    var productSku : Optional<String>
    /// Model field adjustment.
    var adjustment : Decimal
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case productCode = "product_code"
        case productSku = "product_sku"
        case adjustment
    }

    /**
     ProductInventoryAdjustment Constructor.
     */
    public override init() {
        self.productId = nil
        self.productCode = nil
        self.productSku = nil
        self.adjustment = Decimal(0.00)

        super.init()
    }

    /**
     ProductInventoryAdjustment Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? nil
        self.productCode = try container.decodeIfPresent(String.self, forKey: .productCode) ?? nil
        self.productSku = try container.decodeIfPresent(String.self, forKey: .productSku) ?? nil
        self.adjustment = try container.decodeIfPresent(Decimal.self, forKey: .adjustment) ?? Decimal(0.00)

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
        try container.encodeIfPresent(self.productSku, forKey: .productSku)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.adjustment, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .adjustment)

        try super.encode(to: encoder)
    }

    /**
     Getter for product_id.

     - Returns:  Optional<Int>

     */
    public func getProductId() -> Optional<Int> {
        return self.productId
    }

    /**
     Getter for product_code.

     - Returns:  Optional<String>

     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
    }

    /**
     Getter for product_sku.

     - Returns:  Optional<String>

     */
    public func getProductSku() -> Optional<String> {
        return self.productSku
    }

    /**
     Getter for adjustment.

     - Returns:  Decimal     */
    public func getAdjustment() -> Decimal {
        return self.adjustment
    }

    /**
     Setter for product_id.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductId(_ value: Int) -> Self {
        self.productId = value
        return self
    }

    /**
     Setter for product_code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setProductCode(_ value: String) -> Self {
        self.productCode = value
        return self
    }

    /**
     Setter for product_sku.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setProductSku(_ value: String) -> Self {
        self.productSku = value
        return self
    }

    /**
     Setter for adjustment.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setAdjustment(_ value: Decimal) -> Self {
        self.adjustment = value
        return self
    }
}
