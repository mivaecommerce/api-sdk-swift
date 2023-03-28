/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CopyProductRulesCustomField data model.
public class CopyProductRulesCustomField : Model {

    /// Model field rules_id.
    var rulesId : Int

    /// Model field assigned.
    var assigned : Bool

    /// Model field field_code.
    var fieldCode : String

    /// Model field field_name.
    var fieldName : String

    /// Model field module
    var module : Module

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case rulesId = "rules_id"
        case assigned
        case fieldCode = "field_code"
        case fieldName = "field_name"
        case module
    }

    /**
     CopyProductRulesCustomField Constructor.
     */
    public override init() {
        self.rulesId = 0
        self.assigned = false
        self.fieldCode = ""
        self.fieldName = ""
        self.module = Module()

        super.init()
    }

    /**
     CopyProductRulesCustomField Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.rulesId = try container.decodeIfPresent(Int.self, forKey: .rulesId) ?? 0
        self.assigned = try container.decodeIfPresent(Bool.self, forKey: .assigned) ?? false
        self.fieldCode = try container.decodeIfPresent(String.self, forKey: .fieldCode) ?? ""
        self.fieldName = try container.decodeIfPresent(String.self, forKey: .fieldName) ?? ""
        self.module = try container.decodeIfPresent(Module.self, forKey: .module) ?? Module()

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

        try container.encodeIfPresent(self.rulesId, forKey: .rulesId)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.fieldCode, forKey: .fieldCode)
        try container.encodeIfPresent(self.fieldName, forKey: .fieldName)
        try container.encodeIfPresent(self.module, forKey: .module)

        try super.encode(to: encoder)
    }

    /**
     Getter for rules_id.

     - Returns:  Int

     */
    public func getRulesId() -> Int {
        return self.rulesId
    }

    /**
     Getter for assigned.

     - Returns:  Bool     */
    public func getAssigned() -> Bool {
        return self.assigned
    }

    /**
     Getter for field_code.

     - Returns:  String

     */
    public func getFieldCode() -> String {
        return self.fieldCode
    }

    /**
     Getter for field_name.

     - Returns:  String

     */
    public func getFieldName() -> String {
        return self.fieldName
    }

    /**
     Getter for module.

     - Returns:  Module
     */
    public func getModule() -> Module {
        return self.module
    }
}
