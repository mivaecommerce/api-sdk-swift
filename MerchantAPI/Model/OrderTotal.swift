/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// OrderTotal data model.
public class OrderTotal : Model {

    /// Model field total.
    var total : Decimal

    /// Model field formatted_total.
    var formattedTotal : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case total
        case formattedTotal = "formatted_total"
    }

    /**
     OrderTotal Constructor.
     */
    public override init() {
        self.total = Decimal(0.00)
        self.formattedTotal = ""

        super.init()
    }

    /**
     OrderTotal Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decodeIfPresent(Decimal.self, forKey: .total) ?? Decimal(0.00)
        self.formattedTotal = try container.decodeIfPresent(String.self, forKey: .formattedTotal) ?? ""

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

        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.total, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .total)
        try container.encodeIfPresent(self.formattedTotal, forKey: .formattedTotal)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for total.
     
     - Returns:  Decimal
     */
    public func getTotal() -> Decimal {
        return self.total
    }
    
    /**
     Getter for formatted_total.

     - Returns:  String
     */
    public func getFormattedTotal() -> String {
        return self.formattedTotal
    }
}
