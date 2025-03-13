/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// AttributeTemplateAttribute data model.
public class AttributeTemplateAttribute : Model {

    /// Enumeration TemplateAttributeType
    public enum TemplateAttributeType : String {
        case Checkbox = "checkbox"
        case Radio = "radio"
        case Text = "text"
        case Select = "select"
        case Memo = "memo"
        case Template = "template"
        case SwatchSelect = "swatch-select"
    }

    /// Model field id.
    var id : Int

    /// Model field attemp_id.
    var attributeTemplateId : Int

    /// Model field default_id.
    var defaultId : Int

    /// Model field disp_order.
    var displayOrder : Int

    /// Model field code.
    var code : String

    /// Model field type.
    var type : String

    /// Model field prompt.
    var prompt : String

    /// Model field price.
    var price : Decimal

    /// Model field cost.
    var cost : Decimal

    /// Model field weight.
    var weight : Decimal

    /// Model field formatted_price.
    var formattedPrice : String

    /// Model field formatted_cost.
    var formattedCost : String

    /// Model field formatted_weight.
    var formattedWeight : String

    /// Model field required.
    var required : Bool

    /// Model field inventory.
    var inventory : Bool

    /// Model field image.
    var image : String

    /// Model field options.
    var options : [AttributeTemplateOption]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case attributeTemplateId = "attemp_id"
        case defaultId = "default_id"
        case displayOrder = "disp_order"
        case code
        case type
        case prompt
        case price
        case cost
        case weight
        case formattedPrice = "formatted_price"
        case formattedCost = "formatted_cost"
        case formattedWeight = "formatted_weight"
        case required
        case inventory
        case image
        case options
    }

    /**
     AttributeTemplateAttribute Constructor.
     */
    public override init() {
        self.id = 0
        self.attributeTemplateId = 0
        self.defaultId = 0
        self.displayOrder = 0
        self.code = ""
        self.type = ""
        self.prompt = ""
        self.price = Decimal(0.00)
        self.cost = Decimal(0.00)
        self.weight = Decimal(0.00)
        self.formattedPrice = ""
        self.formattedCost = ""
        self.formattedWeight = ""
        self.required = false
        self.inventory = false
        self.image = ""
        self.options = []

        super.init()
    }

    /**
     AttributeTemplateAttribute Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.attributeTemplateId = try container.decodeIfPresent(Int.self, forKey: .attributeTemplateId) ?? 0
        self.defaultId = try container.decodeIfPresent(Int.self, forKey: .defaultId) ?? 0
        self.displayOrder = try container.decodeIfPresent(Int.self, forKey: .displayOrder) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt) ?? ""
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? Decimal(0.00)
        self.cost = try container.decodeIfPresent(Decimal.self, forKey: .cost) ?? Decimal(0.00)
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? Decimal(0.00)
        self.formattedPrice = try container.decodeIfPresent(String.self, forKey: .formattedPrice) ?? ""
        self.formattedCost = try container.decodeIfPresent(String.self, forKey: .formattedCost) ?? ""
        self.formattedWeight = try container.decodeIfPresent(String.self, forKey: .formattedWeight) ?? ""
        self.required = try container.decodeIfPresent(Bool.self, forKey: .required) ?? false
        self.inventory = try container.decodeIfPresent(Bool.self, forKey: .inventory) ?? false
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.options = try container.decodeIfPresent([AttributeTemplateOption].self, forKey: .options) ?? []

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
        try container.encodeIfPresent(self.attributeTemplateId, forKey: .attributeTemplateId)
        try container.encodeIfPresent(self.defaultId, forKey: .defaultId)
        try container.encodeIfPresent(self.displayOrder, forKey: .displayOrder)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: 8), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: 8), forKey: .cost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: 8), forKey: .weight)
        try container.encodeIfPresent(self.formattedPrice, forKey: .formattedPrice)
        try container.encodeIfPresent(self.formattedCost, forKey: .formattedCost)
        try container.encodeIfPresent(self.formattedWeight, forKey: .formattedWeight)
        try container.encodeIfPresent(self.required, forKey: .required)
        try container.encodeIfPresent(self.inventory, forKey: .inventory)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.options, forKey: .options)

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
     Getter for attemp_id.

     - Returns:  Int

     */
    public func getAttributeTemplateId() -> Int {
        return self.attributeTemplateId
    }

    /**
     Getter for default_id.

     - Returns:  Int

     */
    public func getDefaultId() -> Int {
        return self.defaultId
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
     Getter for type.

     - Returns:  String

     */
    public func getType() -> String {
        return self.type
    }

    /**
     Enum Getter for type.

     - Returns:  Optional<TemplateAttributeType>
     */
    public func getType() -> Optional<TemplateAttributeType> {
        return TemplateAttributeType(rawValue: self.type) ?? nil
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
     Getter for formatted_price.

     - Returns:  String

     */
    public func getFormattedPrice() -> String {
        return self.formattedPrice
    }

    /**
     Getter for formatted_cost.

     - Returns:  String

     */
    public func getFormattedCost() -> String {
        return self.formattedCost
    }

    /**
     Getter for formatted_weight.

     - Returns:  String

     */
    public func getFormattedWeight() -> String {
        return self.formattedWeight
    }

    /**
     Getter for required.

     - Returns:  Bool     */
    public func getRequired() -> Bool {
        return self.required
    }

    /**
     Getter for inventory.

     - Returns:  Bool     */
    public func getInventory() -> Bool {
        return self.inventory
    }

    /**
     Getter for image.

     - Returns:  String

     */
    public func getImage() -> String {
        return self.image
    }

    /**
     Getter for options.

     - Returns:  [AttributeTemplateOption]
     */
    public func getOptions() -> [AttributeTemplateOption] {
        return self.options
    }
}
