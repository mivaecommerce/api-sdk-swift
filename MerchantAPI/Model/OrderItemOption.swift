/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderItemOption data model.
public class OrderItemOption : Model {

    /// Model field id.
    var id : Int

    /// Model field order_id.
    var orderId : Int

    /// Model field line_id.
    var lineId : Int

    /// Model field option_id.
    var optionId : Int

    /// Model field opt_code.
    var optionCode : String

    /// Model field attr_code.
    var attributeCode : Optional<String>

    /// Model field attr_id.
    var attributeId : Optional<Int>

    /// Model field attmpat_id.
    var attributeTemplateAttributeId : Optional<Int>

    /// Model field value.
    var value : Optional<String>

    /// Model field weight.
    var weight : Optional<Decimal>

    /// Model field retail.
    var retail : Optional<Decimal>

    /// Model field base_price.
    var basePrice : Optional<Decimal>

    /// Model field price.
    var price : Optional<Decimal>

    /// Model field data.
    var optionData : String

    /// Model field data_long.
    var optionDataLong : String

    /// Model field attr_prompt.
    var attributePrompt : String

    /// Model field opt_prompt.
    var optionPrompt : String

    /// Model field discounts.
    var discounts : [OrderItemOptionDiscount]

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case lineId = "line_id"
        case optionId = "option_id"
        case optionCode = "opt_code"
        case attributeCode = "attr_code"
        case attributeId = "attr_id"
        case attributeTemplateAttributeId = "attmpat_id"
        case value
        case weight
        case retail
        case basePrice = "base_price"
        case price
        case optionData = "data"
        case optionDataLong = "data_long"
        case attributePrompt = "attr_prompt"
        case optionPrompt = "opt_prompt"
        case discounts
    }

    /**
     EncodeCodingKeys used to map the model when encoding

     - SeeAlso: Codable
     */
    private enum EncodeCodingKeys: String, CodingKey {
        case attributeId  = "attr_id"
        case attributeCode  = "attr_code"
        case value      = "opt_code_or_data"
        case weight
        case price
    }

    /**
     OrderItemOption Constructor.
     */
    public override init() {
        self.id = 0
        self.orderId = 0
        self.lineId = 0
        self.optionId = 0
        self.optionCode = ""
        self.attributeCode = nil
        self.attributeId = nil
        self.attributeTemplateAttributeId = nil
        self.value = nil
        self.weight = nil
        self.retail = nil
        self.basePrice = nil
        self.price = nil
        self.optionData = ""
        self.optionDataLong = ""
        self.attributePrompt = ""
        self.optionPrompt = ""
        self.discounts = []

        super.init()
    }

    /**
     OrderItemOption Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.lineId = try container.decodeIfPresent(Int.self, forKey: .lineId) ?? 0
        self.optionId = try container.decodeIfPresent(Int.self, forKey: .optionId) ?? 0
        self.optionCode = try container.decodeIfPresent(String.self, forKey: .optionCode) ?? ""
        self.attributeCode = try container.decodeIfPresent(String.self, forKey: .attributeCode) ?? nil
        self.attributeId = try container.decodeIfPresent(Int.self, forKey: .attributeId) ?? nil
        self.attributeTemplateAttributeId = try container.decodeIfPresent(Int.self, forKey: .attributeTemplateAttributeId) ?? nil
        self.value = try container.decodeIfPresent(String.self, forKey: .value) ?? nil
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? nil
        self.retail = try container.decodeIfPresent(Decimal.self, forKey: .retail) ?? nil
        self.basePrice = try container.decodeIfPresent(Decimal.self, forKey: .basePrice) ?? nil
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? nil
        self.optionData = try container.decodeIfPresent(String.self, forKey: .optionData) ?? ""
        self.optionDataLong = try container.decodeIfPresent(String.self, forKey: .optionDataLong) ?? ""
        self.attributePrompt = try container.decodeIfPresent(String.self, forKey: .attributePrompt) ?? ""
        self.optionPrompt = try container.decodeIfPresent(String.self, forKey: .optionPrompt) ?? ""
        self.discounts = try container.decodeIfPresent([OrderItemOptionDiscount].self, forKey: .discounts) ?? []

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
        var container = encoder.container(keyedBy: EncodeCodingKeys.self)

        try container.encodeIfPresent(self.attributeId, forKey: .attributeId)
        try container.encodeIfPresent(self.attributeCode, forKey: .attributeCode)
        try container.encodeIfPresent(self.value, forKey: .value)
        try container.encodeIfPresent(self.weight, forKey: .weight)
        try container.encodeIfPresent(self.price, forKey: .price)

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
     Getter for option_id.

     - Returns:  Int

     */
    public func getOptionId() -> Int {
        return self.optionId
    }

    /**
     Getter for opt_code.

     - Returns:  String

     */
    public func getOptionCode() -> String {
        return self.optionCode
    }

    /**
     Getter for attr_code.

     - Returns:  Optional<String>

     */
    public func getAttributeCode() -> Optional<String> {
        return self.attributeCode
    }

    /**
     Getter for attr_id.

     - Returns:  Optional<Int>

     */
    public func getAttributeId() -> Optional<Int> {
        return self.attributeId
    }

    /**
     Getter for attmpat_id.

     - Returns:  Optional<Int>

     */
    public func getAttributeTemplateAttributeId() -> Optional<Int> {
        return self.attributeTemplateAttributeId
    }

    /**
     Getter for value.

     - Returns:  Optional<String>

     */
    public func getValue() -> Optional<String> {
        return self.value
    }

    /**
     Getter for weight.

     - Returns:  Optional<Decimal>     */
    public func getWeight() -> Optional<Decimal> {
        return self.weight
    }

    /**
     Getter for retail.

     - Returns:  Optional<Decimal>     */
    public func getRetail() -> Optional<Decimal> {
        return self.retail
    }

    /**
     Getter for base_price.

     - Returns:  Optional<Decimal>     */
    public func getBasePrice() -> Optional<Decimal> {
        return self.basePrice
    }

    /**
     Getter for price.

     - Returns:  Optional<Decimal>     */
    public func getPrice() -> Optional<Decimal> {
        return self.price
    }

    /**
     Getter for data.

     - Returns:  String

     */
    public func getOptionData() -> String {
        return self.optionData
    }

    /**
     Getter for data_long.

     - Returns:  String

     */
    public func getOptionDataLong() -> String {
        return self.optionDataLong
    }

    /**
     Getter for attr_prompt.

     - Returns:  String

     */
    public func getAttributePrompt() -> String {
        return self.attributePrompt
    }

    /**
     Getter for opt_prompt.

     - Returns:  String

     */
    public func getOptionPrompt() -> String {
        return self.optionPrompt
    }

    /**
     Getter for discounts.

     - Returns:  [OrderItemOptionDiscount]
     */
    public func getDiscounts() -> [OrderItemOptionDiscount] {
        return self.discounts
    }

    /**
     Setter for attr_code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeCode(_ value: String) -> Self {
        self.attributeCode = value
        return self
    }

    /**
     Setter for attr_id.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeId(_ value: Int) -> Self {
        self.attributeId = value
        return self
    }

    /**
     Setter for attmpat_id.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateAttributeId(_ value: Int) -> Self {
        self.attributeTemplateAttributeId = value
        return self
    }

    /**
     Setter for value.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setValue(_ value: String) -> Self {
        self.value = value
        return self
    }

    /**
     Setter for weight.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setWeight(_ value: Decimal) -> Self {
        self.weight = value
        return self
    }

    /**
     Setter for retail.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setRetail(_ value: Decimal) -> Self {
        self.retail = value
        return self
    }

    /**
     Setter for base_price.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setBasePrice(_ value: Decimal) -> Self {
        self.basePrice = value
        return self
    }

    /**
     Setter for price.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setPrice(_ value: Decimal) -> Self {
        self.price = value
        return self
    }
}
