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
 Handles API Request ProductVariantList_Load_Product.

 - SeeAlso: https://docs.miva.com/json-api/functions/productvariantlist_load_product
 */
public class ProductVariantListLoadProductRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductVariantList_Load_Product"
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

    /// Request field Product_Code.
    var productCode : Optional<String> = nil

    /// Request field Edit_Product.
    var editProduct : Optional<String> = nil

    /// Request field Product_SKU.
    var productSku : Optional<String> = nil

    /// Request field Include_Default_Variant.
    var includeDefaultVariant : Optional<Bool> = nil

    /// Request field Limits.
    var limits : [ProductVariantLimit] = []

    /// Request field Exclusions.
    var exclusions : [ProductVariantExclusion] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case productCode = "Product_Code"
        case editProduct = "Edit_Product"
        case productSku = "Product_SKU"
        case includeDefaultVariant = "Include_Default_Variant"
        case limits = "Limits"
        case exclusions = "Exclusions"
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
        } else if self.productCode != nil {
            try container.encode(self.productCode, forKey: .productCode)
        } else if self.editProduct != nil {
            try container.encode(self.editProduct, forKey: .editProduct)
        } else if self.productSku != nil {
            try container.encode(self.productSku, forKey: .productSku)
        }

        try container.encodeIfPresent(self.includeDefaultVariant, forKey: .includeDefaultVariant)
        try container.encodeIfPresent(self.limits, forKey: .limits)
        try container.encodeIfPresent(self.exclusions, forKey: .exclusions)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductVariantListLoadProductResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductVariantListLoadProductResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductVariantListLoadProductResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductVariantListLoadProductResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductVariantListLoadProductResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductVariantListLoadProductResponse.self
    }

    /**
     Getter for Product_ID.

     - Returns:  Optional<Int>
     */
    public func getProductId() -> Optional<Int> {
        return self.productId
    }

    /**
     Getter for Product_Code.

     - Returns:  Optional<String>
     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
    }

    /**
     Getter for Edit_Product.

     - Returns:  Optional<String>
     */
    public func getEditProduct() -> Optional<String> {
        return self.editProduct
    }

    /**
     Getter for Product_SKU.

     - Returns:  Optional<String>
     */
    public func getProductSku() -> Optional<String> {
        return self.productSku
    }

    /**
     Getter for Include_Default_Variant.

     - Returns:  Optional<Bool>
     */
    public func getIncludeDefaultVariant() -> Optional<Bool> {
        return self.includeDefaultVariant
    }

    /**
     Getter for Limits.

     - Returns:  [ProductVariantLimit]
     */
    public func getLimits() -> [ProductVariantLimit] {
        return self.limits
    }

    /**
     Getter for Exclusions.

     - Returns:  [ProductVariantExclusion]
     */
    public func getExclusions() -> [ProductVariantExclusion] {
        return self.exclusions
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
     Setter for Include_Default_Variant.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setIncludeDefaultVariant(_ value: Optional<Bool>) -> Self {
        self.includeDefaultVariant = value
        return self
    }

    /**
     Add a ProductVariantLimit.

     - Parameters:
        - limit: ProductVariantLimit
     - Returns: Self
     */
    @discardableResult
    public func addLimit(_ limit : ProductVariantLimit) -> Self {
        self.limits.append(limit)
        return self
    }

    /**
     Add an array of ProductVariantLimit.

     - Parameters:
        - limits: [ProductVariantLimit]
     - Returns: Self
     */
    @discardableResult
    public func addLimits(_ limits: [ProductVariantLimit]) -> Self {
        for l in limits {
            self.limits.append(l);
        }

        return self
    }

    /**
     Add a ProductVariantExclusion.

     - Parameters:
        - exclusion: ProductVariantExclusion
     - Returns: Self
     */
    @discardableResult
    public func addExclusion(_ exclusion : ProductVariantExclusion) -> Self {
        self.exclusions.append(exclusion)
        return self
    }

    /**
     Add an array of ProductVariantExclusion.

     - Parameters:
        - exclusions: [ProductVariantExclusion]
     - Returns: Self
     */
    @discardableResult
    public func addExclusions(_ exclusions: [ProductVariantExclusion]) -> Self {
        for e in exclusions {
            self.exclusions.append(e);
        }

        return self
    }
}
