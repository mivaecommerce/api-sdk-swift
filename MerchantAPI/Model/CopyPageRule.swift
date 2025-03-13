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
    var javascriptResourceAssignments : Bool

    /// Model field cssres.
    var CSSResourceAssignments : Bool

    /// Model field cacheset.
    var cacheSettings : Bool

    /// Model field public.
    var isPublic : Bool

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
        case javascriptResourceAssignments = "jsres"
        case CSSResourceAssignments = "cssres"
        case cacheSettings = "cacheset"
        case isPublic = "public"
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
        self.javascriptResourceAssignments = false
        self.CSSResourceAssignments = false
        self.cacheSettings = false
        self.isPublic = false

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
        self.javascriptResourceAssignments = try container.decodeIfPresent(Bool.self, forKey: .javascriptResourceAssignments) ?? false
        self.CSSResourceAssignments = try container.decodeIfPresent(Bool.self, forKey: .CSSResourceAssignments) ?? false
        self.cacheSettings = try container.decodeIfPresent(Bool.self, forKey: .cacheSettings) ?? false
        self.isPublic = try container.decodeIfPresent(Bool.self, forKey: .isPublic) ?? false

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
        try container.encodeIfPresent(self.javascriptResourceAssignments, forKey: .javascriptResourceAssignments)
        try container.encodeIfPresent(self.CSSResourceAssignments, forKey: .CSSResourceAssignments)
        try container.encodeIfPresent(self.cacheSettings, forKey: .cacheSettings)
        try container.encodeIfPresent(self.isPublic, forKey: .isPublic)

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
    public func getJavascriptResourceAssignments() -> Bool {
        return self.javascriptResourceAssignments
    }

    /**
     Getter for cssres.

     - Returns:  Bool     */
    public func getCSSResourceAssignments() -> Bool {
        return self.CSSResourceAssignments
    }

    /**
     Getter for cacheset.

     - Returns:  Bool     */
    public func getCacheSettings() -> Bool {
        return self.cacheSettings
    }

    /**
     Getter for public.

     - Returns:  Bool     */
    public func getIsPublic() -> Bool {
        return self.isPublic
    }
}
