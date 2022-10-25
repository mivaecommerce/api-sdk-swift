/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductVariantExclusion data model.
public class ProductVariantExclusion : Model {

    /// Model field attr_id.
    var attributeId : Optional<Int>

    /// Model field attmpat_id.
    var attributeTemplateId : Optional<Int>

    /// Model field option_id.
    var optionId : Optional<Int>

    /// Model field attr_code.
    var attributeCode : Optional<String>

    /// Model field attmpat_code.
    var attributeTemplateCode : Optional<String>

    /// Model field option_code.
    var optionCode : Optional<String>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case attributeId = "attr_id"
        case attributeTemplateId = "attmpat_id"
        case optionId = "option_id"
        case attributeCode = "attr_code"
        case attributeTemplateCode = "attmpat_code"
        case optionCode = "option_code"
    }

    /**
     ProductVariantExclusion Constructor.
     */
    public override init() {
        self.attributeId = nil
        self.attributeTemplateId = nil
        self.optionId = nil
        self.attributeCode = nil
        self.attributeTemplateCode = nil
        self.optionCode = nil

        super.init()
    }

    /**
     ProductVariantExclusion Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.attributeId = try container.decodeIfPresent(Int.self, forKey: .attributeId) ?? nil
        self.attributeTemplateId = try container.decodeIfPresent(Int.self, forKey: .attributeTemplateId) ?? nil
        self.optionId = try container.decodeIfPresent(Int.self, forKey: .optionId) ?? nil
        self.attributeCode = try container.decodeIfPresent(String.self, forKey: .attributeCode) ?? nil
        self.attributeTemplateCode = try container.decodeIfPresent(String.self, forKey: .attributeTemplateCode) ?? nil
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
        try container.encodeIfPresent(self.attributeTemplateId, forKey: .attributeTemplateId)
        try container.encodeIfPresent(self.optionId, forKey: .optionId)
        try container.encodeIfPresent(self.attributeCode, forKey: .attributeCode)
        try container.encodeIfPresent(self.attributeTemplateCode, forKey: .attributeTemplateCode)
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
    public func getAttributeTemplateId() -> Optional<Int> {
        return self.attributeTemplateId
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
    public func getAttributeTemplateCode() -> Optional<String> {
        return self.attributeTemplateCode
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
    public func setAttributeTemplateId(_ value: Int) -> Self {
        self.attributeTemplateId = value
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
    public func setAttributeTemplateCode(_ value: String) -> Self {
        self.attributeTemplateCode = value
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
