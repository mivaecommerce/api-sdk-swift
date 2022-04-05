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

    /// Model field item_version_id.
    var itemVersionId : Int

    /// Model field item_identifier.
    var itemIdentifier : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case itemType = "item_type"
        case itemId = "item_id"
        case itemVersionId = "item_version_id"
        case itemIdentifier = "item_identifier"
    }

    /**
     ChangesetChange Constructor.
     */
    public override init() {
        self.itemType = ""
        self.itemId = 0
        self.itemVersionId = 0
        self.itemIdentifier = ""

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
        self.itemVersionId = try container.decodeIfPresent(Int.self, forKey: .itemVersionId) ?? 0
        self.itemIdentifier = try container.decodeIfPresent(String.self, forKey: .itemIdentifier) ?? ""

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
        try container.encodeIfPresent(self.itemVersionId, forKey: .itemVersionId)
        try container.encodeIfPresent(self.itemIdentifier, forKey: .itemIdentifier)

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
}
