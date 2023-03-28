/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CopyPageRulesSettings data model.
public class CopyPageRulesSettings : Model {

    /// Model field id.
    var id : Int

    /// Model field code.
    var code : String

    /// Model field assigned.
    var assigned : Bool

    /// Model field module
    var module : Module

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case code
        case assigned
        case module
    }

    /**
     CopyPageRulesSettings Constructor.
     */
    public override init() {
        self.id = 0
        self.code = ""
        self.assigned = false
        self.module = Module()

        super.init()
    }

    /**
     CopyPageRulesSettings Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.assigned = try container.decodeIfPresent(Bool.self, forKey: .assigned) ?? false
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

        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.module, forKey: .module)

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
     Getter for assigned.

     - Returns:  Bool     */
    public func getAssigned() -> Bool {
        return self.assigned
    }

    /**
     Getter for module.

     - Returns:  Module
     */
    public func getModule() -> Module {
        return self.module
    }
}
