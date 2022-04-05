/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ResourceAttribute data model.
public class ResourceAttribute : Model {

    /// Model field name.
    var name : Optional<String>

    /// Model field value.
    var value : Optional<String>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case name
        case value
    }

    /**
     ResourceAttribute Constructor.
     */
    public override init() {
        self.name = nil
        self.value = nil

        super.init()
    }

    /**
     ResourceAttribute Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? nil
        self.value = try container.decodeIfPresent(String.self, forKey: .value) ?? nil

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

        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.value, forKey: .value)

        try super.encode(to: encoder)
    }

    /**
     Getter for name.

     - Returns:  Optional<String>

     */
    public func getName() -> Optional<String> {
        return self.name
    }

    /**
     Getter for value.

     - Returns:  Optional<String>

     */
    public func getValue() -> Optional<String> {
        return self.value
    }

    /**
     Setter for name.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setName(_ value: String) -> Self {
        self.name = value
        return self
    }

    /**
     Setter for value.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setValue(_ value: String) -> Self {
        self.value = value
        return self
    }
}
