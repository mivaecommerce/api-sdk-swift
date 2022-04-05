/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProvisionMessage data model.
public class ProvisionMessage : Model {

    /// Model field dtstamp.
    var dateTimeStamp : String

    /// Model field lineno.
    var lineNumber : Int

    /// Model field tag.
    var tag : String

    /// Model field message.
    var message : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case dateTimeStamp = "dtstamp"
        case lineNumber = "lineno"
        case tag
        case message
    }

    /**
     ProvisionMessage Constructor.
     */
    public override init() {
        self.dateTimeStamp = ""
        self.lineNumber = 0
        self.tag = ""
        self.message = ""

        super.init()
    }

    /**
     ProvisionMessage Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.dateTimeStamp = try container.decodeIfPresent(String.self, forKey: .dateTimeStamp) ?? ""
        self.lineNumber = try container.decodeIfPresent(Int.self, forKey: .lineNumber) ?? 0
        self.tag = try container.decodeIfPresent(String.self, forKey: .tag) ?? ""
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""

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

        try container.encodeIfPresent(self.dateTimeStamp, forKey: .dateTimeStamp)
        try container.encodeIfPresent(self.lineNumber, forKey: .lineNumber)
        try container.encodeIfPresent(self.tag, forKey: .tag)
        try container.encodeIfPresent(self.message, forKey: .message)

        try super.encode(to: encoder)
    }

    /**
     Getter for dtstamp.

     - Returns:  String

     */
    public func getDateTimeStamp() -> String {
        return self.dateTimeStamp
    }

    /**
     Getter for lineno.

     - Returns:  Int

     */
    public func getLineNumber() -> Int {
        return self.lineNumber
    }

    /**
     Getter for tag.

     - Returns:  String

     */
    public func getTag() -> String {
        return self.tag
    }

    /**
     Getter for message.

     - Returns:  String

     */
    public func getMessage() -> String {
        return self.message
    }
}
