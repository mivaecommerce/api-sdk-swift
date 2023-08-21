/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ChangesetChange data model.
public class ChangesetChange : Model {

    /// Model field item_type.
    var itemType : String

    /// Model field item_id.
    var itemId : Int

    /// Model field item_user_id.
    var itemUserId : Int

    /// Model field item_user_name.
    var itemUserName : String

    /// Model field item_user_icon.
    var itemUserIcon : String

    /// Model field item_version_id.
    var itemVersionId : Int

    /// Model field item_identifier.
    var itemIdentifier : String

    /// Model field item_change_type.
    var itemChangeType : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case itemType = "item_type"
        case itemId = "item_id"
        case itemUserId = "item_user_id"
        case itemUserName = "item_user_name"
        case itemUserIcon = "item_user_icon"
        case itemVersionId = "item_version_id"
        case itemIdentifier = "item_identifier"
        case itemChangeType = "item_change_type"
    }

    /**
     ChangesetChange Constructor.
     */
    public override init() {
        self.itemType = ""
        self.itemId = 0
        self.itemUserId = 0
        self.itemUserName = ""
        self.itemUserIcon = ""
        self.itemVersionId = 0
        self.itemIdentifier = ""
        self.itemChangeType = ""

        super.init()
    }

    /**
     ChangesetChange Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.itemType = try container.decodeIfPresent(String.self, forKey: .itemType) ?? ""
        self.itemId = try container.decodeIfPresent(Int.self, forKey: .itemId) ?? 0
        self.itemUserId = try container.decodeIfPresent(Int.self, forKey: .itemUserId) ?? 0
        self.itemUserName = try container.decodeIfPresent(String.self, forKey: .itemUserName) ?? ""
        self.itemUserIcon = try container.decodeIfPresent(String.self, forKey: .itemUserIcon) ?? ""
        self.itemVersionId = try container.decodeIfPresent(Int.self, forKey: .itemVersionId) ?? 0
        self.itemIdentifier = try container.decodeIfPresent(String.self, forKey: .itemIdentifier) ?? ""
        self.itemChangeType = try container.decodeIfPresent(String.self, forKey: .itemChangeType) ?? ""

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

        try container.encodeIfPresent(self.itemType, forKey: .itemType)
        try container.encodeIfPresent(self.itemId, forKey: .itemId)
        try container.encodeIfPresent(self.itemUserId, forKey: .itemUserId)
        try container.encodeIfPresent(self.itemUserName, forKey: .itemUserName)
        try container.encodeIfPresent(self.itemUserIcon, forKey: .itemUserIcon)
        try container.encodeIfPresent(self.itemVersionId, forKey: .itemVersionId)
        try container.encodeIfPresent(self.itemIdentifier, forKey: .itemIdentifier)
        try container.encodeIfPresent(self.itemChangeType, forKey: .itemChangeType)

        try super.encode(to: encoder)
    }

    /**
     Getter for item_type.

     - Returns:  String

     */
    public func getItemType() -> String {
        return self.itemType
    }

    /**
     Getter for item_id.

     - Returns:  Int

     */
    public func getItemId() -> Int {
        return self.itemId
    }

    /**
     Getter for item_user_id.

     - Returns:  Int

     */
    public func getItemUserId() -> Int {
        return self.itemUserId
    }

    /**
     Getter for item_user_name.

     - Returns:  String

     */
    public func getItemUserName() -> String {
        return self.itemUserName
    }

    /**
     Getter for item_user_icon.

     - Returns:  String

     */
    public func getItemUserIcon() -> String {
        return self.itemUserIcon
    }

    /**
     Getter for item_version_id.

     - Returns:  Int

     */
    public func getItemVersionId() -> Int {
        return self.itemVersionId
    }

    /**
     Getter for item_identifier.

     - Returns:  String

     */
    public func getItemIdentifier() -> String {
        return self.itemIdentifier
    }

    /**
     Getter for item_change_type.

     - Returns:  String

     */
    public func getItemChangeType() -> String {
        return self.itemChangeType
    }
}
