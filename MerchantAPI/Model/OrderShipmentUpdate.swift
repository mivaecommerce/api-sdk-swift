/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderShipmentUpdate data model.
public class OrderShipmentUpdate : Model {

    /// Model field shpmnt_id.
    var shipmentId : Int

    /// Model field mark_shipped.
    var markShipped : Optional<Bool>

    /// Model field tracknum.
    var trackingNumber : String

    /// Model field tracktype.
    var trackingType : String

    /// Model field cost.
    var cost : Optional<Decimal>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shpmnt_id"
        case markShipped = "mark_shipped"
        case trackingNumber = "tracknum"
        case trackingType = "tracktype"
        case cost
    }

    /**
     OrderShipmentUpdate Constructor.
     */
    public override init() {
        self.shipmentId = 0
        self.markShipped = nil
        self.trackingNumber = ""
        self.trackingType = ""
        self.cost = nil

        super.init()
    }

    /**
     OrderShipmentUpdate Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.shipmentId = try container.decodeIfPresent(Int.self, forKey: .shipmentId) ?? 0
        self.markShipped = try container.decodeIfPresent(Bool.self, forKey: .markShipped) ?? nil
        self.trackingNumber = try container.decodeIfPresent(String.self, forKey: .trackingNumber) ?? ""
        self.trackingType = try container.decodeIfPresent(String.self, forKey: .trackingType) ?? ""
        self.cost = try container.decodeIfPresent(Decimal.self, forKey: .cost) ?? nil

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

        try container.encodeIfPresent(self.shipmentId, forKey: .shipmentId)
        try container.encodeIfPresent(self.markShipped, forKey: .markShipped)
        try container.encodeIfPresent(self.trackingNumber, forKey: .trackingNumber)
        try container.encodeIfPresent(self.trackingType, forKey: .trackingType)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: 2), forKey: .cost)

        try super.encode(to: encoder)
    }

    /**
     Getter for shpmnt_id.

     - Returns:  Int

     */
    public func getShipmentId() -> Int {
        return self.shipmentId
    }

    /**
     Getter for mark_shipped.

     - Returns:  Optional<Bool>     */
    public func getMarkShipped() -> Optional<Bool> {
        return self.markShipped
    }

    /**
     Getter for tracknum.

     - Returns:  String

     */
    public func getTrackingNumber() -> String {
        return self.trackingNumber
    }

    /**
     Getter for tracktype.

     - Returns:  String

     */
    public func getTrackingType() -> String {
        return self.trackingType
    }

    /**
     Getter for cost.

     - Returns:  Optional<Decimal>     */
    public func getCost() -> Optional<Decimal> {
        return self.cost
    }

    /**
     Setter for shpmnt_id.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setShipmentId(_ value: Int) -> Self {
        self.shipmentId = value
        return self
    }

    /**
     Setter for mark_shipped.

     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setMarkShipped(_ value: Bool) -> Self {
        self.markShipped = value
        return self
    }

    /**
     Setter for tracknum.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setTrackingNumber(_ value: String) -> Self {
        self.trackingNumber = value
        return self
    }

    /**
     Setter for tracktype.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setTrackingType(_ value: String) -> Self {
        self.trackingType = value
        return self
    }

    /**
     Setter for cost.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setCost(_ value: Decimal) -> Self {
        self.cost = value
        return self
    }
}
