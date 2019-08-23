/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// CouponPriceGroup data model.
public class CouponPriceGroup : PriceGroup {

    /// Model field assigned.
    var assigned : Bool

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case assigned
    }

    /**
     CouponPriceGroup Constructor.
     */
    public override init() {
        self.assigned = false

        super.init()
    }

    /**
     CouponPriceGroup Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.assigned = try container.decodeIfPresent(Bool.self, forKey: .assigned) ?? false

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

        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for assigned.
     
     - Returns:  Bool
     */
    public func getAssigned() -> Bool {
        return self.assigned
    }
}
