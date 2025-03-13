/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Store data model.
public class Store : Model {

    /// Enumeration CacheTypes
    public enum CacheTypes : String {
        case CacheTypeNone = "none"
        case CacheTypeRedis = "redis"
    }

    /// Model field id.
    var id : Int

    /// Model field manager_id.
    var managerId : Int

    /// Model field code.
    var code : String

    /// Model field license.
    var license : String

    /// Model field name.
    var name : String

    /// Model field icon.
    var icon : String

    /// Model field owner.
    var owner : String

    /// Model field email.
    var email : String

    /// Model field company.
    var company : String

    /// Model field address.
    var address : String

    /// Model field city.
    var city : String

    /// Model field state.
    var state : String

    /// Model field zip.
    var zip : String

    /// Model field phone.
    var phone : String

    /// Model field fax.
    var fax : String

    /// Model field country.
    var country : String

    /// Model field wtunits.
    var weightUnits : String

    /// Model field wtunitcode.
    var weightUnitCode : String

    /// Model field wtdispmix.
    var displayMixedWeightUnits : Bool

    /// Model field wtdisplow.
    var displayWeightLessThan : Bool

    /// Model field wtdispdig.
    var weightDigits : Int

    /// Model field dmunitcode.
    var dimensionUnits : String

    /// Model field baskexp.
    var basketExpiration : Int

    /// Model field pgrp_ovlp.
    var priceGroupOverlapResolution : String

    /// Model field ui_id.
    var userInterfaceId : Int

    /// Model field tax_id.
    var taxId : Int

    /// Model field currncy_id.
    var currencyId : Int

    /// Model field mnt_warn.
    var maintenanceWarningMessage : String

    /// Model field mnt_close.
    var maintenanceClosedMessage : String

    /// Model field mnt_time.
    var maintenanceTime : Int

    /// Model field mnt_no_new.
    var maintenanceNoNewCustomersBefore : Int

    /// Model field omin_quant.
    var orderMinimumQuantity : Int

    /// Model field omin_price.
    var orderMinimumPrice : Decimal

    /// Model field omin_all.
    var orderMinimumRequiredAll : Bool

    /// Model field omin_msg.
    var orderMinimumMessage : String

    /// Model field crypt_id.
    var cryptId : Int

    /// Model field req_ship.
    var requireShipping : Bool

    /// Model field req_tax.
    var requireTax : Bool

    /// Model field req_frship.
    var requireFreeOrderShipping : Bool

    /// Model field item_adel.
    var itemModuleUninstallable : Bool

    /// Model field cache_type.
    var cacheType : String

    /// Model field cache_exp.
    var cacheExpiration : Int

    /// Model field cache_ver.
    var cacheVersion : Int

    /// Model field cache_comp.
    var cacheCompression : Bool

    /// Model field cacheset.
    var cacheSet : Int

    /// Model field redishost.
    var redisHost : String

    /// Model field redisport.
    var redisPort : Int

    /// Model field redisto.
    var redisTimeout : Int

    /// Model field redisex.
    var redisExpiration : Int

    /// Model field boxpack_id.
    var boxPackingId : Int

    /// Model field addrval_id.
    var addressValidationId : Int

    /// Model field deferbask.
    var deferBaskets : Bool

    /// Model field trackhits.
    var trackPageHits : Bool

    /// Model field mnt_ips.
    var maintenanceAllowedIps : String

    /// Model field branch_id.
    var branchId : Int

    /// Model field charset.
    var characterSet : String

    /// Model field schtsk_adv.
    var scheduledTaskAdvance : Int

    /// Model field schtsk_min.
    var scheduledTaskTimeout : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case managerId = "manager_id"
        case code
        case license
        case name
        case icon
        case owner
        case email
        case company
        case address
        case city
        case state
        case zip
        case phone
        case fax
        case country
        case weightUnits = "wtunits"
        case weightUnitCode = "wtunitcode"
        case displayMixedWeightUnits = "wtdispmix"
        case displayWeightLessThan = "wtdisplow"
        case weightDigits = "wtdispdig"
        case dimensionUnits = "dmunitcode"
        case basketExpiration = "baskexp"
        case priceGroupOverlapResolution = "pgrp_ovlp"
        case userInterfaceId = "ui_id"
        case taxId = "tax_id"
        case currencyId = "currncy_id"
        case maintenanceWarningMessage = "mnt_warn"
        case maintenanceClosedMessage = "mnt_close"
        case maintenanceTime = "mnt_time"
        case maintenanceNoNewCustomersBefore = "mnt_no_new"
        case orderMinimumQuantity = "omin_quant"
        case orderMinimumPrice = "omin_price"
        case orderMinimumRequiredAll = "omin_all"
        case orderMinimumMessage = "omin_msg"
        case cryptId = "crypt_id"
        case requireShipping = "req_ship"
        case requireTax = "req_tax"
        case requireFreeOrderShipping = "req_frship"
        case itemModuleUninstallable = "item_adel"
        case cacheType = "cache_type"
        case cacheExpiration = "cache_exp"
        case cacheVersion = "cache_ver"
        case cacheCompression = "cache_comp"
        case cacheSet = "cacheset"
        case redisHost = "redishost"
        case redisPort = "redisport"
        case redisTimeout = "redisto"
        case redisExpiration = "redisex"
        case boxPackingId = "boxpack_id"
        case addressValidationId = "addrval_id"
        case deferBaskets = "deferbask"
        case trackPageHits = "trackhits"
        case maintenanceAllowedIps = "mnt_ips"
        case branchId = "branch_id"
        case characterSet = "charset"
        case scheduledTaskAdvance = "schtsk_adv"
        case scheduledTaskTimeout = "schtsk_min"
    }

    /**
     Store Constructor.
     */
    public override init() {
        self.id = 0
        self.managerId = 0
        self.code = ""
        self.license = ""
        self.name = ""
        self.icon = ""
        self.owner = ""
        self.email = ""
        self.company = ""
        self.address = ""
        self.city = ""
        self.state = ""
        self.zip = ""
        self.phone = ""
        self.fax = ""
        self.country = ""
        self.weightUnits = ""
        self.weightUnitCode = ""
        self.displayMixedWeightUnits = false
        self.displayWeightLessThan = false
        self.weightDigits = 0
        self.dimensionUnits = ""
        self.basketExpiration = 0
        self.priceGroupOverlapResolution = ""
        self.userInterfaceId = 0
        self.taxId = 0
        self.currencyId = 0
        self.maintenanceWarningMessage = ""
        self.maintenanceClosedMessage = ""
        self.maintenanceTime = 0
        self.maintenanceNoNewCustomersBefore = 0
        self.orderMinimumQuantity = 0
        self.orderMinimumPrice = Decimal(0.00)
        self.orderMinimumRequiredAll = false
        self.orderMinimumMessage = ""
        self.cryptId = 0
        self.requireShipping = false
        self.requireTax = false
        self.requireFreeOrderShipping = false
        self.itemModuleUninstallable = false
        self.cacheType = ""
        self.cacheExpiration = 0
        self.cacheVersion = 0
        self.cacheCompression = false
        self.cacheSet = 0
        self.redisHost = ""
        self.redisPort = 0
        self.redisTimeout = 0
        self.redisExpiration = 0
        self.boxPackingId = 0
        self.addressValidationId = 0
        self.deferBaskets = false
        self.trackPageHits = false
        self.maintenanceAllowedIps = ""
        self.branchId = 0
        self.characterSet = ""
        self.scheduledTaskAdvance = 0
        self.scheduledTaskTimeout = 0

        super.init()
    }

    /**
     Store Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.managerId = try container.decodeIfPresent(Int.self, forKey: .managerId) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.license = try container.decodeIfPresent(String.self, forKey: .license) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon) ?? ""
        self.owner = try container.decodeIfPresent(String.self, forKey: .owner) ?? ""
        self.email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        self.company = try container.decodeIfPresent(String.self, forKey: .company) ?? ""
        self.address = try container.decodeIfPresent(String.self, forKey: .address) ?? ""
        self.city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        self.state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        self.zip = try container.decodeIfPresent(String.self, forKey: .zip) ?? ""
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        self.fax = try container.decodeIfPresent(String.self, forKey: .fax) ?? ""
        self.country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        self.weightUnits = try container.decodeIfPresent(String.self, forKey: .weightUnits) ?? ""
        self.weightUnitCode = try container.decodeIfPresent(String.self, forKey: .weightUnitCode) ?? ""
        self.displayMixedWeightUnits = try container.decodeIfPresent(Bool.self, forKey: .displayMixedWeightUnits) ?? false
        self.displayWeightLessThan = try container.decodeIfPresent(Bool.self, forKey: .displayWeightLessThan) ?? false
        self.weightDigits = try container.decodeIfPresent(Int.self, forKey: .weightDigits) ?? 0
        self.dimensionUnits = try container.decodeIfPresent(String.self, forKey: .dimensionUnits) ?? ""
        self.basketExpiration = try container.decodeIfPresent(Int.self, forKey: .basketExpiration) ?? 0
        self.priceGroupOverlapResolution = try container.decodeIfPresent(String.self, forKey: .priceGroupOverlapResolution) ?? ""
        self.userInterfaceId = try container.decodeIfPresent(Int.self, forKey: .userInterfaceId) ?? 0
        self.taxId = try container.decodeIfPresent(Int.self, forKey: .taxId) ?? 0
        self.currencyId = try container.decodeIfPresent(Int.self, forKey: .currencyId) ?? 0
        self.maintenanceWarningMessage = try container.decodeIfPresent(String.self, forKey: .maintenanceWarningMessage) ?? ""
        self.maintenanceClosedMessage = try container.decodeIfPresent(String.self, forKey: .maintenanceClosedMessage) ?? ""
        self.maintenanceTime = try container.decodeIfPresent(Int.self, forKey: .maintenanceTime) ?? 0
        self.maintenanceNoNewCustomersBefore = try container.decodeIfPresent(Int.self, forKey: .maintenanceNoNewCustomersBefore) ?? 0
        self.orderMinimumQuantity = try container.decodeIfPresent(Int.self, forKey: .orderMinimumQuantity) ?? 0
        self.orderMinimumPrice = try container.decodeIfPresent(Decimal.self, forKey: .orderMinimumPrice) ?? Decimal(0.00)
        self.orderMinimumRequiredAll = try container.decodeIfPresent(Bool.self, forKey: .orderMinimumRequiredAll) ?? false
        self.orderMinimumMessage = try container.decodeIfPresent(String.self, forKey: .orderMinimumMessage) ?? ""
        self.cryptId = try container.decodeIfPresent(Int.self, forKey: .cryptId) ?? 0
        self.requireShipping = try container.decodeIfPresent(Bool.self, forKey: .requireShipping) ?? false
        self.requireTax = try container.decodeIfPresent(Bool.self, forKey: .requireTax) ?? false
        self.requireFreeOrderShipping = try container.decodeIfPresent(Bool.self, forKey: .requireFreeOrderShipping) ?? false
        self.itemModuleUninstallable = try container.decodeIfPresent(Bool.self, forKey: .itemModuleUninstallable) ?? false
        self.cacheType = try container.decodeIfPresent(String.self, forKey: .cacheType) ?? ""
        self.cacheExpiration = try container.decodeIfPresent(Int.self, forKey: .cacheExpiration) ?? 0
        self.cacheVersion = try container.decodeIfPresent(Int.self, forKey: .cacheVersion) ?? 0
        self.cacheCompression = try container.decodeIfPresent(Bool.self, forKey: .cacheCompression) ?? false
        self.cacheSet = try container.decodeIfPresent(Int.self, forKey: .cacheSet) ?? 0
        self.redisHost = try container.decodeIfPresent(String.self, forKey: .redisHost) ?? ""
        self.redisPort = try container.decodeIfPresent(Int.self, forKey: .redisPort) ?? 0
        self.redisTimeout = try container.decodeIfPresent(Int.self, forKey: .redisTimeout) ?? 0
        self.redisExpiration = try container.decodeIfPresent(Int.self, forKey: .redisExpiration) ?? 0
        self.boxPackingId = try container.decodeIfPresent(Int.self, forKey: .boxPackingId) ?? 0
        self.addressValidationId = try container.decodeIfPresent(Int.self, forKey: .addressValidationId) ?? 0
        self.deferBaskets = try container.decodeIfPresent(Bool.self, forKey: .deferBaskets) ?? false
        self.trackPageHits = try container.decodeIfPresent(Bool.self, forKey: .trackPageHits) ?? false
        self.maintenanceAllowedIps = try container.decodeIfPresent(String.self, forKey: .maintenanceAllowedIps) ?? ""
        self.branchId = try container.decodeIfPresent(Int.self, forKey: .branchId) ?? 0
        self.characterSet = try container.decodeIfPresent(String.self, forKey: .characterSet) ?? ""
        self.scheduledTaskAdvance = try container.decodeIfPresent(Int.self, forKey: .scheduledTaskAdvance) ?? 0
        self.scheduledTaskTimeout = try container.decodeIfPresent(Int.self, forKey: .scheduledTaskTimeout) ?? 0

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
        try container.encodeIfPresent(self.managerId, forKey: .managerId)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.license, forKey: .license)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.icon, forKey: .icon)
        try container.encodeIfPresent(self.owner, forKey: .owner)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.company, forKey: .company)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zip, forKey: .zip)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.fax, forKey: .fax)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.weightUnits, forKey: .weightUnits)
        try container.encodeIfPresent(self.weightUnitCode, forKey: .weightUnitCode)
        try container.encodeIfPresent(self.displayMixedWeightUnits, forKey: .displayMixedWeightUnits)
        try container.encodeIfPresent(self.displayWeightLessThan, forKey: .displayWeightLessThan)
        try container.encodeIfPresent(self.weightDigits, forKey: .weightDigits)
        try container.encodeIfPresent(self.dimensionUnits, forKey: .dimensionUnits)
        try container.encodeIfPresent(self.basketExpiration, forKey: .basketExpiration)
        try container.encodeIfPresent(self.priceGroupOverlapResolution, forKey: .priceGroupOverlapResolution)
        try container.encodeIfPresent(self.userInterfaceId, forKey: .userInterfaceId)
        try container.encodeIfPresent(self.taxId, forKey: .taxId)
        try container.encodeIfPresent(self.currencyId, forKey: .currencyId)
        try container.encodeIfPresent(self.maintenanceWarningMessage, forKey: .maintenanceWarningMessage)
        try container.encodeIfPresent(self.maintenanceClosedMessage, forKey: .maintenanceClosedMessage)
        try container.encodeIfPresent(self.maintenanceTime, forKey: .maintenanceTime)
        try container.encodeIfPresent(self.maintenanceNoNewCustomersBefore, forKey: .maintenanceNoNewCustomersBefore)
        try container.encodeIfPresent(self.orderMinimumQuantity, forKey: .orderMinimumQuantity)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.orderMinimumPrice, precision: 2), forKey: .orderMinimumPrice)
        try container.encodeIfPresent(self.orderMinimumRequiredAll, forKey: .orderMinimumRequiredAll)
        try container.encodeIfPresent(self.orderMinimumMessage, forKey: .orderMinimumMessage)
        try container.encodeIfPresent(self.cryptId, forKey: .cryptId)
        try container.encodeIfPresent(self.requireShipping, forKey: .requireShipping)
        try container.encodeIfPresent(self.requireTax, forKey: .requireTax)
        try container.encodeIfPresent(self.requireFreeOrderShipping, forKey: .requireFreeOrderShipping)
        try container.encodeIfPresent(self.itemModuleUninstallable, forKey: .itemModuleUninstallable)
        try container.encodeIfPresent(self.cacheType, forKey: .cacheType)
        try container.encodeIfPresent(self.cacheExpiration, forKey: .cacheExpiration)
        try container.encodeIfPresent(self.cacheVersion, forKey: .cacheVersion)
        try container.encodeIfPresent(self.cacheCompression, forKey: .cacheCompression)
        try container.encodeIfPresent(self.cacheSet, forKey: .cacheSet)
        try container.encodeIfPresent(self.redisHost, forKey: .redisHost)
        try container.encodeIfPresent(self.redisPort, forKey: .redisPort)
        try container.encodeIfPresent(self.redisTimeout, forKey: .redisTimeout)
        try container.encodeIfPresent(self.redisExpiration, forKey: .redisExpiration)
        try container.encodeIfPresent(self.boxPackingId, forKey: .boxPackingId)
        try container.encodeIfPresent(self.addressValidationId, forKey: .addressValidationId)
        try container.encodeIfPresent(self.deferBaskets, forKey: .deferBaskets)
        try container.encodeIfPresent(self.trackPageHits, forKey: .trackPageHits)
        try container.encodeIfPresent(self.maintenanceAllowedIps, forKey: .maintenanceAllowedIps)
        try container.encodeIfPresent(self.branchId, forKey: .branchId)
        try container.encodeIfPresent(self.characterSet, forKey: .characterSet)
        try container.encodeIfPresent(self.scheduledTaskAdvance, forKey: .scheduledTaskAdvance)
        try container.encodeIfPresent(self.scheduledTaskTimeout, forKey: .scheduledTaskTimeout)

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
     Getter for manager_id.

     - Returns:  Int

     */
    public func getManagerId() -> Int {
        return self.managerId
    }

    /**
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for license.

     - Returns:  String

     */
    public func getLicense() -> String {
        return self.license
    }

    /**
     Getter for name.

     - Returns:  String

     */
    public func getName() -> String {
        return self.name
    }

    /**
     Getter for icon.

     - Returns:  String

     */
    public func getIcon() -> String {
        return self.icon
    }

    /**
     Getter for owner.

     - Returns:  String

     */
    public func getOwner() -> String {
        return self.owner
    }

    /**
     Getter for email.

     - Returns:  String

     */
    public func getEmail() -> String {
        return self.email
    }

    /**
     Getter for company.

     - Returns:  String

     */
    public func getCompany() -> String {
        return self.company
    }

    /**
     Getter for address.

     - Returns:  String

     */
    public func getAddress() -> String {
        return self.address
    }

    /**
     Getter for city.

     - Returns:  String

     */
    public func getCity() -> String {
        return self.city
    }

    /**
     Getter for state.

     - Returns:  String

     */
    public func getState() -> String {
        return self.state
    }

    /**
     Getter for zip.

     - Returns:  String

     */
    public func getZip() -> String {
        return self.zip
    }

    /**
     Getter for phone.

     - Returns:  String

     */
    public func getPhone() -> String {
        return self.phone
    }

    /**
     Getter for fax.

     - Returns:  String

     */
    public func getFax() -> String {
        return self.fax
    }

    /**
     Getter for country.

     - Returns:  String

     */
    public func getCountry() -> String {
        return self.country
    }

    /**
     Getter for wtunits.

     - Returns:  String

     */
    public func getWeightUnits() -> String {
        return self.weightUnits
    }

    /**
     Getter for wtunitcode.

     - Returns:  String

     */
    public func getWeightUnitCode() -> String {
        return self.weightUnitCode
    }

    /**
     Getter for wtdispmix.

     - Returns:  Bool     */
    public func getDisplayMixedWeightUnits() -> Bool {
        return self.displayMixedWeightUnits
    }

    /**
     Getter for wtdisplow.

     - Returns:  Bool     */
    public func getDisplayWeightLessThan() -> Bool {
        return self.displayWeightLessThan
    }

    /**
     Getter for wtdispdig.

     - Returns:  Int

     */
    public func getWeightDigits() -> Int {
        return self.weightDigits
    }

    /**
     Getter for dmunitcode.

     - Returns:  String

     */
    public func getDimensionUnits() -> String {
        return self.dimensionUnits
    }

    /**
     Getter for baskexp.

     - Returns:  Int

     */
    public func getBasketExpiration() -> Int {
        return self.basketExpiration
    }

    /**
     Getter for pgrp_ovlp.

     - Returns:  String

     */
    public func getPriceGroupOverlapResolution() -> String {
        return self.priceGroupOverlapResolution
    }

    /**
     Getter for ui_id.

     - Returns:  Int

     */
    public func getUserInterfaceId() -> Int {
        return self.userInterfaceId
    }

    /**
     Getter for tax_id.

     - Returns:  Int

     */
    public func getTaxId() -> Int {
        return self.taxId
    }

    /**
     Getter for currncy_id.

     - Returns:  Int

     */
    public func getCurrencyId() -> Int {
        return self.currencyId
    }

    /**
     Getter for mnt_warn.

     - Returns:  String

     */
    public func getMaintenanceWarningMessage() -> String {
        return self.maintenanceWarningMessage
    }

    /**
     Getter for mnt_close.

     - Returns:  String

     */
    public func getMaintenanceClosedMessage() -> String {
        return self.maintenanceClosedMessage
    }

    /**
     Getter for mnt_time.

     - Returns:  Int

     */
    public func getMaintenanceTime() -> Int {
        return self.maintenanceTime
    }

    /**
     Getter for mnt_no_new.

     - Returns:  Int

     */
    public func getMaintenanceNoNewCustomersBefore() -> Int {
        return self.maintenanceNoNewCustomersBefore
    }

    /**
     Getter for omin_quant.

     - Returns:  Int

     */
    public func getOrderMinimumQuantity() -> Int {
        return self.orderMinimumQuantity
    }

    /**
     Getter for omin_price.

     - Returns:  Decimal     */
    public func getOrderMinimumPrice() -> Decimal {
        return self.orderMinimumPrice
    }

    /**
     Getter for omin_all.

     - Returns:  Bool     */
    public func getOrderMinimumRequiredAll() -> Bool {
        return self.orderMinimumRequiredAll
    }

    /**
     Getter for omin_msg.

     - Returns:  String

     */
    public func getOrderMinimumMessage() -> String {
        return self.orderMinimumMessage
    }

    /**
     Getter for crypt_id.

     - Returns:  Int

     */
    public func getCryptId() -> Int {
        return self.cryptId
    }

    /**
     Getter for req_ship.

     - Returns:  Bool     */
    public func getRequireShipping() -> Bool {
        return self.requireShipping
    }

    /**
     Getter for req_tax.

     - Returns:  Bool     */
    public func getRequireTax() -> Bool {
        return self.requireTax
    }

    /**
     Getter for req_frship.

     - Returns:  Bool     */
    public func getRequireFreeOrderShipping() -> Bool {
        return self.requireFreeOrderShipping
    }

    /**
     Getter for item_adel.

     - Returns:  Bool     */
    public func getItemModuleUninstallable() -> Bool {
        return self.itemModuleUninstallable
    }

    /**
     Getter for cache_type.

     - Returns:  String

     */
    public func getCacheType() -> String {
        return self.cacheType
    }

    /**
     Enum Getter for cache_type.

     - Returns:  Optional<CacheTypes>
     */
    public func getCacheType() -> Optional<CacheTypes> {
        return CacheTypes(rawValue: self.cacheType) ?? nil
    }

    /**
     Getter for cache_exp.

     - Returns:  Int

     */
    public func getCacheExpiration() -> Int {
        return self.cacheExpiration
    }

    /**
     Getter for cache_ver.

     - Returns:  Int

     */
    public func getCacheVersion() -> Int {
        return self.cacheVersion
    }

    /**
     Getter for cache_comp.

     - Returns:  Bool     */
    public func getCacheCompression() -> Bool {
        return self.cacheCompression
    }

    /**
     Getter for cacheset.

     - Returns:  Int

     */
    public func getCacheSet() -> Int {
        return self.cacheSet
    }

    /**
     Getter for redishost.

     - Returns:  String

     */
    public func getRedisHost() -> String {
        return self.redisHost
    }

    /**
     Getter for redisport.

     - Returns:  Int

     */
    public func getRedisPort() -> Int {
        return self.redisPort
    }

    /**
     Getter for redisto.

     - Returns:  Int

     */
    public func getRedisTimeout() -> Int {
        return self.redisTimeout
    }

    /**
     Getter for redisex.

     - Returns:  Int

     */
    public func getRedisExpiration() -> Int {
        return self.redisExpiration
    }

    /**
     Getter for boxpack_id.

     - Returns:  Int

     */
    public func getBoxPackingId() -> Int {
        return self.boxPackingId
    }

    /**
     Getter for addrval_id.

     - Returns:  Int

     */
    public func getAddressValidationId() -> Int {
        return self.addressValidationId
    }

    /**
     Getter for deferbask.

     - Returns:  Bool     */
    public func getDeferBaskets() -> Bool {
        return self.deferBaskets
    }

    /**
     Getter for trackhits.

     - Returns:  Bool     */
    public func getTrackPageHits() -> Bool {
        return self.trackPageHits
    }

    /**
     Getter for mnt_ips.

     - Returns:  String

     */
    public func getMaintenanceAllowedIps() -> String {
        return self.maintenanceAllowedIps
    }

    /**
     Getter for branch_id.

     - Returns:  Int

     */
    public func getBranchId() -> Int {
        return self.branchId
    }

    /**
     Getter for charset.

     - Returns:  String

     */
    public func getCharacterSet() -> String {
        return self.characterSet
    }

    /**
     Getter for schtsk_adv.

     - Returns:  Int

     */
    public func getScheduledTaskAdvance() -> Int {
        return self.scheduledTaskAdvance
    }

    /**
     Getter for schtsk_min.

     - Returns:  Int

     */
    public func getScheduledTaskTimeout() -> Int {
        return self.scheduledTaskTimeout
    }
}
