/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderPayment data model.
public class OrderPayment : Model {

    /// Enumeration OrderPaymentType
    public enum OrderPaymentType : Int {
        case Declined = 0
        case LegacyAuth = 1
        case LegacyCapture = 2
        case Auth = 3
        case Capture = 4
        case AuthCapture = 5
        case Refund = 6
        case Void = 7
    }

    /// Model field id.
    var id : Int

    /// Model field order_id.
    var orderId : Int

    /// Model field type.
    var type : Int

    /// Model field refnum.
    var referenceNumber : String

    /// Model field amount.
    var amount : Decimal

    /// Model field formatted_amount.
    var formattedAmount : String

    /// Model field available.
    var available : Decimal

    /// Model field formatted_available.
    var formattedAvailable : String

    /// Model field dtstamp.
    var dateTimeStamp : Date

    /// Model field expires.
    var expires : Date

    /// Model field pay_id.
    var paymentId : Int

    /// Model field pay_secid.
    var paymentSecId : Int

    /// Model field decrypt_status.
    var decryptStatus : String

    /// Model field decrypt_error.
    var decryptError : String

    /// Model field description.
    var description : String

    /// Model field data.
    var paymentData : [String:String]

    /// Model field ip.
    var ip : String

    /// Model field module
    var module : Module

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case type
        case referenceNumber = "refnum"
        case amount
        case formattedAmount = "formatted_amount"
        case available
        case formattedAvailable = "formatted_available"
        case dateTimeStamp = "dtstamp"
        case expires
        case paymentId = "pay_id"
        case paymentSecId = "pay_secid"
        case decryptStatus = "decrypt_status"
        case decryptError = "decrypt_error"
        case description
        case paymentData = "data"
        case ip
        case module
    }

    /**
     OrderPayment Constructor.
     */
    public override init() {
        self.id = 0
        self.orderId = 0
        self.type = 0
        self.referenceNumber = ""
        self.amount = Decimal(0.00)
        self.formattedAmount = ""
        self.available = Decimal(0.00)
        self.formattedAvailable = ""
        self.dateTimeStamp = Date(timeIntervalSince1970: 0)
        self.expires = Date(timeIntervalSince1970: 0)
        self.paymentId = 0
        self.paymentSecId = 0
        self.decryptStatus = ""
        self.decryptError = ""
        self.description = ""
        self.paymentData = [:]
        self.ip = ""
        self.module = Module()

        super.init()
    }

    /**
     OrderPayment Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.type = try container.decodeIfPresent(Int.self, forKey: .type) ?? 0
        self.referenceNumber = try container.decodeIfPresent(String.self, forKey: .referenceNumber) ?? ""
        self.amount = try container.decodeIfPresent(Decimal.self, forKey: .amount) ?? Decimal(0.00)
        self.formattedAmount = try container.decodeIfPresent(String.self, forKey: .formattedAmount) ?? ""
        self.available = try container.decodeIfPresent(Decimal.self, forKey: .available) ?? Decimal(0.00)
        self.formattedAvailable = try container.decodeIfPresent(String.self, forKey: .formattedAvailable) ?? ""
        self.dateTimeStamp = try container.decodeIfPresent(DateTime.self, forKey: .dateTimeStamp)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.expires = try container.decodeIfPresent(DateTime.self, forKey: .expires)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.paymentId = try container.decodeIfPresent(Int.self, forKey: .paymentId) ?? 0
        self.paymentSecId = try container.decodeIfPresent(Int.self, forKey: .paymentSecId) ?? 0
        self.decryptStatus = try container.decodeIfPresent(String.self, forKey: .decryptStatus) ?? ""
        self.decryptError = try container.decodeIfPresent(String.self, forKey: .decryptError) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.paymentData = try container.decodeIfPresent([String:String].self, forKey: .paymentData) ?? [:]
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip) ?? ""
        self.module = try container.decodeIfPresent(Module.self, forKey: .module) ?? Module()

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
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.referenceNumber, forKey: .referenceNumber)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.amount, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .amount)
        try container.encodeIfPresent(self.formattedAmount, forKey: .formattedAmount)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.available, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .available)
        try container.encodeIfPresent(self.formattedAvailable, forKey: .formattedAvailable)
        try container.encodeIfPresent(Int64(self.dateTimeStamp.timeIntervalSince1970), forKey: .dateTimeStamp)
        try container.encodeIfPresent(Int64(self.expires.timeIntervalSince1970), forKey: .expires)
        try container.encodeIfPresent(self.paymentId, forKey: .paymentId)
        try container.encodeIfPresent(self.paymentSecId, forKey: .paymentSecId)
        try container.encodeIfPresent(self.decryptStatus, forKey: .decryptStatus)
        try container.encodeIfPresent(self.decryptError, forKey: .decryptError)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.paymentData, forKey: .paymentData)
        try container.encodeIfPresent(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.module, forKey: .module)

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
     Getter for type.

     - Returns:  Int

     */
    public func getType() -> Int {
        return self.type
    }

    /**
     Enum Getter for type.

     - Returns:  Optional<OrderPaymentType>
     */
    public func getType() -> Optional<OrderPaymentType> {
        return OrderPaymentType(rawValue: self.type) ?? nil
    }

    /**
     Getter for refnum.

     - Returns:  String

     */
    public func getReferenceNumber() -> String {
        return self.referenceNumber
    }

    /**
     Getter for amount.

     - Returns:  Decimal     */
    public func getAmount() -> Decimal {
        return self.amount
    }

    /**
     Getter for formatted_amount.

     - Returns:  String

     */
    public func getFormattedAmount() -> String {
        return self.formattedAmount
    }

    /**
     Getter for available.

     - Returns:  Decimal     */
    public func getAvailable() -> Decimal {
        return self.available
    }

    /**
     Getter for formatted_available.

     - Returns:  String

     */
    public func getFormattedAvailable() -> String {
        return self.formattedAvailable
    }

    /**
     Getter for dtstamp.

     - Returns:  Date     */
    public func getDateTimeStamp() -> Date {
        return self.dateTimeStamp
    }

    /**
     Getter for expires.

     - Returns:  Date     */
    public func getExpires() -> Date {
        return self.expires
    }

    /**
     Getter for pay_id.

     - Returns:  Int

     */
    public func getPaymentId() -> Int {
        return self.paymentId
    }

    /**
     Getter for pay_secid.

     - Returns:  Int

     */
    public func getPaymentSecId() -> Int {
        return self.paymentSecId
    }

    /**
     Getter for decrypt_status.

     - Returns:  String

     */
    public func getDecryptStatus() -> String {
        return self.decryptStatus
    }

    /**
     Getter for decrypt_error.

     - Returns:  String

     */
    public func getDecryptError() -> String {
        return self.decryptError
    }

    /**
     Getter for description.

     - Returns:  String

     */
    public func getDescription() -> String {
        return self.description
    }

    /**
     Getter for data.

     - Returns:  [String:String]
     */
    public func getPaymentData() -> [String:String] {
        return self.paymentData
    }

    /**
     Getter for ip.

     - Returns:  String

     */
    public func getIp() -> String {
        return self.ip
    }

    /**
     Getter for module.

     - Returns:  Module
     */
    public func getModule() -> Module {
        return self.module
    }
}
