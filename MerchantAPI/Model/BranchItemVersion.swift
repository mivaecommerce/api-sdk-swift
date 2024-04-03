/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// BranchItemVersion data model.
public class BranchItemVersion : Model {

    /// Model field id.
    var id : Int

    /// Model field item_id.
    var itemId : Int

    /// Model field user_id.
    var userId : Int

    /// Model field user_name.
    var userName : String

    /// Model field user_icon.
    var userIcon : String

    /// Model field code.
    var code : String

    /// Model field mod_code.
    var moduleCode : String

    /// Model field module
    var module : Module

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case itemId = "item_id"
        case userId = "user_id"
        case userName = "user_name"
        case userIcon = "user_icon"
        case code
        case moduleCode = "mod_code"
        case module
    }

    /**
     BranchItemVersion Constructor.
     */
    public override init() {
        self.id = 0
        self.itemId = 0
        self.userId = 0
        self.userName = ""
        self.userIcon = ""
        self.code = ""
        self.moduleCode = ""
        self.module = Module()

        super.init()
    }

    /**
     BranchItemVersion Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.itemId = try container.decodeIfPresent(Int.self, forKey: .itemId) ?? 0
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName) ?? ""
        self.userIcon = try container.decodeIfPresent(String.self, forKey: .userIcon) ?? ""
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.moduleCode = try container.decodeIfPresent(String.self, forKey: .moduleCode) ?? ""
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
        try container.encodeIfPresent(self.itemId, forKey: .itemId)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.userName, forKey: .userName)
        try container.encodeIfPresent(self.userIcon, forKey: .userIcon)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.moduleCode, forKey: .moduleCode)
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
     Getter for item_id.

     - Returns:  Int

     */
    public func getItemId() -> Int {
        return self.itemId
    }

    /**
     Getter for user_id.

     - Returns:  Int

     */
    public func getUserId() -> Int {
        return self.userId
    }

    /**
     Getter for user_name.

     - Returns:  String

     */
    public func getUserName() -> String {
        return self.userName
    }

    /**
     Getter for user_icon.

     - Returns:  String

     */
    public func getUserIcon() -> String {
        return self.userIcon
    }

    /**
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for mod_code.

     - Returns:  String

     */
    public func getModuleCode() -> String {
        return self.moduleCode
    }

    /**
     Getter for module.

     - Returns:  Module
     */
    public func getModule() -> Module {
        return self.module
    }
}
