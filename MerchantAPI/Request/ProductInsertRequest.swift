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
 Handles API Request Product_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/product_insert
 */
public class ProductInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Product_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Product_Code.
    var productCode : Optional<String> = nil

    /// Request field Product_SKU.
    var productSku : Optional<String> = nil

    /// Request field Product_Name.
    var productName : Optional<String> = nil

    /// Request field Product_Description.
    var productDescription : Optional<String> = nil

    /// Request field Product_Canonical_Category_Code.
    var productCanonicalCategoryCode : Optional<String> = nil

    /// Request field Product_Alternate_Display_Page.
    var productAlternateDisplayPage : Optional<String> = nil

    /// Request field Product_Page_Title.
    var productPageTitle : Optional<String> = nil

    /// Request field Product_Thumbnail.
    var productThumbnail : Optional<String> = nil

    /// Request field Product_Image.
    var productImage : Optional<String> = nil

    /// Request field Product_Price.
    var productPrice : Optional<Decimal> = nil

    /// Request field Product_Cost.
    var productCost : Optional<Decimal> = nil

    /// Request field Product_Weight.
    var productWeight : Optional<Decimal> = nil

    /// Request field Product_Inventory.
    var productInventory : Optional<Int> = nil

    /// Request field Product_Taxable.
    var productTaxable : Optional<Bool> = nil

    /// Request field Product_Active.
    var productActive : Optional<Bool> = nil

    /// Request field CustomField_Values.
    var customFieldValues : CustomFieldValues

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productCode = "Product_Code"
        case productSku = "Product_SKU"
        case productName = "Product_Name"
        case productDescription = "Product_Description"
        case productCanonicalCategoryCode = "Product_Canonical_Category_Code"
        case productAlternateDisplayPage = "Product_Alternate_Display_Page"
        case productPageTitle = "Product_Page_Title"
        case productThumbnail = "Product_Thumbnail"
        case productImage = "Product_Image"
        case productPrice = "Product_Price"
        case productCost = "Product_Cost"
        case productWeight = "Product_Weight"
        case productInventory = "Product_Inventory"
        case productTaxable = "Product_Taxable"
        case productActive = "Product_Active"
        case customFieldValues = "CustomField_Values"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - product: An optional Product instance.
     */
    public init(client: Optional<BaseClient> = nil, product: Optional<Product> = nil) {
        self.customFieldValues = CustomFieldValues()
        super.init(client: client)
        if let product = product {
            self.productCode = product.code
            self.productSku = product.sku
            self.productName = product.name
            self.productDescription = product.description
            self.productCanonicalCategoryCode = product.canonicalCategoryCode
            self.productAlternateDisplayPage = product.pageCode
            self.productPageTitle = product.pageTitle
            self.productThumbnail = product.thumbnail
            self.productImage = product.image
            self.productPrice = product.price
            self.productCost = product.cost
            self.productWeight = product.weight
            self.productInventory = product.productInventory
            self.productTaxable = product.taxable
            self.productActive = product.active
            self.customFieldValues = product.customFieldValues
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

        try container.encodeIfPresent(self.productCode, forKey: .productCode)
        try container.encodeIfPresent(self.productSku, forKey: .productSku)
        try container.encodeIfPresent(self.productName, forKey: .productName)
        try container.encodeIfPresent(self.productDescription, forKey: .productDescription)
        try container.encodeIfPresent(self.productCanonicalCategoryCode, forKey: .productCanonicalCategoryCode)
        try container.encodeIfPresent(self.productAlternateDisplayPage, forKey: .productAlternateDisplayPage)
        try container.encodeIfPresent(self.productPageTitle, forKey: .productPageTitle)
        try container.encodeIfPresent(self.productThumbnail, forKey: .productThumbnail)
        try container.encodeIfPresent(self.productImage, forKey: .productImage)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.productPrice, precision: 8), forKey: .productPrice)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.productCost, precision: 8), forKey: .productCost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.productWeight, precision: 8), forKey: .productWeight)
        try container.encodeIfPresent(self.productInventory, forKey: .productInventory)
        try container.encodeIfPresent(self.productTaxable, forKey: .productTaxable)
        try container.encodeIfPresent(self.productActive, forKey: .productActive)
        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductInsertResponse.self
    }

    /**
     Getter for Product_Code.

     - Returns:  Optional<String>
     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
    }

    /**
     Getter for Product_SKU.

     - Returns:  Optional<String>
     */
    public func getProductSku() -> Optional<String> {
        return self.productSku
    }

    /**
     Getter for Product_Name.

     - Returns:  Optional<String>
     */
    public func getProductName() -> Optional<String> {
        return self.productName
    }

    /**
     Getter for Product_Description.

     - Returns:  Optional<String>
     */
    public func getProductDescription() -> Optional<String> {
        return self.productDescription
    }

    /**
     Getter for Product_Canonical_Category_Code.

     - Returns:  Optional<String>
     */
    public func getProductCanonicalCategoryCode() -> Optional<String> {
        return self.productCanonicalCategoryCode
    }

    /**
     Getter for Product_Alternate_Display_Page.

     - Returns:  Optional<String>
     */
    public func getProductAlternateDisplayPage() -> Optional<String> {
        return self.productAlternateDisplayPage
    }

    /**
     Getter for Product_Page_Title.

     - Returns:  Optional<String>
     */
    public func getProductPageTitle() -> Optional<String> {
        return self.productPageTitle
    }

    /**
     Getter for Product_Thumbnail.

     - Returns:  Optional<String>
     */
    public func getProductThumbnail() -> Optional<String> {
        return self.productThumbnail
    }

    /**
     Getter for Product_Image.

     - Returns:  Optional<String>
     */
    public func getProductImage() -> Optional<String> {
        return self.productImage
    }

    /**
     Getter for Product_Price.

     - Returns:  Optional<Decimal>
     */
    public func getProductPrice() -> Optional<Decimal> {
        return self.productPrice
    }

    /**
     Getter for Product_Cost.

     - Returns:  Optional<Decimal>
     */
    public func getProductCost() -> Optional<Decimal> {
        return self.productCost
    }

    /**
     Getter for Product_Weight.

     - Returns:  Optional<Decimal>
     */
    public func getProductWeight() -> Optional<Decimal> {
        return self.productWeight
    }

    /**
     Getter for Product_Inventory.

     - Returns:  Optional<Int>
     */
    public func getProductInventory() -> Optional<Int> {
        return self.productInventory
    }

    /**
     Getter for Product_Taxable.

     - Returns:  Optional<Bool>
     */
    public func getProductTaxable() -> Optional<Bool> {
        return self.productTaxable
    }

    /**
     Getter for Product_Active.

     - Returns:  Optional<Bool>
     */
    public func getProductActive() -> Optional<Bool> {
        return self.productActive
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
    }

    /**
     Setter for Product_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductCode(_ value: Optional<String>) -> Self {
        self.productCode = value
        return self
    }

    /**
     Setter for Product_SKU.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductSku(_ value: Optional<String>) -> Self {
        self.productSku = value
        return self
    }

    /**
     Setter for Product_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductName(_ value: Optional<String>) -> Self {
        self.productName = value
        return self
    }

    /**
     Setter for Product_Description.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductDescription(_ value: Optional<String>) -> Self {
        self.productDescription = value
        return self
    }

    /**
     Setter for Product_Canonical_Category_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductCanonicalCategoryCode(_ value: Optional<String>) -> Self {
        self.productCanonicalCategoryCode = value
        return self
    }

    /**
     Setter for Product_Alternate_Display_Page.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductAlternateDisplayPage(_ value: Optional<String>) -> Self {
        self.productAlternateDisplayPage = value
        return self
    }

    /**
     Setter for Product_Page_Title.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductPageTitle(_ value: Optional<String>) -> Self {
        self.productPageTitle = value
        return self
    }

    /**
     Setter for Product_Thumbnail.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductThumbnail(_ value: Optional<String>) -> Self {
        self.productThumbnail = value
        return self
    }

    /**
     Setter for Product_Image.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductImage(_ value: Optional<String>) -> Self {
        self.productImage = value
        return self
    }

    /**
     Setter for Product_Price.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setProductPrice(_ value: Optional<Decimal>) -> Self {
        self.productPrice = value
        return self
    }

    /**
     Setter for Product_Cost.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setProductCost(_ value: Optional<Decimal>) -> Self {
        self.productCost = value
        return self
    }

    /**
     Setter for Product_Weight.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setProductWeight(_ value: Optional<Decimal>) -> Self {
        self.productWeight = value
        return self
    }

    /**
     Setter for Product_Inventory.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductInventory(_ value: Optional<Int>) -> Self {
        self.productInventory = value
        return self
    }

    /**
     Setter for Product_Taxable.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setProductTaxable(_ value: Optional<Bool>) -> Self {
        self.productTaxable = value
        return self
    }

    /**
     Setter for Product_Active.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setProductActive(_ value: Optional<Bool>) -> Self {
        self.productActive = value
        return self
    }
}
