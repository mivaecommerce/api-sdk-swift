/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Page data model.
public class Page : Model {

    /// Enumeration PageCacheType
    public enum PageCacheType : String {
        case Never = "never"
        case Provisional = "provisional"
        case Anonempty = "anonempty"
        case Allempty = "allempty"
        case Always = "always"
    }

    /// Model field id.
    var id : Int

    /// Model field secure.
    var secure : Bool

    /// Model field code.
    var code : String

    /// Model field name.
    var name : String

    /// Model field title.
    var title : String

    /// Model field ui_id.
    var uiId : Int

    /// Model field templ_id.
    var templateId : Int

    /// Model field admin.
    var admin : Bool

    /// Model field layout.
    var layout : Bool

    /// Model field fragment.
    var fragment : Bool

    /// Model field public.
    var isPublic : Bool

    /// Model field notes.
    var notes : String

    /// Model field source.
    var source : String

    /// Model field settings
    var settings : VersionSettings

    /// Model field cache.
    var cache : String

    /// Model field url.
    var url : String

    /// Model field uris.
    var uris : [Uri]

    /// Model field CustomField_Values
    var customFieldValues : CustomFieldValues

    /// Model field version_id.
    var versionId : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case secure
        case code
        case name
        case title
        case uiId = "ui_id"
        case templateId = "templ_id"
        case admin
        case layout
        case fragment
        case isPublic = "public"
        case notes
        case source
        case settings
        case cache
        case url
        case uris
        case customFieldValues = "CustomField_Values"
        case versionId = "version_id"
    }

    /**
     Page Constructor.
     */
    public override init() {
        self.id = 0
        self.secure = false
        self.code = ""
        self.name = ""
        self.title = ""
        self.uiId = 0
        self.templateId = 0
        self.admin = false
        self.layout = false
        self.fragment = false
        self.isPublic = false
        self.notes = ""
        self.source = ""
        self.settings = VersionSettings()
        self.cache = ""
        self.url = ""
        self.uris = []
        self.customFieldValues = CustomFieldValues()
        self.versionId = 0

        super.init()
    }

    /**
     Page Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.secure = try container.decodeIfPresent(Bool.self, forKey: .secure) ?? false
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.uiId = try container.decodeIfPresent(Int.self, forKey: .uiId) ?? 0
        self.templateId = try container.decodeIfPresent(Int.self, forKey: .templateId) ?? 0
        self.admin = try container.decodeIfPresent(Bool.self, forKey: .admin) ?? false
        self.layout = try container.decodeIfPresent(Bool.self, forKey: .layout) ?? false
        self.fragment = try container.decodeIfPresent(Bool.self, forKey: .fragment) ?? false
        self.isPublic = try container.decodeIfPresent(Bool.self, forKey: .isPublic) ?? false
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes) ?? ""
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
        self.settings = try container.decodeIfPresent(VersionSettings.self, forKey: .settings) ?? VersionSettings()
        self.cache = try container.decodeIfPresent(String.self, forKey: .cache) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.uris = try container.decodeIfPresent([Uri].self, forKey: .uris) ?? []
        self.customFieldValues = try container.decodeIfPresent(CustomFieldValues.self, forKey: .customFieldValues) ?? CustomFieldValues()
        self.versionId = try container.decodeIfPresent(Int.self, forKey: .versionId) ?? 0

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
        try container.encodeIfPresent(self.secure, forKey: .secure)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.uiId, forKey: .uiId)
        try container.encodeIfPresent(self.templateId, forKey: .templateId)
        try container.encodeIfPresent(self.admin, forKey: .admin)
        try container.encodeIfPresent(self.layout, forKey: .layout)
        try container.encodeIfPresent(self.fragment, forKey: .fragment)
        try container.encodeIfPresent(self.isPublic, forKey: .isPublic)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.settings, forKey: .settings)
        try container.encodeIfPresent(self.cache, forKey: .cache)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.uris, forKey: .uris)
        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)
        try container.encodeIfPresent(self.versionId, forKey: .versionId)

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
     Getter for secure.

     - Returns:  Bool     */
    public func getSecure() -> Bool {
        return self.secure
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
     Getter for title.

     - Returns:  String

     */
    public func getTitle() -> String {
        return self.title
    }

    /**
     Getter for ui_id.

     - Returns:  Int

     */
    public func getUiId() -> Int {
        return self.uiId
    }

    /**
     Getter for templ_id.

     - Returns:  Int

     */
    public func getTemplateId() -> Int {
        return self.templateId
    }

    /**
     Getter for admin.

     - Returns:  Bool     */
    public func getAdmin() -> Bool {
        return self.admin
    }

    /**
     Getter for layout.

     - Returns:  Bool     */
    public func getLayout() -> Bool {
        return self.layout
    }

    /**
     Getter for fragment.

     - Returns:  Bool     */
    public func getFragment() -> Bool {
        return self.fragment
    }

    /**
     Getter for public.

     - Returns:  Bool     */
    public func getIsPublic() -> Bool {
        return self.isPublic
    }

    /**
     Getter for notes.

     - Returns:  String

     */
    public func getNotes() -> String {
        return self.notes
    }

    /**
     Getter for source.

     - Returns:  String

     */
    public func getSource() -> String {
        return self.source
    }

    /**
     Getter for settings.

     - Returns:  VersionSettings
     */
    public func getSettings() -> VersionSettings {
        return self.settings
    }

    /**
     Getter for cache.

     - Returns:  String

     */
    public func getCache() -> String {
        return self.cache
    }

    /**
     Enum Getter for cache.

     - Returns:  Optional<PageCacheType>
     */
    public func getCache() -> Optional<PageCacheType> {
        return PageCacheType(rawValue: self.cache) ?? nil
    }

    /**
     Getter for url.

     - Returns:  String

     */
    public func getUrl() -> String {
        return self.url
    }

    /**
     Getter for uris.

     - Returns:  [Uri]
     */
    public func getUris() -> [Uri] {
        return self.uris
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
    }

    /**
     Getter for version_id.

     - Returns:  Int

     */
    public func getVersionId() -> Int {
        return self.versionId
    }
}
