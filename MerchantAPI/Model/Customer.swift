/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Customer data model.
public class Customer : Model {

    /// Model field id.
    var id : Int
    /// Model field account_id.
    var accountId : Int
    /// Model field login.
    var login : String
    /// Model field pw_email.
    var passwordEmail : String
    /// Model field ship_id.
    var shipId : Int
    /// Model field ship_res.
    var shippingResidential : Bool
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
    /// Model field bill_id.
    var billId : Int
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
    /// Model field tax_exempt.
    var taxExempt : Bool
    /// Model field order_cnt.
    var orderCount : Int
    /// Model field order_avg.
    var orderAverage : Decimal
    /// Model field formatted_order_avg.
    var formattedOrderAverage : String
    /// Model field order_tot.
    var orderTotal : Decimal
    /// Model field formatted_order_tot.
    var formattedOrderTotal : String
    /// Model field note_count.
    var noteCount : Int
    /// Model field dt_created.
    var createdOn : Date
    /// Model field dt_login.
    var lastLogin : Date
    /// Model field dt_pwchg.
    var passwordChangeDateTime : Date
    /// Model field credit.
    var credit : Decimal
    /// Model field formatted_credit.
    var formattedCredit : String
    /// Model field business_title.
    var businessTitle : String
    /// Model field CustomField_Values
    var customFieldValues : CustomFieldValues

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case login
        case passwordEmail = "pw_email"
        case shipId = "ship_id"
        case shippingResidential = "ship_res"
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
        case billId = "bill_id"
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
        case taxExempt = "tax_exempt"
        case orderCount = "order_cnt"
        case orderAverage = "order_avg"
        case formattedOrderAverage = "formatted_order_avg"
        case orderTotal = "order_tot"
        case formattedOrderTotal = "formatted_order_tot"
        case noteCount = "note_count"
        case createdOn = "dt_created"
        case lastLogin = "dt_login"
        case passwordChangeDateTime = "dt_pwchg"
        case credit
        case formattedCredit = "formatted_credit"
        case businessTitle = "business_title"
        case customFieldValues = "CustomField_Values"
    }

    /**
     Customer Constructor.
     */
    public override init() {
        self.id = 0
        self.accountId = 0
        self.login = ""
        self.passwordEmail = ""
        self.shipId = 0
        self.shippingResidential = false
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
        self.billId = 0
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
        self.taxExempt = false
        self.orderCount = 0
        self.orderAverage = Decimal(0.00)
        self.formattedOrderAverage = ""
        self.orderTotal = Decimal(0.00)
        self.formattedOrderTotal = ""
        self.noteCount = 0
        self.createdOn = Date(timeIntervalSince1970: 0)
        self.lastLogin = Date(timeIntervalSince1970: 0)
        self.passwordChangeDateTime = Date(timeIntervalSince1970: 0)
        self.credit = Decimal(0.00)
        self.formattedCredit = ""
        self.businessTitle = ""
        self.customFieldValues = CustomFieldValues()

        super.init()
    }

    /**
     Customer Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.accountId = try container.decodeIfPresent(Int.self, forKey: .accountId) ?? 0
        self.login = try container.decodeIfPresent(String.self, forKey: .login) ?? ""
        self.passwordEmail = try container.decodeIfPresent(String.self, forKey: .passwordEmail) ?? ""
        self.shipId = try container.decodeIfPresent(Int.self, forKey: .shipId) ?? 0
        self.shippingResidential = try container.decodeIfPresent(Bool.self, forKey: .shippingResidential) ?? false
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
        self.billId = try container.decodeIfPresent(Int.self, forKey: .billId) ?? 0
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
        self.taxExempt = try container.decodeIfPresent(Bool.self, forKey: .taxExempt) ?? false
        self.orderCount = try container.decodeIfPresent(Int.self, forKey: .orderCount) ?? 0
        self.orderAverage = try container.decodeIfPresent(Decimal.self, forKey: .orderAverage) ?? Decimal(0.00)
        self.formattedOrderAverage = try container.decodeIfPresent(String.self, forKey: .formattedOrderAverage) ?? ""
        self.orderTotal = try container.decodeIfPresent(Decimal.self, forKey: .orderTotal) ?? Decimal(0.00)
        self.formattedOrderTotal = try container.decodeIfPresent(String.self, forKey: .formattedOrderTotal) ?? ""
        self.noteCount = try container.decodeIfPresent(Int.self, forKey: .noteCount) ?? 0
        self.createdOn = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int.self, forKey: .createdOn) ?? 0))
        self.lastLogin = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int.self, forKey: .lastLogin) ?? 0))
        self.passwordChangeDateTime = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int.self, forKey: .passwordChangeDateTime) ?? 0))
        self.credit = try container.decodeIfPresent(Decimal.self, forKey: .credit) ?? Decimal(0.00)
        self.formattedCredit = try container.decodeIfPresent(String.self, forKey: .formattedCredit) ?? ""
        self.businessTitle = try container.decodeIfPresent(String.self, forKey: .businessTitle) ?? ""
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
        try container.encodeIfPresent(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.login, forKey: .login)
        try container.encodeIfPresent(self.passwordEmail, forKey: .passwordEmail)
        try container.encodeIfPresent(self.shipId, forKey: .shipId)
        try container.encodeIfPresent(self.shippingResidential, forKey: .shippingResidential)
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
        try container.encodeIfPresent(self.billId, forKey: .billId)
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
        try container.encodeIfPresent(self.taxExempt, forKey: .taxExempt)
        try container.encodeIfPresent(self.orderCount, forKey: .orderCount)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.orderAverage, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .orderAverage)
        try container.encodeIfPresent(self.formattedOrderAverage, forKey: .formattedOrderAverage)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.orderTotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .orderTotal)
        try container.encodeIfPresent(self.formattedOrderTotal, forKey: .formattedOrderTotal)
        try container.encodeIfPresent(self.noteCount, forKey: .noteCount)
        try container.encodeIfPresent(Int(self.createdOn.timeIntervalSince1970), forKey: .createdOn)
        try container.encodeIfPresent(Int(self.lastLogin.timeIntervalSince1970), forKey: .lastLogin)
        try container.encodeIfPresent(Int(self.passwordChangeDateTime.timeIntervalSince1970), forKey: .passwordChangeDateTime)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.credit, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .credit)
        try container.encodeIfPresent(self.formattedCredit, forKey: .formattedCredit)
        try container.encodeIfPresent(self.businessTitle, forKey: .businessTitle)
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
     Getter for account_id.

     - Returns:  Int

     */
    public func getAccountId() -> Int {
        return self.accountId
    }

    /**
     Getter for login.

     - Returns:  String

     */
    public func getLogin() -> String {
        return self.login
    }

    /**
     Getter for pw_email.

     - Returns:  String

     */
    public func getPasswordEmail() -> String {
        return self.passwordEmail
    }

    /**
     Getter for ship_id.

     - Returns:  Int

     */
    public func getShipId() -> Int {
        return self.shipId
    }

    /**
     Getter for ship_res.

     - Returns:  Bool     */
    public func getShippingResidential() -> Bool {
        return self.shippingResidential
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
     Getter for bill_id.

     - Returns:  Int

     */
    public func getBillId() -> Int {
        return self.billId
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
     Getter for tax_exempt.

     - Returns:  Bool     */
    public func getTaxExempt() -> Bool {
        return self.taxExempt
    }

    /**
     Getter for order_cnt.

     - Returns:  Int

     */
    public func getOrderCount() -> Int {
        return self.orderCount
    }

    /**
     Getter for order_avg.

     - Returns:  Decimal     */
    public func getOrderAverage() -> Decimal {
        return self.orderAverage
    }

    /**
     Getter for formatted_order_avg.

     - Returns:  String

     */
    public func getFormattedOrderAverage() -> String {
        return self.formattedOrderAverage
    }

    /**
     Getter for order_tot.

     - Returns:  Decimal     */
    public func getOrderTotal() -> Decimal {
        return self.orderTotal
    }

    /**
     Getter for formatted_order_tot.

     - Returns:  String

     */
    public func getFormattedOrderTotal() -> String {
        return self.formattedOrderTotal
    }

    /**
     Getter for note_count.

     - Returns:  Int

     */
    public func getNoteCount() -> Int {
        return self.noteCount
    }

    /**
     Getter for dt_created.

     - Returns:  Date     */
    public func getCreatedOn() -> Date {
        return self.createdOn
    }

    /**
     Getter for dt_login.

     - Returns:  Date     */
    public func getLastLogin() -> Date {
        return self.lastLogin
    }

    /**
     Getter for dt_pwchg.

     - Returns:  Date     */
    public func getPasswordChangeDateTime() -> Date {
        return self.passwordChangeDateTime
    }

    /**
     Getter for credit.

     - Returns:  Decimal     */
    public func getCredit() -> Decimal {
        return self.credit
    }

    /**
     Getter for formatted_credit.

     - Returns:  String

     */
    public func getFormattedCredit() -> String {
        return self.formattedCredit
    }

    /**
     Getter for business_title.

     - Returns:  String

     */
    public func getBusinessTitle() -> String {
        return self.businessTitle
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
    }
}
