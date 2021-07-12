/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// AvailabilityGroup data model.
public class AvailabilityGroup : Model {

    /// Model field id.
    var id : Int
    /// Model field name.
    var name : String
    /// Model field tax_exempt.
    var taxExempt : Bool
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case taxExempt = "tax_exempt"
    }

    /**
     AvailabilityGroup Constructor.
     */
    public override init() {
        self.id = 0
        self.name = ""
        self.taxExempt = false

        super.init()
    }

    /**
     AvailabilityGroup Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.taxExempt = try container.decodeIfPresent(Bool.self, forKey: .taxExempt) ?? false

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
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.taxExempt, forKey: .taxExempt)

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
     Getter for name.

     - Returns:  String

     */
    public func getName() -> String {
        return self.name
    }

    /**
     Getter for tax_exempt.

     - Returns:  Bool     */
    public func getTaxExempt() -> Bool {
        return self.taxExempt
    }
}
