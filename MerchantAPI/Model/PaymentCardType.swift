/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// PaymentCardType data model.
public class PaymentCardType : Model {

    /// Model field id.
    var id : Int

    /// Model field type.
    var type : String

    /// Model field prefixes.
    var prefixes : String

    /// Model field lengths.
    var lengths : String

    /// Model field cvv.
    var cvv : Bool

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case prefixes
        case lengths
        case cvv
    }

    /**
     PaymentCardType Constructor.
     */
    public override init() {
        self.id = 0
        self.type = ""
        self.prefixes = ""
        self.lengths = ""
        self.cvv = false

        super.init()
    }

    /**
     PaymentCardType Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.prefixes = try container.decodeIfPresent(String.self, forKey: .prefixes) ?? ""
        self.lengths = try container.decodeIfPresent(String.self, forKey: .lengths) ?? ""
        self.cvv = try container.decodeIfPresent(Bool.self, forKey: .cvv) ?? false

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
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.prefixes, forKey: .prefixes)
        try container.encodeIfPresent(self.lengths, forKey: .lengths)
        try container.encodeIfPresent(self.cvv, forKey: .cvv)

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
     Getter for type.

     - Returns:  String

     */
    public func getType() -> String {
        return self.type
    }

    /**
     Getter for prefixes.

     - Returns:  String

     */
    public func getPrefixes() -> String {
        return self.prefixes
    }

    /**
     Getter for lengths.

     - Returns:  String

     */
    public func getLengths() -> String {
        return self.lengths
    }

    /**
     Getter for cvv.

     - Returns:  Bool     */
    public func getCvv() -> Bool {
        return self.cvv
    }
}
