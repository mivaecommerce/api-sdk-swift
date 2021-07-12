/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Branch data model.
public class Branch : Model {

    /// Model field id.
    var id : Int
    /// Model field immutable.
    var immutable : Bool
    /// Model field branchkey.
    var branchKey : String
    /// Model field name.
    var name : String
    /// Model field color.
    var color : String
    /// Model field framework.
    var framework : String
    /// Model field is_primary.
    var isPrimary : Bool
    /// Model field is_working.
    var isWorking : Bool
    /// Model field preview_url.
    var previewUrl : String
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case immutable
        case branchKey = "branchkey"
        case name
        case color
        case framework
        case isPrimary = "is_primary"
        case isWorking = "is_working"
        case previewUrl = "preview_url"
    }

    /**
     Branch Constructor.
     */
    public override init() {
        self.id = 0
        self.immutable = false
        self.branchKey = ""
        self.name = ""
        self.color = ""
        self.framework = ""
        self.isPrimary = false
        self.isWorking = false
        self.previewUrl = ""

        super.init()
    }

    /**
     Branch Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.immutable = try container.decodeIfPresent(Bool.self, forKey: .immutable) ?? false
        self.branchKey = try container.decodeIfPresent(String.self, forKey: .branchKey) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.color = try container.decodeIfPresent(String.self, forKey: .color) ?? ""
        self.framework = try container.decodeIfPresent(String.self, forKey: .framework) ?? ""
        self.isPrimary = try container.decodeIfPresent(Bool.self, forKey: .isPrimary) ?? false
        self.isWorking = try container.decodeIfPresent(Bool.self, forKey: .isWorking) ?? false
        self.previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl) ?? ""

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
        try container.encodeIfPresent(self.immutable, forKey: .immutable)
        try container.encodeIfPresent(self.branchKey, forKey: .branchKey)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.color, forKey: .color)
        try container.encodeIfPresent(self.framework, forKey: .framework)
        try container.encodeIfPresent(self.isPrimary, forKey: .isPrimary)
        try container.encodeIfPresent(self.isWorking, forKey: .isWorking)
        try container.encodeIfPresent(self.previewUrl, forKey: .previewUrl)

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
     Getter for immutable.

     - Returns:  Bool     */
    public func getImmutable() -> Bool {
        return self.immutable
    }

    /**
     Getter for branchkey.

     - Returns:  String

     */
    public func getBranchKey() -> String {
        return self.branchKey
    }

    /**
     Getter for name.

     - Returns:  String

     */
    public func getName() -> String {
        return self.name
    }

    /**
     Getter for color.

     - Returns:  String

     */
    public func getColor() -> String {
        return self.color
    }

    /**
     Getter for framework.

     - Returns:  String

     */
    public func getFramework() -> String {
        return self.framework
    }

    /**
     Getter for is_primary.

     - Returns:  Bool     */
    public func getIsPrimary() -> Bool {
        return self.isPrimary
    }

    /**
     Getter for is_working.

     - Returns:  Bool     */
    public func getIsWorking() -> Bool {
        return self.isWorking
    }

    /**
     Getter for preview_url.

     - Returns:  String

     */
    public func getPreviewUrl() -> String {
        return self.previewUrl
    }
}
