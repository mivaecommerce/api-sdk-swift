/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: OrderCustomField.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/// OrderCustomField data model.
public class OrderCustomField : Model {

    /// Model field code.
    var code : String

    /// Model field name.
    var name : String

    /// Model field type.
    var type : String

    /// Model field searchable.
    var searchable : Bool

    /// Model field sortable.
    var sortable : Bool

    /// Model field module
    var module : Module

    /// Model field choices.
    var choices : [String]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case code
        case name
        case type
        case searchable
        case sortable
        case module
        case choices
    }

    /**
     OrderCustomField Constructor.
     */
    public override init() {
        self.code = ""
        self.name = ""
        self.type = ""
        self.searchable = false
        self.sortable = false
        self.module = Module()
        self.choices = []

        super.init()
    }

    /**
     OrderCustomField Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.searchable = try container.decodeIfPresent(Bool.self, forKey: .searchable) ?? false
        self.sortable = try container.decodeIfPresent(Bool.self, forKey: .sortable) ?? false
        self.module = try container.decodeIfPresent(Module.self, forKey: .module) ?? Module()
        self.choices = try container.decodeIfPresent([String].self, forKey: .choices) ?? []

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

        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.searchable, forKey: .searchable)
        try container.encodeIfPresent(self.sortable, forKey: .sortable)
        try container.encodeIfPresent(self.module, forKey: .module)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for code.

     - Returns:  String
     */
    public func getCode() -> String {
        return self.code
    }
    
    /**
     Getter for name.

     - Returns:  String
     */
    public func getName() -> String {
        return self.name
    }
    
    /**
     Getter for type.

     - Returns:  String
     */
    public func getType() -> String {
        return self.type
    }
    
    /**
     Getter for searchable.
     
     - Returns:  Bool
     */
    public func getSearchable() -> Bool {
        return self.searchable
    }
    
    /**
     Getter for sortable.
     
     - Returns:  Bool
     */
    public func getSortable() -> Bool {
        return self.sortable
    }

    /**
     Getter for module.
     
     - Returns:  Module
     */
    public func getModule() -> Module {
        return self.module
    }
    
    /**
     Getter for choices.
     
     - Returns:  [String] 
     */
    public func getChoices() -> [String] {
        return self.choices
    }

    /**
     Setter for code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setCode(_ value: String) -> Self {
        self.code = value
        return self
    }

    /**
     Setter for name.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setName(_ value: String) -> Self {
        self.name = value
        return self
    }

    /**
     Setter for type.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setType(_ value: String) -> Self {
        self.type = value
        return self
    }

    /**
     Setter for searchable.
     
     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setSearchable(_ value: Bool) -> Self {
        self.searchable = value
        return self
    }

    /**
     Setter for sortable.
     
     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setSortable(_ value: Bool) -> Self {
        self.sortable = value
        return self
    }

    /**
     Setter for choices.
     
     - Parameters:
        - value: [String]
     - Returns:  Self
     */
    @discardableResult
    public func setChoices(_ value: [String]) -> Self {
        self.choices = value
        return self
    }
}
