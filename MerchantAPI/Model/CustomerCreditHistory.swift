/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CustomerCreditHistory data model.
public class CustomerCreditHistory : Model {

    /// Model field id.
    var id : Int

    /// Model field user_id.
    var userId : Int

    /// Model field cust_id.
    var customerId : Int

    /// Model field order_id.
    var orderId : Int

    /// Model field txref.
    var transactionReference : String

    /// Model field descrip.
    var description : String

    /// Model field amount.
    var amount : Decimal

    /// Model field dtstamp.
    var dateTimeStamp : Date

    /// Model field user_name.
    var userName : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case customerId = "cust_id"
        case orderId = "order_id"
        case transactionReference = "txref"
        case description = "descrip"
        case amount
        case dateTimeStamp = "dtstamp"
        case userName = "user_name"
    }

    /**
     CustomerCreditHistory Constructor.
     */
    public override init() {
        self.id = 0
        self.userId = 0
        self.customerId = 0
        self.orderId = 0
        self.transactionReference = ""
        self.description = ""
        self.amount = Decimal(0.00)
        self.dateTimeStamp = Date(timeIntervalSince1970: 0)
        self.userName = ""

        super.init()
    }

    /**
     CustomerCreditHistory Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        self.customerId = try container.decodeIfPresent(Int.self, forKey: .customerId) ?? 0
        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.transactionReference = try container.decodeIfPresent(String.self, forKey: .transactionReference) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.amount = try container.decodeIfPresent(Decimal.self, forKey: .amount) ?? Decimal(0.00)
        self.dateTimeStamp = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int64.self, forKey: .dateTimeStamp) ?? 0))
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName) ?? ""

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
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.transactionReference, forKey: .transactionReference)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.amount, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .amount)
        try container.encodeIfPresent(Int64(self.dateTimeStamp.timeIntervalSince1970), forKey: .dateTimeStamp)
        try container.encodeIfPresent(self.userName, forKey: .userName)

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
     Getter for user_id.

     - Returns:  Int

     */
    public func getUserId() -> Int {
        return self.userId
    }

    /**
     Getter for cust_id.

     - Returns:  Int

     */
    public func getCustomerId() -> Int {
        return self.customerId
    }

    /**
     Getter for order_id.

     - Returns:  Int

     */
    public func getOrderId() -> Int {
        return self.orderId
    }

    /**
     Getter for txref.

     - Returns:  String

     */
    public func getTransactionReference() -> String {
        return self.transactionReference
    }

    /**
     Getter for descrip.

     - Returns:  String

     */
    public func getDescription() -> String {
        return self.description
    }

    /**
     Getter for amount.

     - Returns:  Decimal     */
    public func getAmount() -> Decimal {
        return self.amount
    }

    /**
     Getter for dtstamp.

     - Returns:  Date     */
    public func getDateTimeStamp() -> Date {
        return self.dateTimeStamp
    }

    /**
     Getter for user_name.

     - Returns:  String

     */
    public func getUserName() -> String {
        return self.userName
    }
}
