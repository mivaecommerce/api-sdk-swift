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
 Handles API Request ProductVariant_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/productvariant_update
 */
public class ProductVariantUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductVariant_Update"
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

    /// Request field Variant_ID.
    var variantId : Optional<Int> = nil

    /// Request field Attributes.
    var attributes : [VariantAttribute] = []

    /// Request field Parts.
    var parts : [VariantPart] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case productCode = "Product_Code"
        case editProduct = "Edit_Product"
        case variantId = "Variant_ID"
        case attributes = "Attributes"
        case parts = "Parts"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - productVariant: An optional ProductVariant instance.
     */
    public init(client: Optional<BaseClient> = nil, productVariant: Optional<ProductVariant> = nil) {
        super.init(client: client)
        if let productVariant = productVariant {
            if productVariant.productId > 0 {
                self.productId = productVariant.productId
            }

            if productVariant.variantId > 0 {
                self.variantId = productVariant.variantId
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
        }

        if self.variantId != nil {
            try container.encodeIfPresent(self.variantId, forKey: .variantId)
        }

        try container.encodeIfPresent(self.attributes, forKey: .attributes)
        try container.encodeIfPresent(self.parts, forKey: .parts)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductVariantUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductVariantUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductVariantUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductVariantUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductVariantUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductVariantUpdateResponse.self
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
     Getter for Variant_ID.

     - Returns:  Optional<Int>
     */
    public func getVariantId() -> Optional<Int> {
        return self.variantId
    }

    /**
     Getter for Attributes.

     - Returns:  [VariantAttribute]
     */
    public func getAttributes() -> [VariantAttribute] {
        return self.attributes
    }

    /**
     Getter for Parts.

     - Returns:  [VariantPart]
     */
    public func getParts() -> [VariantPart] {
        return self.parts
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
     Add a VariantAttribute.

     - Parameters:
        - variantAttribute: VariantAttribute
     - Returns: Self
     */
    @discardableResult
    public func addVariantAttribute(_ variantAttribute : VariantAttribute) -> Self {
        self.attributes.append(variantAttribute)
        return self
    }

    /**
     Add an array of VariantAttribute.

     - Parameters:
        - attributes: [VariantAttribute]
     - Returns: Self
     */
    @discardableResult
    public func addAttributes(_ attributes: [VariantAttribute]) -> Self {
        for a in attributes {
            self.attributes.append(a);
        }

        return self
    }

    /**
     Add a VariantPart.

     - Parameters:
        - variantPart: VariantPart
     - Returns: Self
     */
    @discardableResult
    public func addVariantPart(_ variantPart : VariantPart) -> Self {
        self.parts.append(variantPart)
        return self
    }

    /**
     Add an array of VariantPart.

     - Parameters:
        - parts: [VariantPart]
     - Returns: Self
     */
    @discardableResult
    public func addParts(_ parts: [VariantPart]) -> Self {
        for p in parts {
            self.parts.append(p);
        }

        return self
    }
}
