/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductVariantDimension data model.
public class ProductVariantDimension : Model {

    /// Model field attr_id.
    var attributeId : Int

    /// Model field attmpat_id.
    var attributeTemplateAttributeId : Int

    /// Model field option_id.
    var optionId : Int

    /// Model field option_code.
    var optionCode : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case attributeId = "attr_id"
        case attributeTemplateAttributeId = "attmpat_id"
        case optionId = "option_id"
        case optionCode = "option_code"
    }

    /**
     ProductVariantDimension Constructor.
     */
    public override init() {
        self.attributeId = 0
        self.attributeTemplateAttributeId = 0
        self.optionId = 0
        self.optionCode = ""

        super.init()
    }

    /**
     ProductVariantDimension Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.attributeId = try container.decodeIfPresent(Int.self, forKey: .attributeId) ?? 0
        self.attributeTemplateAttributeId = try container.decodeIfPresent(Int.self, forKey: .attributeTemplateAttributeId) ?? 0
        self.optionId = try container.decodeIfPresent(Int.self, forKey: .optionId) ?? 0
        self.optionCode = try container.decodeIfPresent(String.self, forKey: .optionCode) ?? ""

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
        try container.encodeIfPresent(self.optionCode, forKey: .optionCode)

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
}
