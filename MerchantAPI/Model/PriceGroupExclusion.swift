/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// PriceGroupExclusion data model.
public class PriceGroupExclusion : Model {

    /// Enumeration ExclusionScope
    public enum ExclusionScope : String {
        case Basket = "basket"
        case Group = "group"
        case Item = "item"
    }

    /// Model field id.
    var id : Int

    /// Model field scope.
    var scope : Optional<String>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case scope
    }

    /**
     PriceGroupExclusion Constructor.
     */
    public override init() {
        self.id = 0
        self.scope = nil

        super.init()
    }

    /**
     PriceGroupExclusion Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.scope = try container.decodeIfPresent(String.self, forKey: .scope) ?? nil

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
        try container.encodeIfPresent(self.scope, forKey: .scope)

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
     Getter for scope.

     - Returns:  Optional<String>

     */
    public func getScope() -> Optional<String> {
        return self.scope
    }

    /**
     Enum Getter for scope.

     - Returns:  Optional<ExclusionScope>
     */
    public func getScope() -> Optional<ExclusionScope> {
        if let v = self.scope {
            return ExclusionScope(rawValue: v) ?? nil
        }
        return nil;
    }

    /**
     Setter for id.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setId(_ value: Int) -> Self {
        self.id = value
        return self
    }

    /**
     Setter for scope.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setScope(_ value: String) -> Self {
        self.scope = value
        return self
    }

    /**
     Enum Getter for scope.

     - Parameters:
        - value: ExclusionScope
     - Returns:  Self
     */
    @discardableResult
    public func setScope(_ value: ExclusionScope) -> Self {
        self.scope = value.rawValue
        return self
    }
}
