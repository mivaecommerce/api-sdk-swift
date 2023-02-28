/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Changeset data model.
public class Changeset : Model {

    /// Model field id.
    var id : Int

    /// Model field branch_id.
    var branchId : Int

    /// Model field user_id.
    var userId : Int

    /// Model field dtstamp.
    var dateTimeStamp : Date

    /// Model field notes.
    var notes : String

    /// Model field user_name.
    var userName : String

    /// Model field user_icon.
    var userIcon : String

    /// Model field tags.
    var tags : [String]

    /// Model field formatted_tags.
    var formattedTags : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case branchId = "branch_id"
        case userId = "user_id"
        case dateTimeStamp = "dtstamp"
        case notes
        case userName = "user_name"
        case userIcon = "user_icon"
        case tags
        case formattedTags = "formatted_tags"
    }

    /**
     Changeset Constructor.
     */
    public override init() {
        self.id = 0
        self.branchId = 0
        self.userId = 0
        self.dateTimeStamp = Date(timeIntervalSince1970: 0)
        self.notes = ""
        self.userName = ""
        self.userIcon = ""
        self.tags = []
        self.formattedTags = ""

        super.init()
    }

    /**
     Changeset Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.branchId = try container.decodeIfPresent(Int.self, forKey: .branchId) ?? 0
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        self.dateTimeStamp = try container.decodeIfPresent(DateTime.self, forKey: .dateTimeStamp)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes) ?? ""
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName) ?? ""
        self.userIcon = try container.decodeIfPresent(String.self, forKey: .userIcon) ?? ""
        self.tags = try container.decodeIfPresent([String].self, forKey: .tags) ?? []
        self.formattedTags = try container.decodeIfPresent(String.self, forKey: .formattedTags) ?? ""

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
        try container.encodeIfPresent(self.branchId, forKey: .branchId)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(Int64(self.dateTimeStamp.timeIntervalSince1970), forKey: .dateTimeStamp)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encodeIfPresent(self.userName, forKey: .userName)
        try container.encodeIfPresent(self.userIcon, forKey: .userIcon)
        try container.encodeIfPresent(self.formattedTags, forKey: .formattedTags)

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
     Getter for branch_id.

     - Returns:  Int

     */
    public func getBranchId() -> Int {
        return self.branchId
    }

    /**
     Getter for user_id.

     - Returns:  Int

     */
    public func getUserId() -> Int {
        return self.userId
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
     Getter for tags.

     - Returns:  [String]
     */
    public func getTags() -> [String] {
        return self.tags
    }

    /**
     Getter for formatted_tags.

     - Returns:  String

     */
    public func getFormattedTags() -> String {
        return self.formattedTags
    }
}
