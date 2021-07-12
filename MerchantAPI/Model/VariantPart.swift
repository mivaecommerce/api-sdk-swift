/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// VariantPart data model.
public class VariantPart : Model {

    /// Model field part_id.
    var partId : Optional<Int>
    /// Model field quantity.
    var quantity : Optional<Int>
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case partId = "part_id"
        case quantity
    }

    /**
     VariantPart Constructor.
     */
    public override init() {
        self.partId = nil
        self.quantity = nil

        super.init()
    }

    /**
     VariantPart Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.partId = try container.decodeIfPresent(Int.self, forKey: .partId) ?? nil
        self.quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? nil

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

        try container.encodeIfPresent(self.partId, forKey: .partId)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)

        try super.encode(to: encoder)
    }

    /**
     Getter for part_id.

     - Returns:  Optional<Int>

     */
    public func getPartId() -> Optional<Int> {
        return self.partId
    }

    /**
     Getter for quantity.

     - Returns:  Optional<Int>

     */
    public func getQuantity() -> Optional<Int> {
        return self.quantity
    }

    /**
     Setter for part_id.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPartId(_ value: Int) -> Self {
        self.partId = value
        return self
    }

    /**
     Setter for quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setQuantity(_ value: Int) -> Self {
        self.quantity = value
        return self
    }
}
