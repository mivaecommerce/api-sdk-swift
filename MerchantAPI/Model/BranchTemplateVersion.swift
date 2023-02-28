/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// BranchTemplateVersion data model.
public class BranchTemplateVersion : Model {

    /// Model field id.
    var id : Int

    /// Model field templ_id.
    var templateId : Int

    /// Model field parent_id.
    var parentId : Int

    /// Model field user_id.
    var userId : Int

    /// Model field user_name.
    var userName : String

    /// Model field user_icon.
    var userIcon : String

    /// Model field item_id.
    var itemId : Int

    /// Model field prop_id.
    var propertyId : Int

    /// Model field sync.
    var sync : Bool

    /// Model field filename.
    var filename : String

    /// Model field dtstamp.
    var dateTimeStamp : Date

    /// Model field notes.
    var notes : String

    /// Model field source.
    var source : String

    /// Model field settings
    var settings : VersionSettings

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case templateId = "templ_id"
        case parentId = "parent_id"
        case userId = "user_id"
        case userName = "user_name"
        case userIcon = "user_icon"
        case itemId = "item_id"
        case propertyId = "prop_id"
        case sync
        case filename
        case dateTimeStamp = "dtstamp"
        case notes
        case source
        case settings
    }

    /**
     BranchTemplateVersion Constructor.
     */
    public override init() {
        self.id = 0
        self.templateId = 0
        self.parentId = 0
        self.userId = 0
        self.userName = ""
        self.userIcon = ""
        self.itemId = 0
        self.propertyId = 0
        self.sync = false
        self.filename = ""
        self.dateTimeStamp = Date(timeIntervalSince1970: 0)
        self.notes = ""
        self.source = ""
        self.settings = VersionSettings()

        super.init()
    }

    /**
     BranchTemplateVersion Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.templateId = try container.decodeIfPresent(Int.self, forKey: .templateId) ?? 0
        self.parentId = try container.decodeIfPresent(Int.self, forKey: .parentId) ?? 0
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName) ?? ""
        self.userIcon = try container.decodeIfPresent(String.self, forKey: .userIcon) ?? ""
        self.itemId = try container.decodeIfPresent(Int.self, forKey: .itemId) ?? 0
        self.propertyId = try container.decodeIfPresent(Int.self, forKey: .propertyId) ?? 0
        self.sync = try container.decodeIfPresent(Bool.self, forKey: .sync) ?? false
        self.filename = try container.decodeIfPresent(String.self, forKey: .filename) ?? ""
        self.dateTimeStamp = try container.decodeIfPresent(DateTime.self, forKey: .dateTimeStamp)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes) ?? ""
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
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
        try container.encodeIfPresent(self.templateId, forKey: .templateId)
        try container.encodeIfPresent(self.parentId, forKey: .parentId)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.userName, forKey: .userName)
        try container.encodeIfPresent(self.userIcon, forKey: .userIcon)
        try container.encodeIfPresent(self.itemId, forKey: .itemId)
        try container.encodeIfPresent(self.propertyId, forKey: .propertyId)
        try container.encodeIfPresent(self.sync, forKey: .sync)
        try container.encodeIfPresent(self.filename, forKey: .filename)
        try container.encodeIfPresent(Int64(self.dateTimeStamp.timeIntervalSince1970), forKey: .dateTimeStamp)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encodeIfPresent(self.source, forKey: .source)
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
     Getter for templ_id.

     - Returns:  Int

     */
    public func getTemplateId() -> Int {
        return self.templateId
    }

    /**
     Getter for parent_id.

     - Returns:  Int

     */
    public func getParentId() -> Int {
        return self.parentId
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
     Getter for item_id.

     - Returns:  Int

     */
    public func getItemId() -> Int {
        return self.itemId
    }

    /**
     Getter for prop_id.

     - Returns:  Int

     */
    public func getPropertyId() -> Int {
        return self.propertyId
    }

    /**
     Getter for sync.

     - Returns:  Bool     */
    public func getSync() -> Bool {
        return self.sync
    }

    /**
     Getter for filename.

     - Returns:  String

     */
    public func getFilename() -> String {
        return self.filename
    }

    /**
     Getter for dtstamp.

     - Returns:  Date     */
    public func getDateTimeStamp() -> Date {
        return self.dateTimeStamp
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
}
