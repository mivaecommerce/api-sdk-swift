/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// VariantAttribute data model.
public class VariantAttribute : Model {

    /// Model field attr_id.
    var attributeId : Optional<Int>

    /// Model field attmpat_id.
    var attributeTemplateAttributeId : Optional<Int>

    /// Model field option_id.
    var optionId : Optional<Int>

    /// Model field attr_code.
    var attributeCode : Optional<String>

    /// Model field attmpat_code.
    var attributeTemplateAttributeCode : Optional<String>

    /// Model field option_code.
    var optionCode : Optional<String>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case attributeId = "attr_id"
        case attributeTemplateAttributeId = "attmpat_id"
        case optionId = "option_id"
        case attributeCode = "attr_code"
        case attributeTemplateAttributeCode = "attmpat_code"
        case optionCode = "option_code"
    }

    /**
     VariantAttribute Constructor.
     */
    public override init() {
        self.attributeId = nil
        self.attributeTemplateAttributeId = nil
        self.optionId = nil
        self.attributeCode = nil
        self.attributeTemplateAttributeCode = nil
        self.optionCode = nil

        super.init()
    }

    /**
     VariantAttribute Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.attributeId = try container.decodeIfPresent(Int.self, forKey: .attributeId) ?? nil
        self.attributeTemplateAttributeId = try container.decodeIfPresent(Int.self, forKey: .attributeTemplateAttributeId) ?? nil
        self.optionId = try container.decodeIfPresent(Int.self, forKey: .optionId) ?? nil
        self.attributeCode = try container.decodeIfPresent(String.self, forKey: .attributeCode) ?? nil
        self.attributeTemplateAttributeCode = try container.decodeIfPresent(String.self, forKey: .attributeTemplateAttributeCode) ?? nil
        self.optionCode = try container.decodeIfPresent(String.self, forKey: .optionCode) ?? nil

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
        try container.encodeIfPresent(self.attributeTemplateAttributeId, forKey: .attributeTemplateAttributeId)
        try container.encodeIfPresent(self.optionId, forKey: .optionId)
        try container.encodeIfPresent(self.attributeCode, forKey: .attributeCode)
        try container.encodeIfPresent(self.attributeTemplateAttributeCode, forKey: .attributeTemplateAttributeCode)
        try container.encodeIfPresent(self.optionCode, forKey: .optionCode)

        try super.encode(to: encoder)
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
     Getter for option_id.

     - Returns:  Optional<Int>

     */
    public func getOptionId() -> Optional<Int> {
        return self.optionId
    }

    /**
     Getter for attr_code.

     - Returns:  Optional<String>

     */
    public func getAttributeCode() -> Optional<String> {
        return self.attributeCode
    }

    /**
     Getter for attmpat_code.

     - Returns:  Optional<String>

     */
    public func getAttributeTemplateAttributeCode() -> Optional<String> {
        return self.attributeTemplateAttributeCode
    }

    /**
     Getter for option_code.

     - Returns:  Optional<String>

     */
    public func getOptionCode() -> Optional<String> {
        return self.optionCode
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
     Setter for option_id.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOptionId(_ value: Int) -> Self {
        self.optionId = value
        return self
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
     Setter for attmpat_code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateAttributeCode(_ value: String) -> Self {
        self.attributeTemplateAttributeCode = value
        return self
    }

    /**
     Setter for option_code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setOptionCode(_ value: String) -> Self {
        self.optionCode = value
        return self
    }
}
