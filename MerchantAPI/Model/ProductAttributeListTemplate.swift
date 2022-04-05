/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductAttributeListTemplate data model.
public class ProductAttributeListTemplate : Model {

    /// Model field id.
    var id : Int

    /// Model field code.
    var code : String

    /// Model field prompt.
    var prompt : String

    /// Model field refcount.
    var referenceCount : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case code
        case prompt
        case referenceCount = "refcount"
    }

    /**
     ProductAttributeListTemplate Constructor.
     */
    public override init() {
        self.id = 0
        self.code = ""
        self.prompt = ""
        self.referenceCount = 0

        super.init()
    }

    /**
     ProductAttributeListTemplate Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt) ?? ""
        self.referenceCount = try container.decodeIfPresent(Int.self, forKey: .referenceCount) ?? 0

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
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(self.referenceCount, forKey: .referenceCount)

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
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for prompt.

     - Returns:  String

     */
    public func getPrompt() -> String {
        return self.prompt
    }

    /**
     Getter for refcount.

     - Returns:  Int

     */
    public func getReferenceCount() -> Int {
        return self.referenceCount
    }
}
