/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderReturn data model.
public class OrderReturn : Model {

    /// Enumeration OrderReturnStatus
    public enum OrderReturnStatus : Int {
        case Issued = 500
        case Received = 600
    }

    /// Model field id.
    var id : Int

    /// Model field order_id.
    var orderId : Int

    /// Model field code.
    var code : String

    /// Model field status.
    var status : Int

    /// Model field dt_issued.
    var dateTimeIssued : Date

    /// Model field dt_recvd.
    var dateTimeReceived : Date

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case code
        case status
        case dateTimeIssued = "dt_issued"
        case dateTimeReceived = "dt_recvd"
    }

    /**
     OrderReturn Constructor.
     */
    public override init() {
        self.id = 0
        self.orderId = 0
        self.code = ""
        self.status = 0
        self.dateTimeIssued = Date(timeIntervalSince1970: 0)
        self.dateTimeReceived = Date(timeIntervalSince1970: 0)

        super.init()
    }

    /**
     OrderReturn Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.status = try container.decodeIfPresent(Int.self, forKey: .status) ?? 0
        self.dateTimeIssued = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int64.self, forKey: .dateTimeIssued) ?? 0))
        self.dateTimeReceived = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int64.self, forKey: .dateTimeReceived) ?? 0))

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
        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(Int64(self.dateTimeIssued.timeIntervalSince1970), forKey: .dateTimeIssued)
        try container.encodeIfPresent(Int64(self.dateTimeReceived.timeIntervalSince1970), forKey: .dateTimeReceived)

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
     Getter for order_id.

     - Returns:  Int

     */
    public func getOrderId() -> Int {
        return self.orderId
    }

    /**
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for status.

     - Returns:  Int

     */
    public func getStatus() -> Int {
        return self.status
    }

    /**
     Getter for dt_issued.

     - Returns:  Date     */
    public func getDateTimeIssued() -> Date {
        return self.dateTimeIssued
    }

    /**
     Getter for dt_recvd.

     - Returns:  Date     */
    public func getDateTimeReceived() -> Date {
        return self.dateTimeReceived
    }
}
