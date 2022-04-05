/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ReceivedReturn data model.
public class ReceivedReturn : Model {

    /// Model field return_id.
    var returnId : Optional<Int>

    /// Model field adjust_inventory.
    var adjustInventory : Optional<Int>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case returnId = "return_id"
        case adjustInventory = "adjust_inventory"
    }

    /**
     ReceivedReturn Constructor.
     */
    public override init() {
        self.returnId = nil
        self.adjustInventory = nil

        super.init()
    }

    /**
     ReceivedReturn Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.returnId = try container.decodeIfPresent(Int.self, forKey: .returnId) ?? nil
        self.adjustInventory = try container.decodeIfPresent(Int.self, forKey: .adjustInventory) ?? nil

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

        try container.encodeIfPresent(self.returnId, forKey: .returnId)
        try container.encodeIfPresent(self.adjustInventory, forKey: .adjustInventory)

        try super.encode(to: encoder)
    }

    /**
     Getter for return_id.

     - Returns:  Optional<Int>

     */
    public func getReturnId() -> Optional<Int> {
        return self.returnId
    }

    /**
     Getter for adjust_inventory.

     - Returns:  Optional<Int>

     */
    public func getAdjustInventory() -> Optional<Int> {
        return self.adjustInventory
    }

    /**
     Setter for return_id.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setReturnId(_ value: Int) -> Self {
        self.returnId = value
        return self
    }

    /**
     Setter for adjust_inventory.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAdjustInventory(_ value: Int) -> Self {
        self.adjustInventory = value
        return self
    }
}
