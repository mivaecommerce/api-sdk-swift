/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderItem data model.
public class OrderItem : Model {

    /// Enumeration OrderItemStatus
    public enum OrderItemStatus : Int {
        case Pending = 0
        case Processing = 100
        case Shipped = 200
        case PartiallyShipped = 201
        case GiftCertNotRedeemed = 210
        case GiftCertRedeemed = 211
        case DigitalNotDownloaded = 220
        case DigitalDownloaded = 221
        case Cancelled = 300
        case Backordered = 400
        case RmaIssued = 500
        case Returned = 600
    }

    /// Model field order_id.
    var orderId : Int
    /// Model field line_id.
    var lineId : Int
    /// Model field status.
    var status : Int
    /// Model field subscrp_id.
    var subscriptionId : Int
    /// Model field subterm_id.
    var subscriptionTermId : Int
    /// Model field rma_id.
    var rmaId : Int
    /// Model field rma_code.
    var rmaCode : String
    /// Model field rma_dt_issued.
    var rmaDataTimeIssued : Date
    /// Model field rma_dt_recvd.
    var rmaDateTimeReceived : Date
    /// Model field dt_instock.
    var dateInStock : Date
    /// Model field code.
    var code : Optional<String>
    /// Model field name.
    var name : Optional<String>
    /// Model field sku.
    var sku : Optional<String>
    /// Model field retail.
    var retail : Decimal
    /// Model field base_price.
    var basePrice : Decimal
    /// Model field price.
    var price : Optional<Decimal>
    /// Model field tax.
    var tax : Optional<Decimal>
    /// Model field formatted_tax.
    var formattedTax : String
    /// Model field weight.
    var weight : Optional<Decimal>
    /// Model field taxable.
    var taxable : Optional<Bool>
    /// Model field upsold.
    var upsold : Optional<Bool>
    /// Model field quantity.
    var quantity : Optional<Int>
    /// Model field shipment
    var shipment : OrderShipment

    /// Model field discounts.
    var discounts : [OrderItemDiscount]

    /// Model field options.
    var options : [OrderItemOption]

    /// Model field subscription
    var subscription : OrderItemSubscription

    /// Model field total.
    var total : Decimal
    /// Model field tracktype.
    var trackingType : Optional<String>
    /// Model field tracknum.
    var trackingNumber : Optional<String>
    /// Model field shpmnt_id.
    var shipmentId : Int
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case lineId = "line_id"
        case status
        case subscriptionId = "subscrp_id"
        case subscriptionTermId = "subterm_id"
        case rmaId = "rma_id"
        case rmaCode = "rma_code"
        case rmaDataTimeIssued = "rma_dt_issued"
        case rmaDateTimeReceived = "rma_dt_recvd"
        case dateInStock = "dt_instock"
        case code
        case name
        case sku
        case retail
        case basePrice = "base_price"
        case price
        case tax
        case formattedTax = "formatted_tax"
        case weight
        case taxable
        case upsold
        case quantity
        case shipment
        case discounts
        case options
        case subscription
        case total
        case trackingType = "tracktype"
        case trackingNumber = "tracknum"
        case shipmentId = "shpmnt_id"
    }

    /**
     OrderItem Constructor.
     */
    public override init() {
        self.orderId = 0
        self.lineId = 0
        self.status = 0
        self.subscriptionId = 0
        self.subscriptionTermId = 0
        self.rmaId = 0
        self.rmaCode = ""
        self.rmaDataTimeIssued = Date(timeIntervalSince1970: 0)
        self.rmaDateTimeReceived = Date(timeIntervalSince1970: 0)
        self.dateInStock = Date(timeIntervalSince1970: 0)
        self.code = nil
        self.name = nil
        self.sku = nil
        self.retail = Decimal(0.00)
        self.basePrice = Decimal(0.00)
        self.price = nil
        self.tax = nil
        self.formattedTax = ""
        self.weight = nil
        self.taxable = nil
        self.upsold = nil
        self.quantity = nil
        self.shipment = OrderShipment()
        self.discounts = []
        self.options = []
        self.subscription = OrderItemSubscription()
        self.total = Decimal(0.00)
        self.trackingType = nil
        self.trackingNumber = nil
        self.shipmentId = 0

        super.init()
    }

    /**
     OrderItem Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.lineId = try container.decodeIfPresent(Int.self, forKey: .lineId) ?? 0
        self.status = try container.decodeIfPresent(Int.self, forKey: .status) ?? 0
        self.subscriptionId = try container.decodeIfPresent(Int.self, forKey: .subscriptionId) ?? 0
        self.subscriptionTermId = try container.decodeIfPresent(Int.self, forKey: .subscriptionTermId) ?? 0
        self.rmaId = try container.decodeIfPresent(Int.self, forKey: .rmaId) ?? 0
        self.rmaCode = try container.decodeIfPresent(String.self, forKey: .rmaCode) ?? ""
        self.rmaDataTimeIssued = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int.self, forKey: .rmaDataTimeIssued) ?? 0))
        self.rmaDateTimeReceived = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int.self, forKey: .rmaDateTimeReceived) ?? 0))
        self.dateInStock = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int.self, forKey: .dateInStock) ?? 0))
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? nil
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? nil
        self.sku = try container.decodeIfPresent(String.self, forKey: .sku) ?? nil
        self.retail = try container.decodeIfPresent(Decimal.self, forKey: .retail) ?? Decimal(0.00)
        self.basePrice = try container.decodeIfPresent(Decimal.self, forKey: .basePrice) ?? Decimal(0.00)
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? nil
        self.tax = try container.decodeIfPresent(Decimal.self, forKey: .tax) ?? nil
        self.formattedTax = try container.decodeIfPresent(String.self, forKey: .formattedTax) ?? ""
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? nil
        self.taxable = try container.decodeIfPresent(Bool.self, forKey: .taxable) ?? nil
        self.upsold = try container.decodeIfPresent(Bool.self, forKey: .upsold) ?? nil
        self.quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? nil
        self.shipment = try container.decodeIfPresent(OrderShipment.self, forKey: .shipment) ?? OrderShipment()
        self.discounts = try container.decodeIfPresent([OrderItemDiscount].self, forKey: .discounts) ?? []
        self.options = try container.decodeIfPresent([OrderItemOption].self, forKey: .options) ?? []
        self.subscription = try container.decodeIfPresent(OrderItemSubscription.self, forKey: .subscription) ?? OrderItemSubscription()
        self.total = try container.decodeIfPresent(Decimal.self, forKey: .total) ?? Decimal(0.00)
        self.trackingType = try container.decodeIfPresent(String.self, forKey: .trackingType) ?? nil
        self.trackingNumber = try container.decodeIfPresent(String.self, forKey: .trackingNumber) ?? nil
        self.shipmentId = try container.decodeIfPresent(Int.self, forKey: .shipmentId) ?? 0

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

        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.lineId, forKey: .lineId)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subscriptionId, forKey: .subscriptionId)
        try container.encodeIfPresent(self.subscriptionTermId, forKey: .subscriptionTermId)
        try container.encodeIfPresent(self.rmaId, forKey: .rmaId)
        try container.encodeIfPresent(self.rmaCode, forKey: .rmaCode)
        try container.encodeIfPresent(Int(self.rmaDataTimeIssued.timeIntervalSince1970), forKey: .rmaDataTimeIssued)
        try container.encodeIfPresent(Int(self.rmaDateTimeReceived.timeIntervalSince1970), forKey: .rmaDateTimeReceived)
        try container.encodeIfPresent(Int(self.dateInStock.timeIntervalSince1970), forKey: .dateInStock)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.sku, forKey: .sku)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.retail, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .retail)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basePrice, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basePrice)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.tax, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .tax)
        try container.encodeIfPresent(self.formattedTax, forKey: .formattedTax)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .weight)
        try container.encodeIfPresent(self.taxable, forKey: .taxable)
        try container.encodeIfPresent(self.upsold, forKey: .upsold)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.shipment, forKey: .shipment)
        try container.encodeIfPresent(self.discounts, forKey: .discounts)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encodeIfPresent(self.subscription, forKey: .subscription)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.total, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .total)
        try container.encodeIfPresent(self.trackingType, forKey: .trackingType)
        try container.encodeIfPresent(self.trackingNumber, forKey: .trackingNumber)
        try container.encodeIfPresent(self.shipmentId, forKey: .shipmentId)

        try super.encode(to: encoder)
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
     Getter for status.

     - Returns:  Int

     */
    public func getStatus() -> Int {
        return self.status
    }

    /**
     Getter for subscrp_id.

     - Returns:  Int

     */
    public func getSubscriptionId() -> Int {
        return self.subscriptionId
    }

    /**
     Getter for subterm_id.

     - Returns:  Int

     */
    public func getSubscriptionTermId() -> Int {
        return self.subscriptionTermId
    }

    /**
     Getter for rma_id.

     - Returns:  Int

     */
    public func getRmaId() -> Int {
        return self.rmaId
    }

    /**
     Getter for rma_code.

     - Returns:  String

     */
    public func getRmaCode() -> String {
        return self.rmaCode
    }

    /**
     Getter for rma_dt_issued.

     - Returns:  Date     */
    public func getRmaDataTimeIssued() -> Date {
        return self.rmaDataTimeIssued
    }

    /**
     Getter for rma_dt_recvd.

     - Returns:  Date     */
    public func getRmaDateTimeReceived() -> Date {
        return self.rmaDateTimeReceived
    }

    /**
     Getter for dt_instock.

     - Returns:  Date     */
    public func getDateInStock() -> Date {
        return self.dateInStock
    }

    /**
     Getter for code.

     - Returns:  Optional<String>

     */
    public func getCode() -> Optional<String> {
        return self.code
    }

    /**
     Getter for name.

     - Returns:  Optional<String>

     */
    public func getName() -> Optional<String> {
        return self.name
    }

    /**
     Getter for sku.

     - Returns:  Optional<String>

     */
    public func getSku() -> Optional<String> {
        return self.sku
    }

    /**
     Getter for retail.

     - Returns:  Decimal     */
    public func getRetail() -> Decimal {
        return self.retail
    }

    /**
     Getter for base_price.

     - Returns:  Decimal     */
    public func getBasePrice() -> Decimal {
        return self.basePrice
    }

    /**
     Getter for price.

     - Returns:  Optional<Decimal>     */
    public func getPrice() -> Optional<Decimal> {
        return self.price
    }

    /**
     Getter for tax.

     - Returns:  Optional<Decimal>     */
    public func getTax() -> Optional<Decimal> {
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
     Getter for weight.

     - Returns:  Optional<Decimal>     */
    public func getWeight() -> Optional<Decimal> {
        return self.weight
    }

    /**
     Getter for taxable.

     - Returns:  Optional<Bool>     */
    public func getTaxable() -> Optional<Bool> {
        return self.taxable
    }

    /**
     Getter for upsold.

     - Returns:  Optional<Bool>     */
    public func getUpsold() -> Optional<Bool> {
        return self.upsold
    }

    /**
     Getter for quantity.

     - Returns:  Optional<Int>

     */
    public func getQuantity() -> Optional<Int> {
        return self.quantity
    }

    /**
     Getter for shipment.

     - Returns:  OrderShipment
     */
    public func getShipment() -> OrderShipment {
        return self.shipment
    }

    /**
     Getter for discounts.

     - Returns:  [OrderItemDiscount]
     */
    public func getDiscounts() -> [OrderItemDiscount] {
        return self.discounts
    }

    /**
     Getter for options.

     - Returns:  [OrderItemOption]
     */
    public func getOptions() -> [OrderItemOption] {
        return self.options
    }

    /**
     Getter for subscription.

     - Returns:  OrderItemSubscription
     */
    public func getSubscription() -> OrderItemSubscription {
        return self.subscription
    }

    /**
     Getter for total.

     - Returns:  Decimal     */
    public func getTotal() -> Decimal {
        return self.total
    }

    /**
     Getter for tracktype.

     - Returns:  Optional<String>

     */
    public func getTrackingType() -> Optional<String> {
        return self.trackingType
    }

    /**
     Getter for tracknum.

     - Returns:  Optional<String>

     */
    public func getTrackingNumber() -> Optional<String> {
        return self.trackingNumber
    }

    /**
     Getter for shpmnt_id.

     - Returns:  Int

     */
    public func getShipmentId() -> Int {
        return self.shipmentId
    }

    /**
     Setter for code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setCode(_ value: String) -> Self {
        self.code = value
        return self
    }

    /**
     Setter for name.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setName(_ value: String) -> Self {
        self.name = value
        return self
    }

    /**
     Setter for sku.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setSku(_ value: String) -> Self {
        self.sku = value
        return self
    }

    /**
     Setter for price.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setPrice(_ value: Decimal) -> Self {
        self.price = value
        return self
    }

    /**
     Setter for tax.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setTax(_ value: Decimal) -> Self {
        self.tax = value
        return self
    }

    /**
     Setter for weight.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setWeight(_ value: Decimal) -> Self {
        self.weight = value
        return self
    }

    /**
     Setter for taxable.

     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setTaxable(_ value: Bool) -> Self {
        self.taxable = value
        return self
    }

    /**
     Setter for upsold.

     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setUpsold(_ value: Bool) -> Self {
        self.upsold = value
        return self
    }

    /**
     Setter for quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setQuantity(_ value: Int) -> Self {
        self.quantity = value
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
     Add a OrderItemOption.

     - Parameters:
        - option: OrderItemOption
     - Returns:  Self
     */
    @discardableResult
    public func addOption(_ option: OrderItemOption) -> Self {
        self.options.append(option)
        return self
    }
}
