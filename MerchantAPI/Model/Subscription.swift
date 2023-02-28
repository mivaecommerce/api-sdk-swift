/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Subscription data model.
public class Subscription : Model {

    /// Model field id.
    var id : Int

    /// Model field order_id.
    var orderId : Int

    /// Model field line_id.
    var lineId : Int

    /// Model field cust_id.
    var customerId : Int

    /// Model field custpc_id.
    var customerPaymentCardId : Int

    /// Model field product_id.
    var productId : Int

    /// Model field subterm_id.
    var subscriptionTermId : Int

    /// Model field addr_id.
    var addressId : Int

    /// Model field ship_id.
    var shipId : Int

    /// Model field ship_data.
    var shipData : String

    /// Model field quantity.
    var quantity : Int

    /// Model field termrem.
    var termRemaining : Int

    /// Model field termproc.
    var termProcessed : Int

    /// Model field firstdate.
    var firstDate : Date

    /// Model field lastdate.
    var lastDate : Date

    /// Model field nextdate.
    var nextDate : Date

    /// Model field status.
    var status : String

    /// Model field message.
    var message : String

    /// Model field cncldate.
    var cancelDate : Date

    /// Model field tax.
    var tax : Decimal

    /// Model field formatted_tax.
    var formattedTax : String

    /// Model field shipping.
    var shipping : Decimal

    /// Model field formatted_shipping.
    var formattedShipping : String

    /// Model field subtotal.
    var subtotal : Decimal

    /// Model field formatted_subtotal.
    var formattedSubtotal : String

    /// Model field total.
    var total : Decimal

    /// Model field formatted_total.
    var formattedTotal : String

    /// Model field authfails.
    var authorizationFailureCount : Int

    /// Model field lastafail.
    var lastAuthorizationFailure : Date

    /// Model field options.
    var options : [SubscriptionOption]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case lineId = "line_id"
        case customerId = "cust_id"
        case customerPaymentCardId = "custpc_id"
        case productId = "product_id"
        case subscriptionTermId = "subterm_id"
        case addressId = "addr_id"
        case shipId = "ship_id"
        case shipData = "ship_data"
        case quantity
        case termRemaining = "termrem"
        case termProcessed = "termproc"
        case firstDate = "firstdate"
        case lastDate = "lastdate"
        case nextDate = "nextdate"
        case status
        case message
        case cancelDate = "cncldate"
        case tax
        case formattedTax = "formatted_tax"
        case shipping
        case formattedShipping = "formatted_shipping"
        case subtotal
        case formattedSubtotal = "formatted_subtotal"
        case total
        case formattedTotal = "formatted_total"
        case authorizationFailureCount = "authfails"
        case lastAuthorizationFailure = "lastafail"
        case options
    }

    /**
     Subscription Constructor.
     */
    public override init() {
        self.id = 0
        self.orderId = 0
        self.lineId = 0
        self.customerId = 0
        self.customerPaymentCardId = 0
        self.productId = 0
        self.subscriptionTermId = 0
        self.addressId = 0
        self.shipId = 0
        self.shipData = ""
        self.quantity = 0
        self.termRemaining = 0
        self.termProcessed = 0
        self.firstDate = Date(timeIntervalSince1970: 0)
        self.lastDate = Date(timeIntervalSince1970: 0)
        self.nextDate = Date(timeIntervalSince1970: 0)
        self.status = ""
        self.message = ""
        self.cancelDate = Date(timeIntervalSince1970: 0)
        self.tax = Decimal(0.00)
        self.formattedTax = ""
        self.shipping = Decimal(0.00)
        self.formattedShipping = ""
        self.subtotal = Decimal(0.00)
        self.formattedSubtotal = ""
        self.total = Decimal(0.00)
        self.formattedTotal = ""
        self.authorizationFailureCount = 0
        self.lastAuthorizationFailure = Date(timeIntervalSince1970: 0)
        self.options = []

        super.init()
    }

    /**
     Subscription Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.lineId = try container.decodeIfPresent(Int.self, forKey: .lineId) ?? 0
        self.customerId = try container.decodeIfPresent(Int.self, forKey: .customerId) ?? 0
        self.customerPaymentCardId = try container.decodeIfPresent(Int.self, forKey: .customerPaymentCardId) ?? 0
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.subscriptionTermId = try container.decodeIfPresent(Int.self, forKey: .subscriptionTermId) ?? 0
        self.addressId = try container.decodeIfPresent(Int.self, forKey: .addressId) ?? 0
        self.shipId = try container.decodeIfPresent(Int.self, forKey: .shipId) ?? 0
        self.shipData = try container.decodeIfPresent(String.self, forKey: .shipData) ?? ""
        self.quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? 0
        self.termRemaining = try container.decodeIfPresent(Int.self, forKey: .termRemaining) ?? 0
        self.termProcessed = try container.decodeIfPresent(Int.self, forKey: .termProcessed) ?? 0
        self.firstDate = try container.decodeIfPresent(DateTime.self, forKey: .firstDate)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.lastDate = try container.decodeIfPresent(DateTime.self, forKey: .lastDate)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.nextDate = try container.decodeIfPresent(DateTime.self, forKey: .nextDate)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        self.cancelDate = try container.decodeIfPresent(DateTime.self, forKey: .cancelDate)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.tax = try container.decodeIfPresent(Decimal.self, forKey: .tax) ?? Decimal(0.00)
        self.formattedTax = try container.decodeIfPresent(String.self, forKey: .formattedTax) ?? ""
        self.shipping = try container.decodeIfPresent(Decimal.self, forKey: .shipping) ?? Decimal(0.00)
        self.formattedShipping = try container.decodeIfPresent(String.self, forKey: .formattedShipping) ?? ""
        self.subtotal = try container.decodeIfPresent(Decimal.self, forKey: .subtotal) ?? Decimal(0.00)
        self.formattedSubtotal = try container.decodeIfPresent(String.self, forKey: .formattedSubtotal) ?? ""
        self.total = try container.decodeIfPresent(Decimal.self, forKey: .total) ?? Decimal(0.00)
        self.formattedTotal = try container.decodeIfPresent(String.self, forKey: .formattedTotal) ?? ""
        self.authorizationFailureCount = try container.decodeIfPresent(Int.self, forKey: .authorizationFailureCount) ?? 0
        self.lastAuthorizationFailure = try container.decodeIfPresent(DateTime.self, forKey: .lastAuthorizationFailure)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.options = try container.decodeIfPresent([SubscriptionOption].self, forKey: .options) ?? []

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
        try container.encodeIfPresent(self.lineId, forKey: .lineId)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encodeIfPresent(self.customerPaymentCardId, forKey: .customerPaymentCardId)
        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.subscriptionTermId, forKey: .subscriptionTermId)
        try container.encodeIfPresent(self.addressId, forKey: .addressId)
        try container.encodeIfPresent(self.shipId, forKey: .shipId)
        try container.encodeIfPresent(self.shipData, forKey: .shipData)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.termRemaining, forKey: .termRemaining)
        try container.encodeIfPresent(self.termProcessed, forKey: .termProcessed)
        try container.encodeIfPresent(Int64(self.firstDate.timeIntervalSince1970), forKey: .firstDate)
        try container.encodeIfPresent(Int64(self.lastDate.timeIntervalSince1970), forKey: .lastDate)
        try container.encodeIfPresent(Int64(self.nextDate.timeIntervalSince1970), forKey: .nextDate)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeIfPresent(Int64(self.cancelDate.timeIntervalSince1970), forKey: .cancelDate)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.tax, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .tax)
        try container.encodeIfPresent(self.formattedTax, forKey: .formattedTax)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.shipping, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .shipping)
        try container.encodeIfPresent(self.formattedShipping, forKey: .formattedShipping)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.subtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .subtotal)
        try container.encodeIfPresent(self.formattedSubtotal, forKey: .formattedSubtotal)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.total, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .total)
        try container.encodeIfPresent(self.formattedTotal, forKey: .formattedTotal)
        try container.encodeIfPresent(self.authorizationFailureCount, forKey: .authorizationFailureCount)
        try container.encodeIfPresent(Int64(self.lastAuthorizationFailure.timeIntervalSince1970), forKey: .lastAuthorizationFailure)
        try container.encodeIfPresent(self.options, forKey: .options)

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
     Getter for line_id.

     - Returns:  Int

     */
    public func getLineId() -> Int {
        return self.lineId
    }

    /**
     Getter for cust_id.

     - Returns:  Int

     */
    public func getCustomerId() -> Int {
        return self.customerId
    }

    /**
     Getter for custpc_id.

     - Returns:  Int

     */
    public func getCustomerPaymentCardId() -> Int {
        return self.customerPaymentCardId
    }

    /**
     Getter for product_id.

     - Returns:  Int

     */
    public func getProductId() -> Int {
        return self.productId
    }

    /**
     Getter for subterm_id.

     - Returns:  Int

     */
    public func getSubscriptionTermId() -> Int {
        return self.subscriptionTermId
    }

    /**
     Getter for addr_id.

     - Returns:  Int

     */
    public func getAddressId() -> Int {
        return self.addressId
    }

    /**
     Getter for ship_id.

     - Returns:  Int

     */
    public func getShipId() -> Int {
        return self.shipId
    }

    /**
     Getter for ship_data.

     - Returns:  String

     */
    public func getShipData() -> String {
        return self.shipData
    }

    /**
     Getter for quantity.

     - Returns:  Int

     */
    public func getQuantity() -> Int {
        return self.quantity
    }

    /**
     Getter for termrem.

     - Returns:  Int

     */
    public func getTermRemaining() -> Int {
        return self.termRemaining
    }

    /**
     Getter for termproc.

     - Returns:  Int

     */
    public func getTermProcessed() -> Int {
        return self.termProcessed
    }

    /**
     Getter for firstdate.

     - Returns:  Date     */
    public func getFirstDate() -> Date {
        return self.firstDate
    }

    /**
     Getter for lastdate.

     - Returns:  Date     */
    public func getLastDate() -> Date {
        return self.lastDate
    }

    /**
     Getter for nextdate.

     - Returns:  Date     */
    public func getNextDate() -> Date {
        return self.nextDate
    }

    /**
     Getter for status.

     - Returns:  String

     */
    public func getStatus() -> String {
        return self.status
    }

    /**
     Getter for message.

     - Returns:  String

     */
    public func getMessage() -> String {
        return self.message
    }

    /**
     Getter for cncldate.

     - Returns:  Date     */
    public func getCancelDate() -> Date {
        return self.cancelDate
    }

    /**
     Getter for tax.

     - Returns:  Decimal     */
    public func getTax() -> Decimal {
        return self.tax
    }

    /**
     Getter for formatted_tax.

     - Returns:  String

     */
    public func getFormattedTax() -> String {
        return self.formattedTax
    }

    /**
     Getter for shipping.

     - Returns:  Decimal     */
    public func getShipping() -> Decimal {
        return self.shipping
    }

    /**
     Getter for formatted_shipping.

     - Returns:  String

     */
    public func getFormattedShipping() -> String {
        return self.formattedShipping
    }

    /**
     Getter for subtotal.

     - Returns:  Decimal     */
    public func getSubtotal() -> Decimal {
        return self.subtotal
    }

    /**
     Getter for formatted_subtotal.

     - Returns:  String

     */
    public func getFormattedSubtotal() -> String {
        return self.formattedSubtotal
    }

    /**
     Getter for total.

     - Returns:  Decimal     */
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

    /**
     Getter for authfails.

     - Returns:  Int

     */
    public func getAuthorizationFailureCount() -> Int {
        return self.authorizationFailureCount
    }

    /**
     Getter for lastafail.

     - Returns:  Date     */
    public func getLastAuthorizationFailure() -> Date {
        return self.lastAuthorizationFailure
    }

    /**
     Getter for options.

     - Returns:  [SubscriptionOption]
     */
    public func getOptions() -> [SubscriptionOption] {
        return self.options
    }
}
