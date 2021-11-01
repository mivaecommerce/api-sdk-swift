/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Order data model.
public class Order : Model {

    /// Enumeration OrderStatus
    public enum OrderStatus : Int {
        case Pending = 0
        case Processing = 100
        case Shipped = 200
        case PartiallyShipped = 201
        case Cancelled = 300
        case Backordered = 400
        case RmaIssued = 500
        case Returned = 600
    }

    /// Enumeration OrderPaymentStatus
    public enum OrderPaymentStatus : Int {
        case Pending = 0
        case Authorized = 100
        case Captured = 200
        case PartiallyCaptured = 201
    }

    /// Enumeration OrderStockStatus
    public enum OrderStockStatus : Int {
        case Available = 100
        case Unavailable = 200
        case Partial = 201
    }

    /// Model field id.
    var id : Int
    /// Model field pay_id.
    var paymentId : Int
    /// Model field batch_id.
    var batchId : Int
    /// Model field status.
    var status : Int
    /// Model field pay_status.
    var paymentStatus : Int
    /// Model field stk_status.
    var stockStatus : Int
    /// Model field dt_instock.
    var dateInStock : Date
    /// Model field orderdate.
    var orderDate : Int
    /// Model field cust_id.
    var customerId : Int
    /// Model field ship_res.
    var shipResidential : Bool
    /// Model field ship_fname.
    var shipFirstName : String
    /// Model field ship_lname.
    var shipLastName : String
    /// Model field ship_email.
    var shipEmail : String
    /// Model field ship_comp.
    var shipCompany : String
    /// Model field ship_phone.
    var shipPhone : String
    /// Model field ship_fax.
    var shipFax : String
    /// Model field ship_addr1.
    var shipAddress1 : String
    /// Model field ship_addr2.
    var shipAddress2 : String
    /// Model field ship_city.
    var shipCity : String
    /// Model field ship_state.
    var shipState : String
    /// Model field ship_zip.
    var shipZip : String
    /// Model field ship_cntry.
    var shipCountry : String
    /// Model field bill_fname.
    var billFirstName : String
    /// Model field bill_lname.
    var billLastName : String
    /// Model field bill_email.
    var billEmail : String
    /// Model field bill_comp.
    var billCompany : String
    /// Model field bill_phone.
    var billPhone : String
    /// Model field bill_fax.
    var billFax : String
    /// Model field bill_addr1.
    var billAddress1 : String
    /// Model field bill_addr2.
    var billAddress2 : String
    /// Model field bill_city.
    var billCity : String
    /// Model field bill_state.
    var billState : String
    /// Model field bill_zip.
    var billZip : String
    /// Model field bill_cntry.
    var billCountry : String
    /// Model field ship_id.
    var shipmentId : Int
    /// Model field ship_data.
    var shipData : String
    /// Model field ship_method.
    var shipMethod : String
    /// Model field cust_login.
    var customerLogin : String
    /// Model field cust_pw_email.
    var customerPasswordEmail : String
    /// Model field business_title.
    var businessTitle : String
    /// Model field payment_module.
    var paymentModule : String
    /// Model field source.
    var source : String
    /// Model field source_id.
    var sourceId : Int
    /// Model field total.
    var total : Decimal
    /// Model field formatted_total.
    var formattedTotal : String
    /// Model field total_ship.
    var totalShip : Decimal
    /// Model field formatted_total_ship.
    var formattedTotalShip : String
    /// Model field total_tax.
    var totalTax : Decimal
    /// Model field formatted_total_tax.
    var formattedTotalTax : String
    /// Model field total_auth.
    var totalAuthorized : Decimal
    /// Model field formatted_total_auth.
    var formattedTotalAuthorized : String
    /// Model field total_capt.
    var totalCaptured : Decimal
    /// Model field formatted_total_capt.
    var formattedTotalCaptured : String
    /// Model field total_rfnd.
    var totalRefunded : Decimal
    /// Model field formatted_total_rfnd.
    var formattedTotalRefunded : String
    /// Model field net_capt.
    var netCaptured : Decimal
    /// Model field formatted_net_capt.
    var formattedNetCaptured : String
    /// Model field pend_count.
    var pendingCount : Int
    /// Model field bord_count.
    var backorderCount : Int
    /// Model field note_count.
    var noteCount : Int
    /// Model field customer
    var customer : Customer

    /// Model field items.
    var items : [OrderItem]

    /// Model field charges.
    var charges : [OrderCharge]

    /// Model field coupons.
    var coupons : [OrderCoupon]

    /// Model field discounts.
    var discounts : [OrderDiscountTotal]

    /// Model field payments.
    var payments : [OrderPayment]

    /// Model field notes.
    var notes : [OrderNote]

    /// Model field parts.
    var parts : [OrderPart]

    /// Model field CustomField_Values
    var customFieldValues : CustomFieldValues

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case paymentId = "pay_id"
        case batchId = "batch_id"
        case status
        case paymentStatus = "pay_status"
        case stockStatus = "stk_status"
        case dateInStock = "dt_instock"
        case orderDate = "orderdate"
        case customerId = "cust_id"
        case shipResidential = "ship_res"
        case shipFirstName = "ship_fname"
        case shipLastName = "ship_lname"
        case shipEmail = "ship_email"
        case shipCompany = "ship_comp"
        case shipPhone = "ship_phone"
        case shipFax = "ship_fax"
        case shipAddress1 = "ship_addr1"
        case shipAddress2 = "ship_addr2"
        case shipCity = "ship_city"
        case shipState = "ship_state"
        case shipZip = "ship_zip"
        case shipCountry = "ship_cntry"
        case billFirstName = "bill_fname"
        case billLastName = "bill_lname"
        case billEmail = "bill_email"
        case billCompany = "bill_comp"
        case billPhone = "bill_phone"
        case billFax = "bill_fax"
        case billAddress1 = "bill_addr1"
        case billAddress2 = "bill_addr2"
        case billCity = "bill_city"
        case billState = "bill_state"
        case billZip = "bill_zip"
        case billCountry = "bill_cntry"
        case shipmentId = "ship_id"
        case shipData = "ship_data"
        case shipMethod = "ship_method"
        case customerLogin = "cust_login"
        case customerPasswordEmail = "cust_pw_email"
        case businessTitle = "business_title"
        case paymentModule = "payment_module"
        case source
        case sourceId = "source_id"
        case total
        case formattedTotal = "formatted_total"
        case totalShip = "total_ship"
        case formattedTotalShip = "formatted_total_ship"
        case totalTax = "total_tax"
        case formattedTotalTax = "formatted_total_tax"
        case totalAuthorized = "total_auth"
        case formattedTotalAuthorized = "formatted_total_auth"
        case totalCaptured = "total_capt"
        case formattedTotalCaptured = "formatted_total_capt"
        case totalRefunded = "total_rfnd"
        case formattedTotalRefunded = "formatted_total_rfnd"
        case netCaptured = "net_capt"
        case formattedNetCaptured = "formatted_net_capt"
        case pendingCount = "pend_count"
        case backorderCount = "bord_count"
        case noteCount = "note_count"
        case customer
        case items
        case charges
        case coupons
        case discounts
        case payments
        case notes
        case parts
        case customFieldValues = "CustomField_Values"
    }

    /**
     Order Constructor.
     */
    public override init() {
        self.id = 0
        self.paymentId = 0
        self.batchId = 0
        self.status = 0
        self.paymentStatus = 0
        self.stockStatus = 0
        self.dateInStock = Date(timeIntervalSince1970: 0)
        self.orderDate = 0
        self.customerId = 0
        self.shipResidential = false
        self.shipFirstName = ""
        self.shipLastName = ""
        self.shipEmail = ""
        self.shipCompany = ""
        self.shipPhone = ""
        self.shipFax = ""
        self.shipAddress1 = ""
        self.shipAddress2 = ""
        self.shipCity = ""
        self.shipState = ""
        self.shipZip = ""
        self.shipCountry = ""
        self.billFirstName = ""
        self.billLastName = ""
        self.billEmail = ""
        self.billCompany = ""
        self.billPhone = ""
        self.billFax = ""
        self.billAddress1 = ""
        self.billAddress2 = ""
        self.billCity = ""
        self.billState = ""
        self.billZip = ""
        self.billCountry = ""
        self.shipmentId = 0
        self.shipData = ""
        self.shipMethod = ""
        self.customerLogin = ""
        self.customerPasswordEmail = ""
        self.businessTitle = ""
        self.paymentModule = ""
        self.source = ""
        self.sourceId = 0
        self.total = Decimal(0.00)
        self.formattedTotal = ""
        self.totalShip = Decimal(0.00)
        self.formattedTotalShip = ""
        self.totalTax = Decimal(0.00)
        self.formattedTotalTax = ""
        self.totalAuthorized = Decimal(0.00)
        self.formattedTotalAuthorized = ""
        self.totalCaptured = Decimal(0.00)
        self.formattedTotalCaptured = ""
        self.totalRefunded = Decimal(0.00)
        self.formattedTotalRefunded = ""
        self.netCaptured = Decimal(0.00)
        self.formattedNetCaptured = ""
        self.pendingCount = 0
        self.backorderCount = 0
        self.noteCount = 0
        self.customer = Customer()
        self.items = []
        self.charges = []
        self.coupons = []
        self.discounts = []
        self.payments = []
        self.notes = []
        self.parts = []
        self.customFieldValues = CustomFieldValues()

        super.init()
    }

    /**
     Order Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.paymentId = try container.decodeIfPresent(Int.self, forKey: .paymentId) ?? 0
        self.batchId = try container.decodeIfPresent(Int.self, forKey: .batchId) ?? 0
        self.status = try container.decodeIfPresent(Int.self, forKey: .status) ?? 0
        self.paymentStatus = try container.decodeIfPresent(Int.self, forKey: .paymentStatus) ?? 0
        self.stockStatus = try container.decodeIfPresent(Int.self, forKey: .stockStatus) ?? 0
        self.dateInStock = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int.self, forKey: .dateInStock) ?? 0))
        self.orderDate = try container.decodeIfPresent(Int.self, forKey: .orderDate) ?? 0
        self.customerId = try container.decodeIfPresent(Int.self, forKey: .customerId) ?? 0
        self.shipResidential = try container.decodeIfPresent(Bool.self, forKey: .shipResidential) ?? false
        self.shipFirstName = try container.decodeIfPresent(String.self, forKey: .shipFirstName) ?? ""
        self.shipLastName = try container.decodeIfPresent(String.self, forKey: .shipLastName) ?? ""
        self.shipEmail = try container.decodeIfPresent(String.self, forKey: .shipEmail) ?? ""
        self.shipCompany = try container.decodeIfPresent(String.self, forKey: .shipCompany) ?? ""
        self.shipPhone = try container.decodeIfPresent(String.self, forKey: .shipPhone) ?? ""
        self.shipFax = try container.decodeIfPresent(String.self, forKey: .shipFax) ?? ""
        self.shipAddress1 = try container.decodeIfPresent(String.self, forKey: .shipAddress1) ?? ""
        self.shipAddress2 = try container.decodeIfPresent(String.self, forKey: .shipAddress2) ?? ""
        self.shipCity = try container.decodeIfPresent(String.self, forKey: .shipCity) ?? ""
        self.shipState = try container.decodeIfPresent(String.self, forKey: .shipState) ?? ""
        self.shipZip = try container.decodeIfPresent(String.self, forKey: .shipZip) ?? ""
        self.shipCountry = try container.decodeIfPresent(String.self, forKey: .shipCountry) ?? ""
        self.billFirstName = try container.decodeIfPresent(String.self, forKey: .billFirstName) ?? ""
        self.billLastName = try container.decodeIfPresent(String.self, forKey: .billLastName) ?? ""
        self.billEmail = try container.decodeIfPresent(String.self, forKey: .billEmail) ?? ""
        self.billCompany = try container.decodeIfPresent(String.self, forKey: .billCompany) ?? ""
        self.billPhone = try container.decodeIfPresent(String.self, forKey: .billPhone) ?? ""
        self.billFax = try container.decodeIfPresent(String.self, forKey: .billFax) ?? ""
        self.billAddress1 = try container.decodeIfPresent(String.self, forKey: .billAddress1) ?? ""
        self.billAddress2 = try container.decodeIfPresent(String.self, forKey: .billAddress2) ?? ""
        self.billCity = try container.decodeIfPresent(String.self, forKey: .billCity) ?? ""
        self.billState = try container.decodeIfPresent(String.self, forKey: .billState) ?? ""
        self.billZip = try container.decodeIfPresent(String.self, forKey: .billZip) ?? ""
        self.billCountry = try container.decodeIfPresent(String.self, forKey: .billCountry) ?? ""
        self.shipmentId = try container.decodeIfPresent(Int.self, forKey: .shipmentId) ?? 0
        self.shipData = try container.decodeIfPresent(String.self, forKey: .shipData) ?? ""
        self.shipMethod = try container.decodeIfPresent(String.self, forKey: .shipMethod) ?? ""
        self.customerLogin = try container.decodeIfPresent(String.self, forKey: .customerLogin) ?? ""
        self.customerPasswordEmail = try container.decodeIfPresent(String.self, forKey: .customerPasswordEmail) ?? ""
        self.businessTitle = try container.decodeIfPresent(String.self, forKey: .businessTitle) ?? ""
        self.paymentModule = try container.decodeIfPresent(String.self, forKey: .paymentModule) ?? ""
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
        self.sourceId = try container.decodeIfPresent(Int.self, forKey: .sourceId) ?? 0
        self.total = try container.decodeIfPresent(Decimal.self, forKey: .total) ?? Decimal(0.00)
        self.formattedTotal = try container.decodeIfPresent(String.self, forKey: .formattedTotal) ?? ""
        self.totalShip = try container.decodeIfPresent(Decimal.self, forKey: .totalShip) ?? Decimal(0.00)
        self.formattedTotalShip = try container.decodeIfPresent(String.self, forKey: .formattedTotalShip) ?? ""
        self.totalTax = try container.decodeIfPresent(Decimal.self, forKey: .totalTax) ?? Decimal(0.00)
        self.formattedTotalTax = try container.decodeIfPresent(String.self, forKey: .formattedTotalTax) ?? ""
        self.totalAuthorized = try container.decodeIfPresent(Decimal.self, forKey: .totalAuthorized) ?? Decimal(0.00)
        self.formattedTotalAuthorized = try container.decodeIfPresent(String.self, forKey: .formattedTotalAuthorized) ?? ""
        self.totalCaptured = try container.decodeIfPresent(Decimal.self, forKey: .totalCaptured) ?? Decimal(0.00)
        self.formattedTotalCaptured = try container.decodeIfPresent(String.self, forKey: .formattedTotalCaptured) ?? ""
        self.totalRefunded = try container.decodeIfPresent(Decimal.self, forKey: .totalRefunded) ?? Decimal(0.00)
        self.formattedTotalRefunded = try container.decodeIfPresent(String.self, forKey: .formattedTotalRefunded) ?? ""
        self.netCaptured = try container.decodeIfPresent(Decimal.self, forKey: .netCaptured) ?? Decimal(0.00)
        self.formattedNetCaptured = try container.decodeIfPresent(String.self, forKey: .formattedNetCaptured) ?? ""
        self.pendingCount = try container.decodeIfPresent(Int.self, forKey: .pendingCount) ?? 0
        self.backorderCount = try container.decodeIfPresent(Int.self, forKey: .backorderCount) ?? 0
        self.noteCount = try container.decodeIfPresent(Int.self, forKey: .noteCount) ?? 0
        self.customer = try container.decodeIfPresent(Customer.self, forKey: .customer) ?? Customer()
        self.items = try container.decodeIfPresent([OrderItem].self, forKey: .items) ?? []
        self.charges = try container.decodeIfPresent([OrderCharge].self, forKey: .charges) ?? []
        self.coupons = try container.decodeIfPresent([OrderCoupon].self, forKey: .coupons) ?? []
        self.discounts = try container.decodeIfPresent([OrderDiscountTotal].self, forKey: .discounts) ?? []
        self.payments = try container.decodeIfPresent([OrderPayment].self, forKey: .payments) ?? []
        self.notes = try container.decodeIfPresent([OrderNote].self, forKey: .notes) ?? []
        self.parts = try container.decodeIfPresent([OrderPart].self, forKey: .parts) ?? []
        self.customFieldValues = try container.decodeIfPresent(CustomFieldValues.self, forKey: .customFieldValues) ?? CustomFieldValues()

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
        try container.encodeIfPresent(self.paymentId, forKey: .paymentId)
        try container.encodeIfPresent(self.batchId, forKey: .batchId)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.paymentStatus, forKey: .paymentStatus)
        try container.encodeIfPresent(self.stockStatus, forKey: .stockStatus)
        try container.encodeIfPresent(Int(self.dateInStock.timeIntervalSince1970), forKey: .dateInStock)
        try container.encodeIfPresent(self.orderDate, forKey: .orderDate)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encodeIfPresent(self.shipResidential, forKey: .shipResidential)
        try container.encodeIfPresent(self.shipFirstName, forKey: .shipFirstName)
        try container.encodeIfPresent(self.shipLastName, forKey: .shipLastName)
        try container.encodeIfPresent(self.shipEmail, forKey: .shipEmail)
        try container.encodeIfPresent(self.shipCompany, forKey: .shipCompany)
        try container.encodeIfPresent(self.shipPhone, forKey: .shipPhone)
        try container.encodeIfPresent(self.shipFax, forKey: .shipFax)
        try container.encodeIfPresent(self.shipAddress1, forKey: .shipAddress1)
        try container.encodeIfPresent(self.shipAddress2, forKey: .shipAddress2)
        try container.encodeIfPresent(self.shipCity, forKey: .shipCity)
        try container.encodeIfPresent(self.shipState, forKey: .shipState)
        try container.encodeIfPresent(self.shipZip, forKey: .shipZip)
        try container.encodeIfPresent(self.shipCountry, forKey: .shipCountry)
        try container.encodeIfPresent(self.billFirstName, forKey: .billFirstName)
        try container.encodeIfPresent(self.billLastName, forKey: .billLastName)
        try container.encodeIfPresent(self.billEmail, forKey: .billEmail)
        try container.encodeIfPresent(self.billCompany, forKey: .billCompany)
        try container.encodeIfPresent(self.billPhone, forKey: .billPhone)
        try container.encodeIfPresent(self.billFax, forKey: .billFax)
        try container.encodeIfPresent(self.billAddress1, forKey: .billAddress1)
        try container.encodeIfPresent(self.billAddress2, forKey: .billAddress2)
        try container.encodeIfPresent(self.billCity, forKey: .billCity)
        try container.encodeIfPresent(self.billState, forKey: .billState)
        try container.encodeIfPresent(self.billZip, forKey: .billZip)
        try container.encodeIfPresent(self.billCountry, forKey: .billCountry)
        try container.encodeIfPresent(self.shipmentId, forKey: .shipmentId)
        try container.encodeIfPresent(self.shipData, forKey: .shipData)
        try container.encodeIfPresent(self.shipMethod, forKey: .shipMethod)
        try container.encodeIfPresent(self.customerLogin, forKey: .customerLogin)
        try container.encodeIfPresent(self.customerPasswordEmail, forKey: .customerPasswordEmail)
        try container.encodeIfPresent(self.businessTitle, forKey: .businessTitle)
        try container.encodeIfPresent(self.paymentModule, forKey: .paymentModule)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.sourceId, forKey: .sourceId)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.total, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .total)
        try container.encodeIfPresent(self.formattedTotal, forKey: .formattedTotal)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.totalShip, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .totalShip)
        try container.encodeIfPresent(self.formattedTotalShip, forKey: .formattedTotalShip)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.totalTax, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .totalTax)
        try container.encodeIfPresent(self.formattedTotalTax, forKey: .formattedTotalTax)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.totalAuthorized, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .totalAuthorized)
        try container.encodeIfPresent(self.formattedTotalAuthorized, forKey: .formattedTotalAuthorized)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.totalCaptured, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .totalCaptured)
        try container.encodeIfPresent(self.formattedTotalCaptured, forKey: .formattedTotalCaptured)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.totalRefunded, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .totalRefunded)
        try container.encodeIfPresent(self.formattedTotalRefunded, forKey: .formattedTotalRefunded)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.netCaptured, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .netCaptured)
        try container.encodeIfPresent(self.formattedNetCaptured, forKey: .formattedNetCaptured)
        try container.encodeIfPresent(self.pendingCount, forKey: .pendingCount)
        try container.encodeIfPresent(self.backorderCount, forKey: .backorderCount)
        try container.encodeIfPresent(self.noteCount, forKey: .noteCount)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.items, forKey: .items)
        try container.encodeIfPresent(self.charges, forKey: .charges)
        try container.encodeIfPresent(self.coupons, forKey: .coupons)
        try container.encodeIfPresent(self.discounts, forKey: .discounts)
        try container.encodeIfPresent(self.payments, forKey: .payments)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encodeIfPresent(self.parts, forKey: .parts)
        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)

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
     Getter for pay_id.

     - Returns:  Int

     */
    public func getPaymentId() -> Int {
        return self.paymentId
    }

    /**
     Getter for batch_id.

     - Returns:  Int

     */
    public func getBatchId() -> Int {
        return self.batchId
    }

    /**
     Getter for status.

     - Returns:  Int

     */
    public func getStatus() -> Int {
        return self.status
    }

    /**
     Getter for pay_status.

     - Returns:  Int

     */
    public func getPaymentStatus() -> Int {
        return self.paymentStatus
    }

    /**
     Getter for stk_status.

     - Returns:  Int

     */
    public func getStockStatus() -> Int {
        return self.stockStatus
    }

    /**
     Getter for dt_instock.

     - Returns:  Date     */
    public func getDateInStock() -> Date {
        return self.dateInStock
    }

    /**
     Getter for orderdate.

     - Returns:  Int

     */
    public func getOrderDate() -> Int {
        return self.orderDate
    }

    /**
     Getter for cust_id.

     - Returns:  Int

     */
    public func getCustomerId() -> Int {
        return self.customerId
    }

    /**
     Getter for ship_res.

     - Returns:  Bool     */
    public func getShipResidential() -> Bool {
        return self.shipResidential
    }

    /**
     Getter for ship_fname.

     - Returns:  String

     */
    public func getShipFirstName() -> String {
        return self.shipFirstName
    }

    /**
     Getter for ship_lname.

     - Returns:  String

     */
    public func getShipLastName() -> String {
        return self.shipLastName
    }

    /**
     Getter for ship_email.

     - Returns:  String

     */
    public func getShipEmail() -> String {
        return self.shipEmail
    }

    /**
     Getter for ship_comp.

     - Returns:  String

     */
    public func getShipCompany() -> String {
        return self.shipCompany
    }

    /**
     Getter for ship_phone.

     - Returns:  String

     */
    public func getShipPhone() -> String {
        return self.shipPhone
    }

    /**
     Getter for ship_fax.

     - Returns:  String

     */
    public func getShipFax() -> String {
        return self.shipFax
    }

    /**
     Getter for ship_addr1.

     - Returns:  String

     */
    public func getShipAddress1() -> String {
        return self.shipAddress1
    }

    /**
     Getter for ship_addr2.

     - Returns:  String

     */
    public func getShipAddress2() -> String {
        return self.shipAddress2
    }

    /**
     Getter for ship_city.

     - Returns:  String

     */
    public func getShipCity() -> String {
        return self.shipCity
    }

    /**
     Getter for ship_state.

     - Returns:  String

     */
    public func getShipState() -> String {
        return self.shipState
    }

    /**
     Getter for ship_zip.

     - Returns:  String

     */
    public func getShipZip() -> String {
        return self.shipZip
    }

    /**
     Getter for ship_cntry.

     - Returns:  String

     */
    public func getShipCountry() -> String {
        return self.shipCountry
    }

    /**
     Getter for bill_fname.

     - Returns:  String

     */
    public func getBillFirstName() -> String {
        return self.billFirstName
    }

    /**
     Getter for bill_lname.

     - Returns:  String

     */
    public func getBillLastName() -> String {
        return self.billLastName
    }

    /**
     Getter for bill_email.

     - Returns:  String

     */
    public func getBillEmail() -> String {
        return self.billEmail
    }

    /**
     Getter for bill_comp.

     - Returns:  String

     */
    public func getBillCompany() -> String {
        return self.billCompany
    }

    /**
     Getter for bill_phone.

     - Returns:  String

     */
    public func getBillPhone() -> String {
        return self.billPhone
    }

    /**
     Getter for bill_fax.

     - Returns:  String

     */
    public func getBillFax() -> String {
        return self.billFax
    }

    /**
     Getter for bill_addr1.

     - Returns:  String

     */
    public func getBillAddress1() -> String {
        return self.billAddress1
    }

    /**
     Getter for bill_addr2.

     - Returns:  String

     */
    public func getBillAddress2() -> String {
        return self.billAddress2
    }

    /**
     Getter for bill_city.

     - Returns:  String

     */
    public func getBillCity() -> String {
        return self.billCity
    }

    /**
     Getter for bill_state.

     - Returns:  String

     */
    public func getBillState() -> String {
        return self.billState
    }

    /**
     Getter for bill_zip.

     - Returns:  String

     */
    public func getBillZip() -> String {
        return self.billZip
    }

    /**
     Getter for bill_cntry.

     - Returns:  String

     */
    public func getBillCountry() -> String {
        return self.billCountry
    }

    /**
     Getter for ship_id.

     - Returns:  Int

     */
    public func getShipmentId() -> Int {
        return self.shipmentId
    }

    /**
     Getter for ship_data.

     - Returns:  String

     */
    public func getShipData() -> String {
        return self.shipData
    }

    /**
     Getter for ship_method.

     - Returns:  String

     */
    public func getShipMethod() -> String {
        return self.shipMethod
    }

    /**
     Getter for cust_login.

     - Returns:  String

     */
    public func getCustomerLogin() -> String {
        return self.customerLogin
    }

    /**
     Getter for cust_pw_email.

     - Returns:  String

     */
    public func getCustomerPasswordEmail() -> String {
        return self.customerPasswordEmail
    }

    /**
     Getter for business_title.

     - Returns:  String

     */
    public func getBusinessTitle() -> String {
        return self.businessTitle
    }

    /**
     Getter for payment_module.

     - Returns:  String

     */
    public func getPaymentModule() -> String {
        return self.paymentModule
    }

    /**
     Getter for source.

     - Returns:  String

     */
    public func getSource() -> String {
        return self.source
    }

    /**
     Getter for source_id.

     - Returns:  Int

     */
    public func getSourceId() -> Int {
        return self.sourceId
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
     Getter for total_ship.

     - Returns:  Decimal     */
    public func getTotalShip() -> Decimal {
        return self.totalShip
    }

    /**
     Getter for formatted_total_ship.

     - Returns:  String

     */
    public func getFormattedTotalShip() -> String {
        return self.formattedTotalShip
    }

    /**
     Getter for total_tax.

     - Returns:  Decimal     */
    public func getTotalTax() -> Decimal {
        return self.totalTax
    }

    /**
     Getter for formatted_total_tax.

     - Returns:  String

     */
    public func getFormattedTotalTax() -> String {
        return self.formattedTotalTax
    }

    /**
     Getter for total_auth.

     - Returns:  Decimal     */
    public func getTotalAuthorized() -> Decimal {
        return self.totalAuthorized
    }

    /**
     Getter for formatted_total_auth.

     - Returns:  String

     */
    public func getFormattedTotalAuthorized() -> String {
        return self.formattedTotalAuthorized
    }

    /**
     Getter for total_capt.

     - Returns:  Decimal     */
    public func getTotalCaptured() -> Decimal {
        return self.totalCaptured
    }

    /**
     Getter for formatted_total_capt.

     - Returns:  String

     */
    public func getFormattedTotalCaptured() -> String {
        return self.formattedTotalCaptured
    }

    /**
     Getter for total_rfnd.

     - Returns:  Decimal     */
    public func getTotalRefunded() -> Decimal {
        return self.totalRefunded
    }

    /**
     Getter for formatted_total_rfnd.

     - Returns:  String

     */
    public func getFormattedTotalRefunded() -> String {
        return self.formattedTotalRefunded
    }

    /**
     Getter for net_capt.

     - Returns:  Decimal     */
    public func getNetCaptured() -> Decimal {
        return self.netCaptured
    }

    /**
     Getter for formatted_net_capt.

     - Returns:  String

     */
    public func getFormattedNetCaptured() -> String {
        return self.formattedNetCaptured
    }

    /**
     Getter for pend_count.

     - Returns:  Int

     */
    public func getPendingCount() -> Int {
        return self.pendingCount
    }

    /**
     Getter for bord_count.

     - Returns:  Int

     */
    public func getBackorderCount() -> Int {
        return self.backorderCount
    }

    /**
     Getter for note_count.

     - Returns:  Int

     */
    public func getNoteCount() -> Int {
        return self.noteCount
    }

    /**
     Getter for customer.

     - Returns:  Customer
     */
    public func getCustomer() -> Customer {
        return self.customer
    }

    /**
     Getter for items.

     - Returns:  [OrderItem]
     */
    public func getItems() -> [OrderItem] {
        return self.items
    }

    /**
     Getter for charges.

     - Returns:  [OrderCharge]
     */
    public func getCharges() -> [OrderCharge] {
        return self.charges
    }

    /**
     Getter for coupons.

     - Returns:  [OrderCoupon]
     */
    public func getCoupons() -> [OrderCoupon] {
        return self.coupons
    }

    /**
     Getter for discounts.

     - Returns:  [OrderDiscountTotal]
     */
    public func getDiscounts() -> [OrderDiscountTotal] {
        return self.discounts
    }

    /**
     Getter for payments.

     - Returns:  [OrderPayment]
     */
    public func getPayments() -> [OrderPayment] {
        return self.payments
    }

    /**
     Getter for notes.

     - Returns:  [OrderNote]
     */
    public func getNotes() -> [OrderNote] {
        return self.notes
    }

    /**
     Getter for parts.

     - Returns:  [OrderPart]
     */
    public func getParts() -> [OrderPart] {
        return self.parts
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
    }
}
