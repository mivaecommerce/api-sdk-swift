/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductAttributeListOption data model.
public class ProductAttributeListOption : Model {

    /// Model field id.
    var id : Int

    /// Model field product_id.
    var productId : Int

    /// Model field attr_id.
    var attributeId : Int

    /// Model field attemp_id.
    var attributeTemplateId : Int

    /// Model field attmpat_id.
    var attributeTemplateAttributeId : Int

    /// Model field disp_order.
    var displayOrder : Int

    /// Model field code.
    var code : String

    /// Model field prompt.
    var prompt : String

    /// Model field price.
    var price : Decimal

    /// Model field cost.
    var cost : Decimal

    /// Model field weight.
    var weight : Decimal

    /// Model field image.
    var image : String

    /// Model field default_opt.
    var defaultOption : Bool

    /// Model field has_variant_parts.
    var hasVariantParts : Bool

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case productId = "product_id"
        case attributeId = "attr_id"
        case attributeTemplateId = "attemp_id"
        case attributeTemplateAttributeId = "attmpat_id"
        case displayOrder = "disp_order"
        case code
        case prompt
        case price
        case cost
        case weight
        case image
        case defaultOption = "default_opt"
        case hasVariantParts = "has_variant_parts"
    }

    /**
     ProductAttributeListOption Constructor.
     */
    public override init() {
        self.id = 0
        self.productId = 0
        self.attributeId = 0
        self.attributeTemplateId = 0
        self.attributeTemplateAttributeId = 0
        self.displayOrder = 0
        self.code = ""
        self.prompt = ""
        self.price = Decimal(0.00)
        self.cost = Decimal(0.00)
        self.weight = Decimal(0.00)
        self.image = ""
        self.defaultOption = false
        self.hasVariantParts = false

        super.init()
    }

    /**
     ProductAttributeListOption Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.attributeId = try container.decodeIfPresent(Int.self, forKey: .attributeId) ?? 0
        self.attributeTemplateId = try container.decodeIfPresent(Int.self, forKey: .attributeTemplateId) ?? 0
        self.attributeTemplateAttributeId = try container.decodeIfPresent(Int.self, forKey: .attributeTemplateAttributeId) ?? 0
        self.displayOrder = try container.decodeIfPresent(Int.self, forKey: .displayOrder) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt) ?? ""
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? Decimal(0.00)
        self.cost = try container.decodeIfPresent(Decimal.self, forKey: .cost) ?? Decimal(0.00)
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? Decimal(0.00)
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.defaultOption = try container.decodeIfPresent(Bool.self, forKey: .defaultOption) ?? false
        self.hasVariantParts = try container.decodeIfPresent(Bool.self, forKey: .hasVariantParts) ?? false

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

        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.attributeId, forKey: .attributeId)
        try container.encodeIfPresent(self.attributeTemplateId, forKey: .attributeTemplateId)
        try container.encodeIfPresent(self.attributeTemplateAttributeId, forKey: .attributeTemplateAttributeId)
        try container.encodeIfPresent(self.displayOrder, forKey: .displayOrder)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: 8), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: 8), forKey: .cost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: 8), forKey: .weight)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.defaultOption, forKey: .defaultOption)
        try container.encodeIfPresent(self.hasVariantParts, forKey: .hasVariantParts)

        try super.encode(to: encoder)
    }

    /**
     Getter for id.

     - Returns:  Int

     */
    public func getId() -> Int {
        return self.id
    }

    /**
     Getter for product_id.

     - Returns:  Int

     */
    public func getProductId() -> Int {
        return self.productId
    }

    /**
     Getter for attr_id.

     - Returns:  Int

     */
    public func getAttributeId() -> Int {
        return self.attributeId
    }

    /**
     Getter for attemp_id.

     - Returns:  Int

     */
    public func getAttributeTemplateId() -> Int {
        return self.attributeTemplateId
    }

    /**
     Getter for attmpat_id.

     - Returns:  Int

     */
    public func getAttributeTemplateAttributeId() -> Int {
        return self.attributeTemplateAttributeId
    }

    /**
     Getter for disp_order.

     - Returns:  Int

     */
    public func getDisplayOrder() -> Int {
        return self.displayOrder
    }

    /**
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for prompt.

     - Returns:  String

     */
    public func getPrompt() -> String {
        return self.prompt
    }

    /**
     Getter for price.

     - Returns:  Decimal     */
    public func getPrice() -> Decimal {
        return self.price
    }

    /**
     Getter for cost.

     - Returns:  Decimal     */
    public func getCost() -> Decimal {
        return self.cost
    }

    /**
     Getter for weight.

     - Returns:  Decimal     */
    public func getWeight() -> Decimal {
        return self.weight
    }

    /**
     Getter for image.

     - Returns:  String

     */
    public func getImage() -> String {
        return self.image
    }

    /**
     Getter for default_opt.

     - Returns:  Bool     */
    public func getDefaultOption() -> Bool {
        return self.defaultOption
    }

    /**
     Getter for has_variant_parts.

     - Returns:  Bool     */
    public func getHasVariantParts() -> Bool {
        return self.hasVariantParts
    }
}
