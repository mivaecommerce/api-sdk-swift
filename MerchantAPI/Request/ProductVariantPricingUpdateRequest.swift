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
 Handles API Request ProductVariantPricing_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/productvariantpricing_update
 */
public class ProductVariantPricingUpdateRequest : Request {

    /// Enumeration VariantPricingMethod
    public enum VariantPricingMethod : String {
        case Master = "master"
        case Specific = "specific"
        case Sum = "sum"
    }

    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductVariantPricing_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Product_ID.
    var productId : Optional<Int> = nil

    /// Request field Edit_Product.
    var editProduct : Optional<String> = nil

    /// Request field Product_Code.
    var productCode : Optional<String> = nil

    /// Request field Product_SKU.
    var productSku : Optional<String> = nil

    /// Request field Variant_ID.
    var variantId : Optional<Int> = nil

    /// Request field Method.
    var method : Optional<String> = nil

    /// Request field Price.
    var price : Optional<Decimal> = nil

    /// Request field Cost.
    var cost : Optional<Decimal> = nil

    /// Request field Weight.
    var weight : Optional<Decimal> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case editProduct = "Edit_Product"
        case productCode = "Product_Code"
        case productSku = "Product_SKU"
        case variantId = "Variant_ID"
        case method = "Method"
        case price = "Price"
        case cost = "Cost"
        case weight = "Weight"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - product: An optional Product instance.
     */
    public init(client: Optional<BaseClient> = nil, product: Optional<Product> = nil) {
        super.init(client: client)
        if let product = product {
            if product.id > 0 {
                self.productId = product.id
            } else if product.code.count > 0 {
                self.editProduct = product.code
            } else if product.sku.count > 0 {
                self.productSku = product.sku
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

        if self.productId != nil {
            try container.encodeIfPresent(self.productId, forKey: .productId)
        } else if self.editProduct != nil {
            try container.encode(self.editProduct, forKey: .editProduct)
        } else if self.productCode != nil {
            try container.encode(self.productCode, forKey: .productCode)
        } else if self.productSku != nil {
            try container.encode(self.productSku, forKey: .productSku)
        }

        try container.encodeIfPresent(self.variantId, forKey: .variantId)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: 8), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: 8), forKey: .cost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: 8), forKey: .weight)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductVariantPricingUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductVariantPricingUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductVariantPricingUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductVariantPricingUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductVariantPricingUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductVariantPricingUpdateResponse.self
    }

    /**
     Getter for Product_ID.

     - Returns:  Optional<Int>
     */
    public func getProductId() -> Optional<Int> {
        return self.productId
    }

    /**
     Getter for Edit_Product.

     - Returns:  Optional<String>
     */
    public func getEditProduct() -> Optional<String> {
        return self.editProduct
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
     Getter for Variant_ID.

     - Returns:  Optional<Int>
     */
    public func getVariantId() -> Optional<Int> {
        return self.variantId
    }

    /**
     Getter for Method.

     - Returns:  Optional<String>
     */
    public func getMethod() -> Optional<String> {
        return self.method
    }

    /**
     Enum Getter for Method.

     - Returns:  Optional<VariantPricingMethod>
     */
    public func getMethod() -> Optional<VariantPricingMethod> {
        if let v = self.method {
            return VariantPricingMethod(rawValue: v) ?? nil
        }
        return nil;
    }

    /**
     Getter for Price.

     - Returns:  Optional<Decimal>
     */
    public func getPrice() -> Optional<Decimal> {
        return self.price
    }

    /**
     Getter for Cost.

     - Returns:  Optional<Decimal>
     */
    public func getCost() -> Optional<Decimal> {
        return self.cost
    }

    /**
     Getter for Weight.

     - Returns:  Optional<Decimal>
     */
    public func getWeight() -> Optional<Decimal> {
        return self.weight
    }

    /**
     Setter for Product_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductId(_ value: Optional<Int>) -> Self {
        self.productId = value
        return self
    }

    /**
     Setter for Edit_Product.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditProduct(_ value: Optional<String>) -> Self {
        self.editProduct = value
        return self
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
     Setter for Variant_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setVariantId(_ value: Optional<Int>) -> Self {
        self.variantId = value
        return self
    }

    /**
     Setter for Method.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setMethod(_ value: Optional<String>) -> Self {
        self.method = value
        return self
    }

    /**
     Enum Setter for Method.

     - Parameters:
        - value: VariantPricingMethod
     - Returns:  Self
     */
    @discardableResult
    public func setMethod(_ value: VariantPricingMethod) -> Self {
        self.method = value.rawValue
        return self
    }

    /**
     Setter for Price.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setPrice(_ value: Optional<Decimal>) -> Self {
        self.price = value
        return self
    }

    /**
     Setter for Cost.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setCost(_ value: Optional<Decimal>) -> Self {
        self.cost = value
        return self
    }

    /**
     Setter for Weight.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setWeight(_ value: Optional<Decimal>) -> Self {
        self.weight = value
        return self
    }
}
