/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CSSResource data model.
public class CSSResource : Model {

    /// Enumeration ResourceType
    public enum ResourceType : String {
        case Combined = "C"
        case Inline = "I"
        case External = "E"
        case Local = "L"
        case Module = "M"
        case ModuleInline = "Y"
        case ModuleManaged = "Z"
    }

    /// Model field id.
    var id : Int

    /// Model field code.
    var code : String

    /// Model field type.
    var type : String

    /// Model field is_global.
    var isGlobal : Bool

    /// Model field active.
    var active : Bool

    /// Model field file.
    var file : String

    /// Model field templ_id.
    var templateId : Int

    /// Model field attributes.
    var attributes : [CSSResourceAttribute]

    /// Model field mod_code.
    var moduleCode : String

    /// Model field mod_data.
    var moduleData : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case code
        case type
        case isGlobal = "is_global"
        case active
        case file
        case templateId = "templ_id"
        case attributes
        case moduleCode = "mod_code"
        case moduleData = "mod_data"
    }

    /**
     CSSResource Constructor.
     */
    public override init() {
        self.id = 0
        self.code = ""
        self.type = ""
        self.isGlobal = false
        self.active = false
        self.file = ""
        self.templateId = 0
        self.attributes = []
        self.moduleCode = ""
        self.moduleData = ""

        super.init()
    }

    /**
     CSSResource Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.isGlobal = try container.decodeIfPresent(Bool.self, forKey: .isGlobal) ?? false
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false
        self.file = try container.decodeIfPresent(String.self, forKey: .file) ?? ""
        self.templateId = try container.decodeIfPresent(Int.self, forKey: .templateId) ?? 0
        self.attributes = try container.decodeIfPresent([CSSResourceAttribute].self, forKey: .attributes) ?? []
        self.moduleCode = try container.decodeIfPresent(String.self, forKey: .moduleCode) ?? ""
        self.moduleData = try container.decodeIfPresent(String.self, forKey: .moduleData) ?? ""

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
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.isGlobal, forKey: .isGlobal)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(self.file, forKey: .file)
        try container.encodeIfPresent(self.templateId, forKey: .templateId)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)
        try container.encodeIfPresent(self.moduleCode, forKey: .moduleCode)
        try container.encodeIfPresent(self.moduleData, forKey: .moduleData)

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

     - Returns:  Optional<ResourceType>
     */
    public func getType() -> Optional<ResourceType> {
        return ResourceType(rawValue: self.type) ?? nil
    }

    /**
     Getter for is_global.

     - Returns:  Bool     */
    public func getIsGlobal() -> Bool {
        return self.isGlobal
    }

    /**
     Getter for active.

     - Returns:  Bool     */
    public func getActive() -> Bool {
        return self.active
    }

    /**
     Getter for file.

     - Returns:  String

     */
    public func getFile() -> String {
        return self.file
    }

    /**
     Getter for templ_id.

     - Returns:  Int

     */
    public func getTemplateId() -> Int {
        return self.templateId
    }

    /**
     Getter for attributes.

     - Returns:  [CSSResourceAttribute]
     */
    public func getAttributes() -> [CSSResourceAttribute] {
        return self.attributes
    }

    /**
     Getter for mod_code.

     - Returns:  String

     */
    public func getModuleCode() -> String {
        return self.moduleCode
    }

    /**
     Getter for mod_data.

     - Returns:  String

     */
    public func getModuleData() -> String {
        return self.moduleData
    }
}
