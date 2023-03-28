/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/**
 Handles API Request CopyProductRules_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/copyproductrules_update
 */
public class CopyProductRulesUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CopyProductRules_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field CopyProductRules_ID.
    var copyProductRulesId : Optional<Int> = nil

    /// Request field CopyProductRules_Name.
    var copyProductRulesName : Optional<String> = nil

    /// Request field Name.
    var name : Optional<String> = nil

    /// Request field CoreProductData.
    var coreProductData : Optional<Bool> = nil

    /// Request field Attributes.
    var attributes : Optional<Bool> = nil

    /// Request field CategoryAssignments.
    var categoryAssignments : Optional<Bool> = nil

    /// Request field InventorySettings.
    var inventorySettings : Optional<Bool> = nil

    /// Request field InventoryLevel.
    var inventoryLevel : Optional<Bool> = nil

    /// Request field Images.
    var images : Optional<Bool> = nil

    /// Request field RelatedProducts.
    var relatedProducts : Optional<Bool> = nil

    /// Request field Upsale.
    var upsale : Optional<Bool> = nil

    /// Request field AvailabilityGroupAssignments.
    var availabilityGroupAssignments : Optional<Bool> = nil

    /// Request field PriceGroupAssignments.
    var priceGroupAssignments : Optional<Bool> = nil

    /// Request field DigitalDownloadSettings.
    var digitalDownloadSettings : Optional<Bool> = nil

    /// Request field GiftCertificateSales.
    var giftCertificateSales : Optional<Bool> = nil

    /// Request field SubscriptionSettings.
    var subscriptionSettings : Optional<Bool> = nil

    /// Request field PaymentRules.
    var paymentRules : Optional<Bool> = nil

    /// Request field ShippingRules.
    var shippingRules : Optional<Bool> = nil

    /// Request field ProductKits.
    var productKits : Optional<Bool> = nil

    /// Request field ProductVariants.
    var productVariants : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case copyProductRulesId = "CopyProductRules_ID"
        case copyProductRulesName = "CopyProductRules_Name"
        case name = "Name"
        case coreProductData = "CoreProductData"
        case attributes = "Attributes"
        case categoryAssignments = "CategoryAssignments"
        case inventorySettings = "InventorySettings"
        case inventoryLevel = "InventoryLevel"
        case images = "Images"
        case relatedProducts = "RelatedProducts"
        case upsale = "Upsale"
        case availabilityGroupAssignments = "AvailabilityGroupAssignments"
        case priceGroupAssignments = "PriceGroupAssignments"
        case digitalDownloadSettings = "DigitalDownloadSettings"
        case giftCertificateSales = "GiftCertificateSales"
        case subscriptionSettings = "SubscriptionSettings"
        case paymentRules = "PaymentRules"
        case shippingRules = "ShippingRules"
        case productKits = "ProductKits"
        case productVariants = "ProductVariants"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - copyProductRule: An optional CopyProductRule instance.
     */
    public init(client: Optional<BaseClient> = nil, copyProductRule: Optional<CopyProductRule> = nil) {
        super.init(client: client)
        if let copyProductRule = copyProductRule {
            if copyProductRule.id > 0 {
                self.copyProductRulesId = copyProductRule.id
            } else if copyProductRule.name.count > 0 {
                self.copyProductRulesName = copyProductRule.name
            }
        }
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encode: A Encoder instance to encode to.
     - Throws: Error when unable to encode the request data.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if self.copyProductRulesId != nil {
            try container.encodeIfPresent(self.copyProductRulesId, forKey: .copyProductRulesId)
        } else if self.copyProductRulesName != nil {
            try container.encode(self.copyProductRulesName, forKey: .copyProductRulesName)
        }

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

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CopyProductRulesUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CopyProductRulesUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CopyProductRulesUpdateResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - httpResponse: The underlying HTTP response object
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CopyProductRulesUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CopyProductRulesUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CopyProductRulesUpdateResponse.self
    }

    /**
     Getter for CopyProductRules_ID.

     - Returns:  Optional<Int>
     */
    public func getCopyProductRulesId() -> Optional<Int> {
        return self.copyProductRulesId
    }

    /**
     Getter for CopyProductRules_Name.

     - Returns:  Optional<String>
     */
    public func getCopyProductRulesName() -> Optional<String> {
        return self.copyProductRulesName
    }

    /**
     Getter for Name.

     - Returns:  Optional<String>
     */
    public func getName() -> Optional<String> {
        return self.name
    }

    /**
     Getter for CoreProductData.

     - Returns:  Optional<Bool>
     */
    public func getCoreProductData() -> Optional<Bool> {
        return self.coreProductData
    }

    /**
     Getter for Attributes.

     - Returns:  Optional<Bool>
     */
    public func getAttributes() -> Optional<Bool> {
        return self.attributes
    }

    /**
     Getter for CategoryAssignments.

     - Returns:  Optional<Bool>
     */
    public func getCategoryAssignments() -> Optional<Bool> {
        return self.categoryAssignments
    }

    /**
     Getter for InventorySettings.

     - Returns:  Optional<Bool>
     */
    public func getInventorySettings() -> Optional<Bool> {
        return self.inventorySettings
    }

    /**
     Getter for InventoryLevel.

     - Returns:  Optional<Bool>
     */
    public func getInventoryLevel() -> Optional<Bool> {
        return self.inventoryLevel
    }

    /**
     Getter for Images.

     - Returns:  Optional<Bool>
     */
    public func getImages() -> Optional<Bool> {
        return self.images
    }

    /**
     Getter for RelatedProducts.

     - Returns:  Optional<Bool>
     */
    public func getRelatedProducts() -> Optional<Bool> {
        return self.relatedProducts
    }

    /**
     Getter for Upsale.

     - Returns:  Optional<Bool>
     */
    public func getUpsale() -> Optional<Bool> {
        return self.upsale
    }

    /**
     Getter for AvailabilityGroupAssignments.

     - Returns:  Optional<Bool>
     */
    public func getAvailabilityGroupAssignments() -> Optional<Bool> {
        return self.availabilityGroupAssignments
    }

    /**
     Getter for PriceGroupAssignments.

     - Returns:  Optional<Bool>
     */
    public func getPriceGroupAssignments() -> Optional<Bool> {
        return self.priceGroupAssignments
    }

    /**
     Getter for DigitalDownloadSettings.

     - Returns:  Optional<Bool>
     */
    public func getDigitalDownloadSettings() -> Optional<Bool> {
        return self.digitalDownloadSettings
    }

    /**
     Getter for GiftCertificateSales.

     - Returns:  Optional<Bool>
     */
    public func getGiftCertificateSales() -> Optional<Bool> {
        return self.giftCertificateSales
    }

    /**
     Getter for SubscriptionSettings.

     - Returns:  Optional<Bool>
     */
    public func getSubscriptionSettings() -> Optional<Bool> {
        return self.subscriptionSettings
    }

    /**
     Getter for PaymentRules.

     - Returns:  Optional<Bool>
     */
    public func getPaymentRules() -> Optional<Bool> {
        return self.paymentRules
    }

    /**
     Getter for ShippingRules.

     - Returns:  Optional<Bool>
     */
    public func getShippingRules() -> Optional<Bool> {
        return self.shippingRules
    }

    /**
     Getter for ProductKits.

     - Returns:  Optional<Bool>
     */
    public func getProductKits() -> Optional<Bool> {
        return self.productKits
    }

    /**
     Getter for ProductVariants.

     - Returns:  Optional<Bool>
     */
    public func getProductVariants() -> Optional<Bool> {
        return self.productVariants
    }

    /**
     Setter for CopyProductRules_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyProductRulesId(_ value: Optional<Int>) -> Self {
        self.copyProductRulesId = value
        return self
    }

    /**
     Setter for CopyProductRules_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyProductRulesName(_ value: Optional<String>) -> Self {
        self.copyProductRulesName = value
        return self
    }

    /**
     Setter for Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setName(_ value: Optional<String>) -> Self {
        self.name = value
        return self
    }

    /**
     Setter for CoreProductData.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCoreProductData(_ value: Optional<Bool>) -> Self {
        self.coreProductData = value
        return self
    }

    /**
     Setter for Attributes.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributes(_ value: Optional<Bool>) -> Self {
        self.attributes = value
        return self
    }

    /**
     Setter for CategoryAssignments.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryAssignments(_ value: Optional<Bool>) -> Self {
        self.categoryAssignments = value
        return self
    }

    /**
     Setter for InventorySettings.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setInventorySettings(_ value: Optional<Bool>) -> Self {
        self.inventorySettings = value
        return self
    }

    /**
     Setter for InventoryLevel.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setInventoryLevel(_ value: Optional<Bool>) -> Self {
        self.inventoryLevel = value
        return self
    }

    /**
     Setter for Images.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setImages(_ value: Optional<Bool>) -> Self {
        self.images = value
        return self
    }

    /**
     Setter for RelatedProducts.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setRelatedProducts(_ value: Optional<Bool>) -> Self {
        self.relatedProducts = value
        return self
    }

    /**
     Setter for Upsale.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setUpsale(_ value: Optional<Bool>) -> Self {
        self.upsale = value
        return self
    }

    /**
     Setter for AvailabilityGroupAssignments.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setAvailabilityGroupAssignments(_ value: Optional<Bool>) -> Self {
        self.availabilityGroupAssignments = value
        return self
    }

    /**
     Setter for PriceGroupAssignments.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupAssignments(_ value: Optional<Bool>) -> Self {
        self.priceGroupAssignments = value
        return self
    }

    /**
     Setter for DigitalDownloadSettings.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setDigitalDownloadSettings(_ value: Optional<Bool>) -> Self {
        self.digitalDownloadSettings = value
        return self
    }

    /**
     Setter for GiftCertificateSales.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setGiftCertificateSales(_ value: Optional<Bool>) -> Self {
        self.giftCertificateSales = value
        return self
    }

    /**
     Setter for SubscriptionSettings.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setSubscriptionSettings(_ value: Optional<Bool>) -> Self {
        self.subscriptionSettings = value
        return self
    }

    /**
     Setter for PaymentRules.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setPaymentRules(_ value: Optional<Bool>) -> Self {
        self.paymentRules = value
        return self
    }

    /**
     Setter for ShippingRules.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setShippingRules(_ value: Optional<Bool>) -> Self {
        self.shippingRules = value
        return self
    }

    /**
     Setter for ProductKits.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setProductKits(_ value: Optional<Bool>) -> Self {
        self.productKits = value
        return self
    }

    /**
     Setter for ProductVariants.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setProductVariants(_ value: Optional<Bool>) -> Self {
        self.productVariants = value
        return self
    }
}
