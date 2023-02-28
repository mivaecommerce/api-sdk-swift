/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CopyPageRule data model.
public class CopyPageRule : Model {

    /// Enumeration PageRuleSettings
    public enum PageRuleSettings : String {
        case All = "all"
        case None = "none"
        case Specific = "specific"
    }

    /// Model field id.
    var id : Int

    /// Model field name.
    var name : String

    /// Model field secure.
    var secure : Bool

    /// Model field title.
    var title : Bool

    /// Model field template.
    var template : Bool

    /// Model field items.
    var items : Bool

    /// Model field settings.
    var settings : String

    /// Model field jsres.
    var jsres : Bool

    /// Model field cssres.
    var CSSres : Bool

    /// Model field cacheset.
    var cacheset : Bool

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case secure
        case title
        case template
        case items
        case settings
        case jsres
        case CSSres = "cssres"
        case cacheset
    }

    /**
     CopyPageRule Constructor.
     */
    public override init() {
        self.id = 0
        self.name = ""
        self.secure = false
        self.title = false
        self.template = false
        self.items = false
        self.settings = ""
        self.jsres = false
        self.CSSres = false
        self.cacheset = false

        super.init()
    }

    /**
     CopyPageRule Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.secure = try container.decodeIfPresent(Bool.self, forKey: .secure) ?? false
        self.title = try container.decodeIfPresent(Bool.self, forKey: .title) ?? false
        self.template = try container.decodeIfPresent(Bool.self, forKey: .template) ?? false
        self.items = try container.decodeIfPresent(Bool.self, forKey: .items) ?? false
        self.settings = try container.decodeIfPresent(String.self, forKey: .settings) ?? ""
        self.jsres = try container.decodeIfPresent(Bool.self, forKey: .jsres) ?? false
        self.CSSres = try container.decodeIfPresent(Bool.self, forKey: .CSSres) ?? false
        self.cacheset = try container.decodeIfPresent(Bool.self, forKey: .cacheset) ?? false

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
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.secure, forKey: .secure)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.template, forKey: .template)
        try container.encodeIfPresent(self.items, forKey: .items)
        try container.encodeIfPresent(self.settings, forKey: .settings)
        try container.encodeIfPresent(self.jsres, forKey: .jsres)
        try container.encodeIfPresent(self.CSSres, forKey: .CSSres)
        try container.encodeIfPresent(self.cacheset, forKey: .cacheset)

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
     Getter for name.

     - Returns:  String

     */
    public func getName() -> String {
        return self.name
    }

    /**
     Getter for secure.

     - Returns:  Bool     */
    public func getSecure() -> Bool {
        return self.secure
    }

    /**
     Getter for title.

     - Returns:  Bool     */
    public func getTitle() -> Bool {
        return self.title
    }

    /**
     Getter for template.

     - Returns:  Bool     */
    public func getTemplate() -> Bool {
        return self.template
    }

    /**
     Getter for items.

     - Returns:  Bool     */
    public func getItems() -> Bool {
        return self.items
    }

    /**
     Getter for settings.

     - Returns:  String

     */
    public func getSettings() -> String {
        return self.settings
    }

    /**
     Getter for jsres.

     - Returns:  Bool     */
    public func getJsres() -> Bool {
        return self.jsres
    }

    /**
     Getter for cssres.

     - Returns:  Bool     */
    public func getCSSres() -> Bool {
        return self.CSSres
    }

    /**
     Getter for cacheset.

     - Returns:  Bool     */
    public func getCacheset() -> Bool {
        return self.cacheset
    }
}
