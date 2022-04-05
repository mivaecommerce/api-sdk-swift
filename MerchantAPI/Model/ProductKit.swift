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
    var attrId : Int

    /// Model field attr_type.
    var attrType : String

    /// Model field attr_code.
    var attrCode : String

    /// Model field attr_prompt.
    var attrPrompt : String

    /// Model field attmpat_id.
    var attmpatId : Int

    /// Model field option_id.
    var optionId : Int

    /// Model field option_code.
    var optionCode : String

    /// Model field option_prompt.
    var optionPrompt : String

    /// Model field parts.
    var parts : [ProductKitPart]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case attrId = "attr_id"
        case attrType = "attr_type"
        case attrCode = "attr_code"
        case attrPrompt = "attr_prompt"
        case attmpatId = "attmpat_id"
        case optionId = "option_id"
        case optionCode = "option_code"
        case optionPrompt = "option_prompt"
        case parts
    }

    /**
     ProductKit Constructor.
     */
    public override init() {
        self.attrId = 0
        self.attrType = ""
        self.attrCode = ""
        self.attrPrompt = ""
        self.attmpatId = 0
        self.optionId = 0
        self.optionCode = ""
        self.optionPrompt = ""
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

        self.attrId = try container.decodeIfPresent(Int.self, forKey: .attrId) ?? 0
        self.attrType = try container.decodeIfPresent(String.self, forKey: .attrType) ?? ""
        self.attrCode = try container.decodeIfPresent(String.self, forKey: .attrCode) ?? ""
        self.attrPrompt = try container.decodeIfPresent(String.self, forKey: .attrPrompt) ?? ""
        self.attmpatId = try container.decodeIfPresent(Int.self, forKey: .attmpatId) ?? 0
        self.optionId = try container.decodeIfPresent(Int.self, forKey: .optionId) ?? 0
        self.optionCode = try container.decodeIfPresent(String.self, forKey: .optionCode) ?? ""
        self.optionPrompt = try container.decodeIfPresent(String.self, forKey: .optionPrompt) ?? ""
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

        try container.encodeIfPresent(self.attrId, forKey: .attrId)
        try container.encodeIfPresent(self.attrType, forKey: .attrType)
        try container.encodeIfPresent(self.attrCode, forKey: .attrCode)
        try container.encodeIfPresent(self.attrPrompt, forKey: .attrPrompt)
        try container.encodeIfPresent(self.attmpatId, forKey: .attmpatId)
        try container.encodeIfPresent(self.optionId, forKey: .optionId)
        try container.encodeIfPresent(self.optionCode, forKey: .optionCode)
        try container.encodeIfPresent(self.optionPrompt, forKey: .optionPrompt)
        try container.encodeIfPresent(self.parts, forKey: .parts)

        try super.encode(to: encoder)
    }

    /**
     Getter for attr_id.

     - Returns:  Int

     */
    public func getAttrId() -> Int {
        return self.attrId
    }

    /**
     Getter for attr_type.

     - Returns:  String

     */
    public func getAttrType() -> String {
        return self.attrType
    }

    /**
     Getter for attr_code.

     - Returns:  String

     */
    public func getAttrCode() -> String {
        return self.attrCode
    }

    /**
     Getter for attr_prompt.

     - Returns:  String

     */
    public func getAttrPrompt() -> String {
        return self.attrPrompt
    }

    /**
     Getter for attmpat_id.

     - Returns:  Int

     */
    public func getAttmpatId() -> Int {
        return self.attmpatId
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
     Getter for parts.

     - Returns:  [ProductKitPart]
     */
    public func getParts() -> [ProductKitPart] {
        return self.parts
    }
}
