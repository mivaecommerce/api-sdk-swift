/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CSSResourceVersion data model.
public class CSSResourceVersion : Model {

    /// Model field id.
    var id : Int

    /// Model field res_id.
    var resourceId : Int

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

    /// Model field branchless_file.
    var branchlessFile : String

    /// Model field templ_id.
    var templateId : Int

    /// Model field user_id.
    var userId : Int

    /// Model field user_name.
    var userName : String

    /// Model field user_icon.
    var userIcon : String

    /// Model field source_user_id.
    var sourceUserId : Int

    /// Model field source_user_name.
    var sourceUserName : String

    /// Model field source_user_icon.
    var sourceUserIcon : String

    /// Model field source.
    var source : String

    /// Model field attributes.
    var attributes : [CSSResourceVersionAttribute]

    /// Model field linkedpages.
    var linkedPages : [Page]

    /// Model field linkedresources.
    var linkedResources : [CSSResource]

    /// Model field source_notes.
    var sourceNotes : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case resourceId = "res_id"
        case code
        case type
        case isGlobal = "is_global"
        case active
        case file
        case branchlessFile = "branchless_file"
        case templateId = "templ_id"
        case userId = "user_id"
        case userName = "user_name"
        case userIcon = "user_icon"
        case sourceUserId = "source_user_id"
        case sourceUserName = "source_user_name"
        case sourceUserIcon = "source_user_icon"
        case source
        case attributes
        case linkedPages = "linkedpages"
        case linkedResources = "linkedresources"
        case sourceNotes = "source_notes"
    }

    /**
     CSSResourceVersion Constructor.
     */
    public override init() {
        self.id = 0
        self.resourceId = 0
        self.code = ""
        self.type = ""
        self.isGlobal = false
        self.active = false
        self.file = ""
        self.branchlessFile = ""
        self.templateId = 0
        self.userId = 0
        self.userName = ""
        self.userIcon = ""
        self.sourceUserId = 0
        self.sourceUserName = ""
        self.sourceUserIcon = ""
        self.source = ""
        self.attributes = []
        self.linkedPages = []
        self.linkedResources = []
        self.sourceNotes = ""

        super.init()
    }

    /**
     CSSResourceVersion Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.resourceId = try container.decodeIfPresent(Int.self, forKey: .resourceId) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.isGlobal = try container.decodeIfPresent(Bool.self, forKey: .isGlobal) ?? false
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false
        self.file = try container.decodeIfPresent(String.self, forKey: .file) ?? ""
        self.branchlessFile = try container.decodeIfPresent(String.self, forKey: .branchlessFile) ?? ""
        self.templateId = try container.decodeIfPresent(Int.self, forKey: .templateId) ?? 0
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName) ?? ""
        self.userIcon = try container.decodeIfPresent(String.self, forKey: .userIcon) ?? ""
        self.sourceUserId = try container.decodeIfPresent(Int.self, forKey: .sourceUserId) ?? 0
        self.sourceUserName = try container.decodeIfPresent(String.self, forKey: .sourceUserName) ?? ""
        self.sourceUserIcon = try container.decodeIfPresent(String.self, forKey: .sourceUserIcon) ?? ""
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
        self.attributes = try container.decodeIfPresent([CSSResourceVersionAttribute].self, forKey: .attributes) ?? []
        self.linkedPages = try container.decodeIfPresent([Page].self, forKey: .linkedPages) ?? []
        self.linkedResources = try container.decodeIfPresent([CSSResource].self, forKey: .linkedResources) ?? []
        self.sourceNotes = try container.decodeIfPresent(String.self, forKey: .sourceNotes) ?? ""

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
        try container.encodeIfPresent(self.resourceId, forKey: .resourceId)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.isGlobal, forKey: .isGlobal)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(self.file, forKey: .file)
        try container.encodeIfPresent(self.branchlessFile, forKey: .branchlessFile)
        try container.encodeIfPresent(self.templateId, forKey: .templateId)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.userName, forKey: .userName)
        try container.encodeIfPresent(self.userIcon, forKey: .userIcon)
        try container.encodeIfPresent(self.sourceUserId, forKey: .sourceUserId)
        try container.encodeIfPresent(self.sourceUserName, forKey: .sourceUserName)
        try container.encodeIfPresent(self.sourceUserIcon, forKey: .sourceUserIcon)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)
        try container.encodeIfPresent(self.linkedPages, forKey: .linkedPages)
        try container.encodeIfPresent(self.linkedResources, forKey: .linkedResources)
        try container.encodeIfPresent(self.sourceNotes, forKey: .sourceNotes)

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
     Getter for res_id.

     - Returns:  Int

     */
    public func getResourceId() -> Int {
        return self.resourceId
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
     Getter for branchless_file.

     - Returns:  String

     */
    public func getBranchlessFile() -> String {
        return self.branchlessFile
    }

    /**
     Getter for templ_id.

     - Returns:  Int

     */
    public func getTemplateId() -> Int {
        return self.templateId
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
     Getter for source.

     - Returns:  String

     */
    public func getSource() -> String {
        return self.source
    }

    /**
     Getter for attributes.

     - Returns:  [CSSResourceVersionAttribute]
     */
    public func getAttributes() -> [CSSResourceVersionAttribute] {
        return self.attributes
    }

    /**
     Getter for linkedpages.

     - Returns:  [Page]
     */
    public func getLinkedPages() -> [Page] {
        return self.linkedPages
    }

    /**
     Getter for linkedresources.

     - Returns:  [CSSResource]
     */
    public func getLinkedResources() -> [CSSResource] {
        return self.linkedResources
    }

    /**
     Getter for source_notes.

     - Returns:  String

     */
    public func getSourceNotes() -> String {
        return self.sourceNotes
    }
}
