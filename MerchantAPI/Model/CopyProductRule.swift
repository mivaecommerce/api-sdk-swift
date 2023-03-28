/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CopyProductRule data model.
public class CopyProductRule : Model {

    /// Model field id.
    var id : Int

    /// Model field name.
    var name : String

    /// Model field product.
    var coreProductData : Bool

    /// Model field attributes.
    var attributes : Bool

    /// Model field categories.
    var categoryAssignments : Bool

    /// Model field invset.
    var inventorySettings : Bool

    /// Model field invlevel.
    var inventoryLevel : Bool

    /// Model field images.
    var images : Bool

    /// Model field relprod.
    var relatedProducts : Bool

    /// Model field upsale.
    var upsale : Bool

    /// Model field availgroup.
    var availabilityGroupAssignments : Bool

    /// Model field pricegroup.
    var priceGroupAssignments : Bool

    /// Model field ddownload.
    var digitalDownloadSettings : Bool

    /// Model field giftcert.
    var giftCertificateSales : Bool

    /// Model field subscrip.
    var subscriptionSettings : Bool

    /// Model field payment.
    var paymentRules : Bool

    /// Model field shipping.
    var shippingRules : Bool

    /// Model field kit.
    var productKits : Bool

    /// Model field variants.
    var productVariants : Bool

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case coreProductData = "product"
        case attributes
        case categoryAssignments = "categories"
        case inventorySettings = "invset"
        case inventoryLevel = "invlevel"
        case images
        case relatedProducts = "relprod"
        case upsale
        case availabilityGroupAssignments = "availgroup"
        case priceGroupAssignments = "pricegroup"
        case digitalDownloadSettings = "ddownload"
        case giftCertificateSales = "giftcert"
        case subscriptionSettings = "subscrip"
        case paymentRules = "payment"
        case shippingRules = "shipping"
        case productKits = "kit"
        case productVariants = "variants"
    }

    /**
     CopyProductRule Constructor.
     */
    public override init() {
        self.id = 0
        self.name = ""
        self.coreProductData = false
        self.attributes = false
        self.categoryAssignments = false
        self.inventorySettings = false
        self.inventoryLevel = false
        self.images = false
        self.relatedProducts = false
        self.upsale = false
        self.availabilityGroupAssignments = false
        self.priceGroupAssignments = false
        self.digitalDownloadSettings = false
        self.giftCertificateSales = false
        self.subscriptionSettings = false
        self.paymentRules = false
        self.shippingRules = false
        self.productKits = false
        self.productVariants = false

        super.init()
    }

    /**
     CopyProductRule Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.coreProductData = try container.decodeIfPresent(Bool.self, forKey: .coreProductData) ?? false
        self.attributes = try container.decodeIfPresent(Bool.self, forKey: .attributes) ?? false
        self.categoryAssignments = try container.decodeIfPresent(Bool.self, forKey: .categoryAssignments) ?? false
        self.inventorySettings = try container.decodeIfPresent(Bool.self, forKey: .inventorySettings) ?? false
        self.inventoryLevel = try container.decodeIfPresent(Bool.self, forKey: .inventoryLevel) ?? false
        self.images = try container.decodeIfPresent(Bool.self, forKey: .images) ?? false
        self.relatedProducts = try container.decodeIfPresent(Bool.self, forKey: .relatedProducts) ?? false
        self.upsale = try container.decodeIfPresent(Bool.self, forKey: .upsale) ?? false
        self.availabilityGroupAssignments = try container.decodeIfPresent(Bool.self, forKey: .availabilityGroupAssignments) ?? false
        self.priceGroupAssignments = try container.decodeIfPresent(Bool.self, forKey: .priceGroupAssignments) ?? false
        self.digitalDownloadSettings = try container.decodeIfPresent(Bool.self, forKey: .digitalDownloadSettings) ?? false
        self.giftCertificateSales = try container.decodeIfPresent(Bool.self, forKey: .giftCertificateSales) ?? false
        self.subscriptionSettings = try container.decodeIfPresent(Bool.self, forKey: .subscriptionSettings) ?? false
        self.paymentRules = try container.decodeIfPresent(Bool.self, forKey: .paymentRules) ?? false
        self.shippingRules = try container.decodeIfPresent(Bool.self, forKey: .shippingRules) ?? false
        self.productKits = try container.decodeIfPresent(Bool.self, forKey: .productKits) ?? false
        self.productVariants = try container.decodeIfPresent(Bool.self, forKey: .productVariants) ?? false

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
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.coreProductData, forKey: .coreProductData)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)
        try container.encodeIfPresent(self.categoryAssignments, forKey: .categoryAssignments)
        try container.encodeIfPresent(self.inventorySettings, forKey: .inventorySettings)
        try container.encodeIfPresent(self.inventoryLevel, forKey: .inventoryLevel)
        try container.encodeIfPresent(self.images, forKey: .images)
        try container.encodeIfPresent(self.relatedProducts, forKey: .relatedProducts)
        try container.encodeIfPresent(self.upsale, forKey: .upsale)
        try container.encodeIfPresent(self.availabilityGroupAssignments, forKey: .availabilityGroupAssignments)
        try container.encodeIfPresent(self.priceGroupAssignments, forKey: .priceGroupAssignments)
        try container.encodeIfPresent(self.digitalDownloadSettings, forKey: .digitalDownloadSettings)
        try container.encodeIfPresent(self.giftCertificateSales, forKey: .giftCertificateSales)
        try container.encodeIfPresent(self.subscriptionSettings, forKey: .subscriptionSettings)
        try container.encodeIfPresent(self.paymentRules, forKey: .paymentRules)
        try container.encodeIfPresent(self.shippingRules, forKey: .shippingRules)
        try container.encodeIfPresent(self.productKits, forKey: .productKits)
        try container.encodeIfPresent(self.productVariants, forKey: .productVariants)

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
     Getter for name.

     - Returns:  String

     */
    public func getName() -> String {
        return self.name
    }

    /**
     Getter for product.

     - Returns:  Bool     */
    public func getCoreProductData() -> Bool {
        return self.coreProductData
    }

    /**
     Getter for attributes.

     - Returns:  Bool     */
    public func getAttributes() -> Bool {
        return self.attributes
    }

    /**
     Getter for categories.

     - Returns:  Bool     */
    public func getCategoryAssignments() -> Bool {
        return self.categoryAssignments
    }

    /**
     Getter for invset.

     - Returns:  Bool     */
    public func getInventorySettings() -> Bool {
        return self.inventorySettings
    }

    /**
     Getter for invlevel.

     - Returns:  Bool     */
    public func getInventoryLevel() -> Bool {
        return self.inventoryLevel
    }

    /**
     Getter for images.

     - Returns:  Bool     */
    public func getImages() -> Bool {
        return self.images
    }

    /**
     Getter for relprod.

     - Returns:  Bool     */
    public func getRelatedProducts() -> Bool {
        return self.relatedProducts
    }

    /**
     Getter for upsale.

     - Returns:  Bool     */
    public func getUpsale() -> Bool {
        return self.upsale
    }

    /**
     Getter for availgroup.

     - Returns:  Bool     */
    public func getAvailabilityGroupAssignments() -> Bool {
        return self.availabilityGroupAssignments
    }

    /**
     Getter for pricegroup.

     - Returns:  Bool     */
    public func getPriceGroupAssignments() -> Bool {
        return self.priceGroupAssignments
    }

    /**
     Getter for ddownload.

     - Returns:  Bool     */
    public func getDigitalDownloadSettings() -> Bool {
        return self.digitalDownloadSettings
    }

    /**
     Getter for giftcert.

     - Returns:  Bool     */
    public func getGiftCertificateSales() -> Bool {
        return self.giftCertificateSales
    }

    /**
     Getter for subscrip.

     - Returns:  Bool     */
    public func getSubscriptionSettings() -> Bool {
        return self.subscriptionSettings
    }

    /**
     Getter for payment.

     - Returns:  Bool     */
    public func getPaymentRules() -> Bool {
        return self.paymentRules
    }

    /**
     Getter for shipping.

     - Returns:  Bool     */
    public func getShippingRules() -> Bool {
        return self.shippingRules
    }

    /**
     Getter for kit.

     - Returns:  Bool     */
    public func getProductKits() -> Bool {
        return self.productKits
    }

    /**
     Getter for variants.

     - Returns:  Bool     */
    public func getProductVariants() -> Bool {
        return self.productVariants
    }
}
