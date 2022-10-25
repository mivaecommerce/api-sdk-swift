/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CustomerSubscription data model.
public class CustomerSubscription : Subscription {

    /// Model field frequency.
    var frequency : String

    /// Model field term.
    var term : Int

    /// Model field descrip.
    var description : String

    /// Model field n.
    var n : Int

    /// Model field fixed_dow.
    var fixedDayOfWeek : Int

    /// Model field fixed_dom.
    var fixedDayOfMonth : Int

    /// Model field sub_count.
    var subscriptionCount : Int

    /// Model field method.
    var method : String

    /// Model field product_code.
    var productCode : String

    /// Model field product_name.
    var productName : String

    /// Model field product_sku.
    var productSku : String

    /// Model field product_price.
    var productPrice : Decimal

    /// Model field product_formatted_price.
    var productFormattedPrice : String

    /// Model field product_cost.
    var productCost : Decimal

    /// Model field product_formatted_cost.
    var productFormattedCost : String

    /// Model field product_weight.
    var productWeight : Decimal

    /// Model field product_taxable.
    var productTaxable : Bool

    /// Model field product_thumbnail.
    var productThumbnail : String

    /// Model field product_image.
    var productImage : String

    /// Model field product_active.
    var productActive : Bool

    /// Model field product_dt_created.
    var productDateTimeCreated : Date

    /// Model field product_dt_updated.
    var productDateTimeUpdated : Date

    /// Model field product_page_title.
    var productPageTitle : String

    /// Model field product_page_id.
    var productPageId : Int

    /// Model field product_page_code.
    var productPageCode : String

    /// Model field product_cancat_id.
    var productCanonicalCategoryId : Int

    /// Model field product_cancat_code.
    var productCanonicalCategoryCode : String

    /// Model field product_inventory_active.
    var productInventoryActive : Bool

    /// Model field product_inventory.
    var productInventory : Int

    /// Model field imagetypes.
    var imageTypes : Dictionary<String, Int32>

    /// Model field paymentcard_lastfour.
    var paymentCardLastFour : String

    /// Model field paymentcard_type.
    var paymentCardType : String

    /// Model field address_descrip.
    var addressDescription : String

    /// Model field address_fname.
    var addressFirstName : String

    /// Model field address_lname.
    var addressLastName : String

    /// Model field address_email.
    var addressEmail : String

    /// Model field address_comp.
    var addressCompany : String

    /// Model field address_phone.
    var addressPhone : String

    /// Model field address_fax.
    var addressFax : String

    /// Model field address_addr.
    var addressAddress : String

    /// Model field address_addr1.
    var addressAddress1 : String

    /// Model field address_addr2.
    var addressAddress2 : String

    /// Model field address_city.
    var addressCity : String

    /// Model field address_state.
    var addressState : String

    /// Model field address_zip.
    var addressZip : String

    /// Model field address_cntry.
    var addressCountry : String

    /// Model field address_resdntl.
    var addressResidential : Bool

    /// Model field customer_login.
    var customerLogin : String

    /// Model field customer_pw_email.
    var customerPasswordEmail : String

    /// Model field customer_business_title.
    var customerBusinessTitle : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case frequency
        case term
        case description = "descrip"
        case n
        case fixedDayOfWeek = "fixed_dow"
        case fixedDayOfMonth = "fixed_dom"
        case subscriptionCount = "sub_count"
        case method
        case productCode = "product_code"
        case productName = "product_name"
        case productSku = "product_sku"
        case productPrice = "product_price"
        case productFormattedPrice = "product_formatted_price"
        case productCost = "product_cost"
        case productFormattedCost = "product_formatted_cost"
        case productWeight = "product_weight"
        case productTaxable = "product_taxable"
        case productThumbnail = "product_thumbnail"
        case productImage = "product_image"
        case productActive = "product_active"
        case productDateTimeCreated = "product_dt_created"
        case productDateTimeUpdated = "product_dt_updated"
        case productPageTitle = "product_page_title"
        case productPageId = "product_page_id"
        case productPageCode = "product_page_code"
        case productCanonicalCategoryId = "product_cancat_id"
        case productCanonicalCategoryCode = "product_cancat_code"
        case productInventoryActive = "product_inventory_active"
        case productInventory = "product_inventory"
        case imageTypes = "imagetypes"
        case paymentCardLastFour = "paymentcard_lastfour"
        case paymentCardType = "paymentcard_type"
        case addressDescription = "address_descrip"
        case addressFirstName = "address_fname"
        case addressLastName = "address_lname"
        case addressEmail = "address_email"
        case addressCompany = "address_comp"
        case addressPhone = "address_phone"
        case addressFax = "address_fax"
        case addressAddress = "address_addr"
        case addressAddress1 = "address_addr1"
        case addressAddress2 = "address_addr2"
        case addressCity = "address_city"
        case addressState = "address_state"
        case addressZip = "address_zip"
        case addressCountry = "address_cntry"
        case addressResidential = "address_resdntl"
        case customerLogin = "customer_login"
        case customerPasswordEmail = "customer_pw_email"
        case customerBusinessTitle = "customer_business_title"
    }

    /**
     CustomerSubscription Constructor.
     */
    public override init() {
        self.frequency = ""
        self.term = 0
        self.description = ""
        self.n = 0
        self.fixedDayOfWeek = 0
        self.fixedDayOfMonth = 0
        self.subscriptionCount = 0
        self.method = ""
        self.productCode = ""
        self.productName = ""
        self.productSku = ""
        self.productPrice = Decimal(0.00)
        self.productFormattedPrice = ""
        self.productCost = Decimal(0.00)
        self.productFormattedCost = ""
        self.productWeight = Decimal(0.00)
        self.productTaxable = false
        self.productThumbnail = ""
        self.productImage = ""
        self.productActive = false
        self.productDateTimeCreated = Date(timeIntervalSince1970: 0)
        self.productDateTimeUpdated = Date(timeIntervalSince1970: 0)
        self.productPageTitle = ""
        self.productPageId = 0
        self.productPageCode = ""
        self.productCanonicalCategoryId = 0
        self.productCanonicalCategoryCode = ""
        self.productInventoryActive = false
        self.productInventory = 0
        self.imageTypes = [:]
        self.paymentCardLastFour = ""
        self.paymentCardType = ""
        self.addressDescription = ""
        self.addressFirstName = ""
        self.addressLastName = ""
        self.addressEmail = ""
        self.addressCompany = ""
        self.addressPhone = ""
        self.addressFax = ""
        self.addressAddress = ""
        self.addressAddress1 = ""
        self.addressAddress2 = ""
        self.addressCity = ""
        self.addressState = ""
        self.addressZip = ""
        self.addressCountry = ""
        self.addressResidential = false
        self.customerLogin = ""
        self.customerPasswordEmail = ""
        self.customerBusinessTitle = ""

        super.init()
    }

    /**
     CustomerSubscription Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.frequency = try container.decodeIfPresent(String.self, forKey: .frequency) ?? ""
        self.term = try container.decodeIfPresent(Int.self, forKey: .term) ?? 0
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.n = try container.decodeIfPresent(Int.self, forKey: .n) ?? 0
        self.fixedDayOfWeek = try container.decodeIfPresent(Int.self, forKey: .fixedDayOfWeek) ?? 0
        self.fixedDayOfMonth = try container.decodeIfPresent(Int.self, forKey: .fixedDayOfMonth) ?? 0
        self.subscriptionCount = try container.decodeIfPresent(Int.self, forKey: .subscriptionCount) ?? 0
        self.method = try container.decodeIfPresent(String.self, forKey: .method) ?? ""
        self.productCode = try container.decodeIfPresent(String.self, forKey: .productCode) ?? ""
        self.productName = try container.decodeIfPresent(String.self, forKey: .productName) ?? ""
        self.productSku = try container.decodeIfPresent(String.self, forKey: .productSku) ?? ""
        self.productPrice = try container.decodeIfPresent(Decimal.self, forKey: .productPrice) ?? Decimal(0.00)
        self.productFormattedPrice = try container.decodeIfPresent(String.self, forKey: .productFormattedPrice) ?? ""
        self.productCost = try container.decodeIfPresent(Decimal.self, forKey: .productCost) ?? Decimal(0.00)
        self.productFormattedCost = try container.decodeIfPresent(String.self, forKey: .productFormattedCost) ?? ""
        self.productWeight = try container.decodeIfPresent(Decimal.self, forKey: .productWeight) ?? Decimal(0.00)
        self.productTaxable = try container.decodeIfPresent(Bool.self, forKey: .productTaxable) ?? false
        self.productThumbnail = try container.decodeIfPresent(String.self, forKey: .productThumbnail) ?? ""
        self.productImage = try container.decodeIfPresent(String.self, forKey: .productImage) ?? ""
        self.productActive = try container.decodeIfPresent(Bool.self, forKey: .productActive) ?? false
        self.productDateTimeCreated = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int64.self, forKey: .productDateTimeCreated) ?? 0))
        self.productDateTimeUpdated = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int64.self, forKey: .productDateTimeUpdated) ?? 0))
        self.productPageTitle = try container.decodeIfPresent(String.self, forKey: .productPageTitle) ?? ""
        self.productPageId = try container.decodeIfPresent(Int.self, forKey: .productPageId) ?? 0
        self.productPageCode = try container.decodeIfPresent(String.self, forKey: .productPageCode) ?? ""
        self.productCanonicalCategoryId = try container.decodeIfPresent(Int.self, forKey: .productCanonicalCategoryId) ?? 0
        self.productCanonicalCategoryCode = try container.decodeIfPresent(String.self, forKey: .productCanonicalCategoryCode) ?? ""
        self.productInventoryActive = try container.decodeIfPresent(Bool.self, forKey: .productInventoryActive) ?? false
        self.productInventory = try container.decodeIfPresent(Int.self, forKey: .productInventory) ?? 0
        self.paymentCardLastFour = try container.decodeIfPresent(String.self, forKey: .paymentCardLastFour) ?? ""
        self.paymentCardType = try container.decodeIfPresent(String.self, forKey: .paymentCardType) ?? ""
        self.addressDescription = try container.decodeIfPresent(String.self, forKey: .addressDescription) ?? ""
        self.addressFirstName = try container.decodeIfPresent(String.self, forKey: .addressFirstName) ?? ""
        self.addressLastName = try container.decodeIfPresent(String.self, forKey: .addressLastName) ?? ""
        self.addressEmail = try container.decodeIfPresent(String.self, forKey: .addressEmail) ?? ""
        self.addressCompany = try container.decodeIfPresent(String.self, forKey: .addressCompany) ?? ""
        self.addressPhone = try container.decodeIfPresent(String.self, forKey: .addressPhone) ?? ""
        self.addressFax = try container.decodeIfPresent(String.self, forKey: .addressFax) ?? ""
        self.addressAddress = try container.decodeIfPresent(String.self, forKey: .addressAddress) ?? ""
        self.addressAddress1 = try container.decodeIfPresent(String.self, forKey: .addressAddress1) ?? ""
        self.addressAddress2 = try container.decodeIfPresent(String.self, forKey: .addressAddress2) ?? ""
        self.addressCity = try container.decodeIfPresent(String.self, forKey: .addressCity) ?? ""
        self.addressState = try container.decodeIfPresent(String.self, forKey: .addressState) ?? ""
        self.addressZip = try container.decodeIfPresent(String.self, forKey: .addressZip) ?? ""
        self.addressCountry = try container.decodeIfPresent(String.self, forKey: .addressCountry) ?? ""
        self.addressResidential = try container.decodeIfPresent(Bool.self, forKey: .addressResidential) ?? false
        self.customerLogin = try container.decodeIfPresent(String.self, forKey: .customerLogin) ?? ""
        self.customerPasswordEmail = try container.decodeIfPresent(String.self, forKey: .customerPasswordEmail) ?? ""
        self.customerBusinessTitle = try container.decodeIfPresent(String.self, forKey: .customerBusinessTitle) ?? ""

        self.imageTypes = [:]
        let imageTypesContainer = try decoder.container(keyedBy: RuntimeCodingKey.self)

        for key in imageTypesContainer.allKeys {
            if key.stringValue.starts(with: "imagetype:") {
                let imageType = String(key.stringValue[key.stringValue.index(after: key.stringValue.firstIndex(of: ":")!)...])
                let imageId = try imageTypesContainer.decode(Int32.self, forKey: key)
                
                self.imageTypes[imageType] = imageId;
            }
        }

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

        try container.encodeIfPresent(self.frequency, forKey: .frequency)
        try container.encodeIfPresent(self.term, forKey: .term)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.n, forKey: .n)
        try container.encodeIfPresent(self.fixedDayOfWeek, forKey: .fixedDayOfWeek)
        try container.encodeIfPresent(self.fixedDayOfMonth, forKey: .fixedDayOfMonth)
        try container.encodeIfPresent(self.subscriptionCount, forKey: .subscriptionCount)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.productCode, forKey: .productCode)
        try container.encodeIfPresent(self.productName, forKey: .productName)
        try container.encodeIfPresent(self.productSku, forKey: .productSku)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.productPrice, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .productPrice)
        try container.encodeIfPresent(self.productFormattedPrice, forKey: .productFormattedPrice)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.productCost, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .productCost)
        try container.encodeIfPresent(self.productFormattedCost, forKey: .productFormattedCost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.productWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .productWeight)
        try container.encodeIfPresent(self.productTaxable, forKey: .productTaxable)
        try container.encodeIfPresent(self.productThumbnail, forKey: .productThumbnail)
        try container.encodeIfPresent(self.productImage, forKey: .productImage)
        try container.encodeIfPresent(self.productActive, forKey: .productActive)
        try container.encodeIfPresent(Int64(self.productDateTimeCreated.timeIntervalSince1970), forKey: .productDateTimeCreated)
        try container.encodeIfPresent(Int64(self.productDateTimeUpdated.timeIntervalSince1970), forKey: .productDateTimeUpdated)
        try container.encodeIfPresent(self.productPageTitle, forKey: .productPageTitle)
        try container.encodeIfPresent(self.productPageId, forKey: .productPageId)
        try container.encodeIfPresent(self.productPageCode, forKey: .productPageCode)
        try container.encodeIfPresent(self.productCanonicalCategoryId, forKey: .productCanonicalCategoryId)
        try container.encodeIfPresent(self.productCanonicalCategoryCode, forKey: .productCanonicalCategoryCode)
        try container.encodeIfPresent(self.productInventoryActive, forKey: .productInventoryActive)
        try container.encodeIfPresent(self.productInventory, forKey: .productInventory)
        try container.encodeIfPresent(self.paymentCardLastFour, forKey: .paymentCardLastFour)
        try container.encodeIfPresent(self.paymentCardType, forKey: .paymentCardType)
        try container.encodeIfPresent(self.addressDescription, forKey: .addressDescription)
        try container.encodeIfPresent(self.addressFirstName, forKey: .addressFirstName)
        try container.encodeIfPresent(self.addressLastName, forKey: .addressLastName)
        try container.encodeIfPresent(self.addressEmail, forKey: .addressEmail)
        try container.encodeIfPresent(self.addressCompany, forKey: .addressCompany)
        try container.encodeIfPresent(self.addressPhone, forKey: .addressPhone)
        try container.encodeIfPresent(self.addressFax, forKey: .addressFax)
        try container.encodeIfPresent(self.addressAddress, forKey: .addressAddress)
        try container.encodeIfPresent(self.addressAddress1, forKey: .addressAddress1)
        try container.encodeIfPresent(self.addressAddress2, forKey: .addressAddress2)
        try container.encodeIfPresent(self.addressCity, forKey: .addressCity)
        try container.encodeIfPresent(self.addressState, forKey: .addressState)
        try container.encodeIfPresent(self.addressZip, forKey: .addressZip)
        try container.encodeIfPresent(self.addressCountry, forKey: .addressCountry)
        try container.encodeIfPresent(self.addressResidential, forKey: .addressResidential)
        try container.encodeIfPresent(self.customerLogin, forKey: .customerLogin)
        try container.encodeIfPresent(self.customerPasswordEmail, forKey: .customerPasswordEmail)
        try container.encodeIfPresent(self.customerBusinessTitle, forKey: .customerBusinessTitle)

        try super.encode(to: encoder)
    }

    /**
     Getter for frequency.

     - Returns:  String

     */
    public func getFrequency() -> String {
        return self.frequency
    }

    /**
     Getter for term.

     - Returns:  Int

     */
    public func getTerm() -> Int {
        return self.term
    }

    /**
     Getter for descrip.

     - Returns:  String

     */
    public func getDescription() -> String {
        return self.description
    }

    /**
     Getter for n.

     - Returns:  Int

     */
    public func getN() -> Int {
        return self.n
    }

    /**
     Getter for fixed_dow.

     - Returns:  Int

     */
    public func getFixedDayOfWeek() -> Int {
        return self.fixedDayOfWeek
    }

    /**
     Getter for fixed_dom.

     - Returns:  Int

     */
    public func getFixedDayOfMonth() -> Int {
        return self.fixedDayOfMonth
    }

    /**
     Getter for sub_count.

     - Returns:  Int

     */
    public func getSubscriptionCount() -> Int {
        return self.subscriptionCount
    }

    /**
     Getter for method.

     - Returns:  String

     */
    public func getMethod() -> String {
        return self.method
    }

    /**
     Getter for product_code.

     - Returns:  String

     */
    public func getProductCode() -> String {
        return self.productCode
    }

    /**
     Getter for product_name.

     - Returns:  String

     */
    public func getProductName() -> String {
        return self.productName
    }

    /**
     Getter for product_sku.

     - Returns:  String

     */
    public func getProductSku() -> String {
        return self.productSku
    }

    /**
     Getter for product_price.

     - Returns:  Decimal     */
    public func getProductPrice() -> Decimal {
        return self.productPrice
    }

    /**
     Getter for product_formatted_price.

     - Returns:  String

     */
    public func getProductFormattedPrice() -> String {
        return self.productFormattedPrice
    }

    /**
     Getter for product_cost.

     - Returns:  Decimal     */
    public func getProductCost() -> Decimal {
        return self.productCost
    }

    /**
     Getter for product_formatted_cost.

     - Returns:  String

     */
    public func getProductFormattedCost() -> String {
        return self.productFormattedCost
    }

    /**
     Getter for product_weight.

     - Returns:  Decimal     */
    public func getProductWeight() -> Decimal {
        return self.productWeight
    }

    /**
     Getter for product_taxable.

     - Returns:  Bool     */
    public func getProductTaxable() -> Bool {
        return self.productTaxable
    }

    /**
     Getter for product_thumbnail.

     - Returns:  String

     */
    public func getProductThumbnail() -> String {
        return self.productThumbnail
    }

    /**
     Getter for product_image.

     - Returns:  String

     */
    public func getProductImage() -> String {
        return self.productImage
    }

    /**
     Getter for product_active.

     - Returns:  Bool     */
    public func getProductActive() -> Bool {
        return self.productActive
    }

    /**
     Getter for product_dt_created.

     - Returns:  Date     */
    public func getProductDateTimeCreated() -> Date {
        return self.productDateTimeCreated
    }

    /**
     Getter for product_dt_updated.

     - Returns:  Date     */
    public func getProductDateTimeUpdated() -> Date {
        return self.productDateTimeUpdated
    }

    /**
     Getter for product_page_title.

     - Returns:  String

     */
    public func getProductPageTitle() -> String {
        return self.productPageTitle
    }

    /**
     Getter for product_page_id.

     - Returns:  Int

     */
    public func getProductPageId() -> Int {
        return self.productPageId
    }

    /**
     Getter for product_page_code.

     - Returns:  String

     */
    public func getProductPageCode() -> String {
        return self.productPageCode
    }

    /**
     Getter for product_cancat_id.

     - Returns:  Int

     */
    public func getProductCanonicalCategoryId() -> Int {
        return self.productCanonicalCategoryId
    }

    /**
     Getter for product_cancat_code.

     - Returns:  String

     */
    public func getProductCanonicalCategoryCode() -> String {
        return self.productCanonicalCategoryCode
    }

    /**
     Getter for product_inventory_active.

     - Returns:  Bool     */
    public func getProductInventoryActive() -> Bool {
        return self.productInventoryActive
    }

    /**
     Getter for product_inventory.

     - Returns:  Int

     */
    public func getProductInventory() -> Int {
        return self.productInventory
    }

    /**
     Getter for paymentcard_lastfour.

     - Returns:  String

     */
    public func getPaymentCardLastFour() -> String {
        return self.paymentCardLastFour
    }

    /**
     Getter for paymentcard_type.

     - Returns:  String

     */
    public func getPaymentCardType() -> String {
        return self.paymentCardType
    }

    /**
     Getter for address_descrip.

     - Returns:  String

     */
    public func getAddressDescription() -> String {
        return self.addressDescription
    }

    /**
     Getter for address_fname.

     - Returns:  String

     */
    public func getAddressFirstName() -> String {
        return self.addressFirstName
    }

    /**
     Getter for address_lname.

     - Returns:  String

     */
    public func getAddressLastName() -> String {
        return self.addressLastName
    }

    /**
     Getter for address_email.

     - Returns:  String

     */
    public func getAddressEmail() -> String {
        return self.addressEmail
    }

    /**
     Getter for address_comp.

     - Returns:  String

     */
    public func getAddressCompany() -> String {
        return self.addressCompany
    }

    /**
     Getter for address_phone.

     - Returns:  String

     */
    public func getAddressPhone() -> String {
        return self.addressPhone
    }

    /**
     Getter for address_fax.

     - Returns:  String

     */
    public func getAddressFax() -> String {
        return self.addressFax
    }

    /**
     Getter for address_addr.

     - Returns:  String

     */
    public func getAddressAddress() -> String {
        return self.addressAddress
    }

    /**
     Getter for address_addr1.

     - Returns:  String

     */
    public func getAddressAddress1() -> String {
        return self.addressAddress1
    }

    /**
     Getter for address_addr2.

     - Returns:  String

     */
    public func getAddressAddress2() -> String {
        return self.addressAddress2
    }

    /**
     Getter for address_city.

     - Returns:  String

     */
    public func getAddressCity() -> String {
        return self.addressCity
    }

    /**
     Getter for address_state.

     - Returns:  String

     */
    public func getAddressState() -> String {
        return self.addressState
    }

    /**
     Getter for address_zip.

     - Returns:  String

     */
    public func getAddressZip() -> String {
        return self.addressZip
    }

    /**
     Getter for address_cntry.

     - Returns:  String

     */
    public func getAddressCountry() -> String {
        return self.addressCountry
    }

    /**
     Getter for address_resdntl.

     - Returns:  Bool     */
    public func getAddressResidential() -> Bool {
        return self.addressResidential
    }

    /**
     Getter for customer_login.

     - Returns:  String

     */
    public func getCustomerLogin() -> String {
        return self.customerLogin
    }

    /**
     Getter for customer_pw_email.

     - Returns:  String

     */
    public func getCustomerPasswordEmail() -> String {
        return self.customerPasswordEmail
    }

    /**
     Getter for customer_business_title.

     - Returns:  String

     */
    public func getCustomerBusinessTitle() -> String {
        return self.customerBusinessTitle
    }
}
