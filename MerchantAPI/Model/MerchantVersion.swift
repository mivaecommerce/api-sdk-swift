/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// MerchantVersion data model.
public class MerchantVersion : Model {

    /// Model field version.
    var version : String

    /// Model field major.
    var major : Int

    /// Model field minor.
    var minor : Int

    /// Model field bugfix.
    var bugfix : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case version
        case major
        case minor
        case bugfix
    }

    /**
     MerchantVersion Constructor.
     */
    public override init() {
        self.version = ""
        self.major = 0
        self.minor = 0
        self.bugfix = 0

        super.init()
    }

    /**
     MerchantVersion Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.version = try container.decodeIfPresent(String.self, forKey: .version) ?? ""
        self.major = try container.decodeIfPresent(Int.self, forKey: .major) ?? 0
        self.minor = try container.decodeIfPresent(Int.self, forKey: .minor) ?? 0
        self.bugfix = try container.decodeIfPresent(Int.self, forKey: .bugfix) ?? 0

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

        try container.encodeIfPresent(self.version, forKey: .version)
        try container.encodeIfPresent(self.major, forKey: .major)
        try container.encodeIfPresent(self.minor, forKey: .minor)
        try container.encodeIfPresent(self.bugfix, forKey: .bugfix)

        try super.encode(to: encoder)
    }

    /**
     Getter for version.

     - Returns:  String

     */
    public func getVersion() -> String {
        return self.version
    }

    /**
     Getter for major.

     - Returns:  Int

     */
    public func getMajor() -> Int {
        return self.major
    }

    /**
     Getter for minor.

     - Returns:  Int

     */
    public func getMinor() -> Int {
        return self.minor
    }

    /**
     Getter for bugfix.

     - Returns:  Int

     */
    public func getBugfix() -> Int {
        return self.bugfix
    }
}
