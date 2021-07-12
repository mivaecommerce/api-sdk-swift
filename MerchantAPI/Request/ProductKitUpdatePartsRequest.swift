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
 Handles API Request ProductKit_Update_Parts.

 - SeeAlso: https://docs.miva.com/json-api/functions/productkit_update_parts
 */
public class ProductKitUpdatePartsRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductKit_Update_Parts"
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

    /// Request field Attribute_ID.
    var attributeId : Optional<Int> = nil

    /// Request field AttributeTemplateAttribute_ID.
    var attributeTemplateAttributeId : Optional<Int> = nil

    /// Request field Option_ID.
    var optionId : Optional<Int> = nil

    /// Request field Parts.
    var parts : [KitPart] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case productCode = "Product_Code"
        case editProduct = "Edit_Product"
        case attributeId = "Attribute_ID"
        case attributeTemplateAttributeId = "AttributeTemplateAttribute_ID"
        case optionId = "Option_ID"
        case parts = "Parts"
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

        if self.attributeId != nil {
            try container.encodeIfPresent(self.attributeId, forKey: .attributeId)
        }

        if self.attributeTemplateAttributeId != nil {
            try container.encodeIfPresent(self.attributeTemplateAttributeId, forKey: .attributeTemplateAttributeId)
        }

        if self.optionId != nil {
            try container.encodeIfPresent(self.optionId, forKey: .optionId)
        }

        try container.encodeIfPresent(self.parts, forKey: .parts)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductKitUpdatePartsResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductKitUpdatePartsResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductKitUpdatePartsResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductKitUpdatePartsResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductKitUpdatePartsResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductKitUpdatePartsResponse.self
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
     Getter for Attribute_ID.

     - Returns:  Optional<Int>
     */
    public func getAttributeId() -> Optional<Int> {
        return self.attributeId
    }

    /**
     Getter for AttributeTemplateAttribute_ID.

     - Returns:  Optional<Int>
     */
    public func getAttributeTemplateAttributeId() -> Optional<Int> {
        return self.attributeTemplateAttributeId
    }

    /**
     Getter for Option_ID.

     - Returns:  Optional<Int>
     */
    public func getOptionId() -> Optional<Int> {
        return self.optionId
    }

    /**
     Getter for Parts.

     - Returns:  [KitPart]
     */
    public func getParts() -> [KitPart] {
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
     Setter for Attribute_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeId(_ value: Optional<Int>) -> Self {
        self.attributeId = value
        return self
    }

    /**
     Setter for AttributeTemplateAttribute_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateAttributeId(_ value: Optional<Int>) -> Self {
        self.attributeTemplateAttributeId = value
        return self
    }

    /**
     Setter for Option_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOptionId(_ value: Optional<Int>) -> Self {
        self.optionId = value
        return self
    }

    /**
     Add a KitPart.

     - Parameters:
        - kitPart: KitPart
     - Returns: Self
     */
    @discardableResult
    public func addKitPart(_ kitPart : KitPart) -> Self {
        self.parts.append(kitPart)
        return self
    }

    /**
     Add an array of KitPart.

     - Parameters:
        - parts: [KitPart]
     - Returns: Self
     */
    @discardableResult
    public func addParts(_ parts: [KitPart]) -> Self {
        for p in parts {
            self.parts.append(p);
        }

        return self
    }
}
