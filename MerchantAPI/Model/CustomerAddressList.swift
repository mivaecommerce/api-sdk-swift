/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CustomerAddressList data model.
public class CustomerAddressList : Model {

    /// Model field ship_id.
    var shipId : Int

    /// Model field bill_id.
    var billId : Int

    /// Model field addresses.
    var addresses : [CustomerAddress]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case shipId = "ship_id"
        case billId = "bill_id"
        case addresses
    }

    /**
     CustomerAddressList Constructor.
     */
    public override init() {
        self.shipId = 0
        self.billId = 0
        self.addresses = []

        super.init()
    }

    /**
     CustomerAddressList Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.shipId = try container.decodeIfPresent(Int.self, forKey: .shipId) ?? 0
        self.billId = try container.decodeIfPresent(Int.self, forKey: .billId) ?? 0
        self.addresses = try container.decodeIfPresent([CustomerAddress].self, forKey: .addresses) ?? []

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

        try container.encodeIfPresent(self.shipId, forKey: .shipId)
        try container.encodeIfPresent(self.billId, forKey: .billId)
        try container.encodeIfPresent(self.addresses, forKey: .addresses)

        try super.encode(to: encoder)
    }

    /**
     Getter for ship_id.

     - Returns:  Int

     */
    public func getShipId() -> Int {
        return self.shipId
    }

    /**
     Getter for bill_id.

     - Returns:  Int

     */
    public func getBillId() -> Int {
        return self.billId
    }

    /**
     Getter for addresses.

     - Returns:  [CustomerAddress]
     */
    public func getAddresses() -> [CustomerAddress] {
        return self.addresses
    }
}
