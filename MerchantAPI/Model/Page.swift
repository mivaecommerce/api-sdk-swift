/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Page data model.
public class Page : Model {

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
}
