/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// BranchPageVersion data model.
public class BranchPageVersion : Model {

    /// Model field id.
    var id : Int

    /// Model field page_id.
    var pageId : Int

    /// Model field user_id.
    var userId : Int

    /// Model field user_name.
    var userName : String

    /// Model field user_icon.
    var userIcon : String

    /// Model field admin.
    var admin : Bool

    /// Model field layout.
    var layout : Bool

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
    var templId : Int

    /// Model field cache.
    var cache : String

    /// Model field notes.
    var notes : String

    /// Model field source.
    var source : String

    /// Model field source_user_id.
    var sourceUserId : Int

    /// Model field source_user_name.
    var sourceUserName : String

    /// Model field source_user_icon.
    var sourceUserIcon : String

    /// Model field settings
    var settings : VersionSettings

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case pageId = "page_id"
        case userId = "user_id"
        case userName = "user_name"
        case userIcon = "user_icon"
        case admin
        case layout
        case secure
        case code
        case name
        case title
        case uiId = "ui_id"
        case templId = "templ_id"
        case cache
        case notes
        case source
        case sourceUserId = "source_user_id"
        case sourceUserName = "source_user_name"
        case sourceUserIcon = "source_user_icon"
        case settings
    }

    /**
     BranchPageVersion Constructor.
     */
    public override init() {
        self.id = 0
        self.pageId = 0
        self.userId = 0
        self.userName = ""
        self.userIcon = ""
        self.admin = false
        self.layout = false
        self.secure = false
        self.code = ""
        self.name = ""
        self.title = ""
        self.uiId = 0
        self.templId = 0
        self.cache = ""
        self.notes = ""
        self.source = ""
        self.sourceUserId = 0
        self.sourceUserName = ""
        self.sourceUserIcon = ""
        self.settings = VersionSettings()

        super.init()
    }

    /**
     BranchPageVersion Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.pageId = try container.decodeIfPresent(Int.self, forKey: .pageId) ?? 0
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName) ?? ""
        self.userIcon = try container.decodeIfPresent(String.self, forKey: .userIcon) ?? ""
        self.admin = try container.decodeIfPresent(Bool.self, forKey: .admin) ?? false
        self.layout = try container.decodeIfPresent(Bool.self, forKey: .layout) ?? false
        self.secure = try container.decodeIfPresent(Bool.self, forKey: .secure) ?? false
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.uiId = try container.decodeIfPresent(Int.self, forKey: .uiId) ?? 0
        self.templId = try container.decodeIfPresent(Int.self, forKey: .templId) ?? 0
        self.cache = try container.decodeIfPresent(String.self, forKey: .cache) ?? ""
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes) ?? ""
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
        self.sourceUserId = try container.decodeIfPresent(Int.self, forKey: .sourceUserId) ?? 0
        self.sourceUserName = try container.decodeIfPresent(String.self, forKey: .sourceUserName) ?? ""
        self.sourceUserIcon = try container.decodeIfPresent(String.self, forKey: .sourceUserIcon) ?? ""
        self.settings = try container.decodeIfPresent(VersionSettings.self, forKey: .settings) ?? VersionSettings()

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
        try container.encodeIfPresent(self.pageId, forKey: .pageId)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.userName, forKey: .userName)
        try container.encodeIfPresent(self.userIcon, forKey: .userIcon)
        try container.encodeIfPresent(self.admin, forKey: .admin)
        try container.encodeIfPresent(self.layout, forKey: .layout)
        try container.encodeIfPresent(self.secure, forKey: .secure)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.uiId, forKey: .uiId)
        try container.encodeIfPresent(self.templId, forKey: .templId)
        try container.encodeIfPresent(self.cache, forKey: .cache)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.sourceUserId, forKey: .sourceUserId)
        try container.encodeIfPresent(self.sourceUserName, forKey: .sourceUserName)
        try container.encodeIfPresent(self.sourceUserIcon, forKey: .sourceUserIcon)
        try container.encodeIfPresent(self.settings, forKey: .settings)

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
     Getter for page_id.

     - Returns:  Int

     */
    public func getPageId() -> Int {
        return self.pageId
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
    public func getTemplId() -> Int {
        return self.templId
    }

    /**
     Getter for cache.

     - Returns:  String

     */
    public func getCache() -> String {
        return self.cache
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
     Getter for source_user_id.

     - Returns:  Int

     */
    public func getSourceUserId() -> Int {
        return self.sourceUserId
    }

    /**
     Getter for source_user_name.

     - Returns:  String

     */
    public func getSourceUserName() -> String {
        return self.sourceUserName
    }

    /**
     Getter for source_user_icon.

     - Returns:  String

     */
    public func getSourceUserIcon() -> String {
        return self.sourceUserIcon
    }

    /**
     Getter for settings.

     - Returns:  VersionSettings
     */
    public func getSettings() -> VersionSettings {
        return self.settings
    }
}
