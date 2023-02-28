/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductKit data model.
public class ProductKit : Model {

    /// Model field attr_id.
    var attributeId : Int

    /// Model field attr_type.
    var attributeType : String

    /// Model field attr_code.
    var attributeCode : String

    /// Model field attr_prompt.
    var attributePrompt : String

    /// Model field attmpat_id.
    var attributeTemplateAttributeId : Int

    /// Model field option_id.
    var optionId : Int

    /// Model field option_code.
    var optionCode : String

    /// Model field option_prompt.
    var optionPrompt : String

    /// Model field option_disp_order.
    var optionDisplayOrder : Int

    /// Model field parts.
    var parts : [ProductKitPart]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case attributeId = "attr_id"
        case attributeType = "attr_type"
        case attributeCode = "attr_code"
        case attributePrompt = "attr_prompt"
        case attributeTemplateAttributeId = "attmpat_id"
        case optionId = "option_id"
        case optionCode = "option_code"
        case optionPrompt = "option_prompt"
        case optionDisplayOrder = "option_disp_order"
        case parts
    }

    /**
     ProductKit Constructor.
     */
    public override init() {
        self.attributeId = 0
        self.attributeType = ""
        self.attributeCode = ""
        self.attributePrompt = ""
        self.attributeTemplateAttributeId = 0
        self.optionId = 0
        self.optionCode = ""
        self.optionPrompt = ""
        self.optionDisplayOrder = 0
        self.parts = []

        super.init()
    }

    /**
     ProductKit Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.attributeId = try container.decodeIfPresent(Int.self, forKey: .attributeId) ?? 0
        self.attributeType = try container.decodeIfPresent(String.self, forKey: .attributeType) ?? ""
        self.attributeCode = try container.decodeIfPresent(String.self, forKey: .attributeCode) ?? ""
        self.attributePrompt = try container.decodeIfPresent(String.self, forKey: .attributePrompt) ?? ""
        self.attributeTemplateAttributeId = try container.decodeIfPresent(Int.self, forKey: .attributeTemplateAttributeId) ?? 0
        self.optionId = try container.decodeIfPresent(Int.self, forKey: .optionId) ?? 0
        self.optionCode = try container.decodeIfPresent(String.self, forKey: .optionCode) ?? ""
        self.optionPrompt = try container.decodeIfPresent(String.self, forKey: .optionPrompt) ?? ""
        self.optionDisplayOrder = try container.decodeIfPresent(Int.self, forKey: .optionDisplayOrder) ?? 0
        self.parts = try container.decodeIfPresent([ProductKitPart].self, forKey: .parts) ?? []

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

        try container.encodeIfPresent(self.attributeId, forKey: .attributeId)
        try container.encodeIfPresent(self.attributeType, forKey: .attributeType)
        try container.encodeIfPresent(self.attributeCode, forKey: .attributeCode)
        try container.encodeIfPresent(self.attributePrompt, forKey: .attributePrompt)
        try container.encodeIfPresent(self.attributeTemplateAttributeId, forKey: .attributeTemplateAttributeId)
        try container.encodeIfPresent(self.optionId, forKey: .optionId)
        try container.encodeIfPresent(self.optionCode, forKey: .optionCode)
        try container.encodeIfPresent(self.optionPrompt, forKey: .optionPrompt)
        try container.encodeIfPresent(self.optionDisplayOrder, forKey: .optionDisplayOrder)
        try container.encodeIfPresent(self.parts, forKey: .parts)

        try super.encode(to: encoder)
    }

    /**
     Getter for attr_id.

     - Returns:  Int

     */
    public func getAttributeId() -> Int {
        return self.attributeId
    }

    /**
     Getter for attr_type.

     - Returns:  String

     */
    public func getAttributeType() -> String {
        return self.attributeType
    }

    /**
     Getter for attr_code.

     - Returns:  String

     */
    public func getAttributeCode() -> String {
        return self.attributeCode
    }

    /**
     Getter for attr_prompt.

     - Returns:  String

     */
    public func getAttributePrompt() -> String {
        return self.attributePrompt
    }

    /**
     Getter for attmpat_id.

     - Returns:  Int

     */
    public func getAttributeTemplateAttributeId() -> Int {
        return self.attributeTemplateAttributeId
    }

    /**
     Getter for option_id.

     - Returns:  Int

     */
    public func getOptionId() -> Int {
        return self.optionId
    }

    /**
     Getter for option_code.

     - Returns:  String

     */
    public func getOptionCode() -> String {
        return self.optionCode
    }

    /**
     Getter for option_prompt.

     - Returns:  String

     */
    public func getOptionPrompt() -> String {
        return self.optionPrompt
    }

    /**
     Getter for option_disp_order.

     - Returns:  Int

     */
    public func getOptionDisplayOrder() -> Int {
        return self.optionDisplayOrder
    }

    /**
     Getter for parts.

     - Returns:  [ProductKitPart]
     */
    public func getParts() -> [ProductKitPart] {
        return self.parts
    }
}
