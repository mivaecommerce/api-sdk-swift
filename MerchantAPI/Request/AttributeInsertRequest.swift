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
 Handles API Request Attribute_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/attribute_insert
 */
public class AttributeInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Attribute_Insert"
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

    /// Request field Code.
    var code : Optional<String> = nil

    /// Request field Prompt.
    var prompt : Optional<String> = nil

    /// Request field Type.
    var type : Optional<String> = nil

    /// Request field Image.
    var image : Optional<String> = nil

    /// Request field Price.
    var price : Optional<Decimal> = nil

    /// Request field Cost.
    var cost : Optional<Decimal> = nil

    /// Request field Weight.
    var weight : Optional<Decimal> = nil

    /// Request field Copy.
    var copy : Optional<Bool> = nil

    /// Request field Required.
    var required : Optional<Bool> = nil

    /// Request field Inventory.
    var inventory : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case productCode = "Product_Code"
        case editProduct = "Edit_Product"
        case code = "Code"
        case prompt = "Prompt"
        case type = "Type"
        case image = "Image"
        case price = "Price"
        case cost = "Cost"
        case weight = "Weight"
        case copy = "Copy"
        case required = "Required"
        case inventory = "Inventory"
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

            self.productCode = product.code
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
        }

        try container.encodeIfPresent(self.productCode, forKey: .productCode)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: 8), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: 8), forKey: .cost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: 8), forKey: .weight)
        try container.encodeIfPresent(self.copy, forKey: .copy)
        try container.encodeIfPresent(self.required, forKey: .required)
        try container.encodeIfPresent(self.inventory, forKey: .inventory)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AttributeInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AttributeInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AttributeInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AttributeInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AttributeInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AttributeInsertResponse.self
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
     Getter for Code.

     - Returns:  Optional<String>
     */
    public func getCode() -> Optional<String> {
        return self.code
    }

    /**
     Getter for Prompt.

     - Returns:  Optional<String>
     */
    public func getPrompt() -> Optional<String> {
        return self.prompt
    }

    /**
     Getter for Type.

     - Returns:  Optional<String>
     */
    public func getType() -> Optional<String> {
        return self.type
    }

    /**
     Enum Getter for Type.

     - Returns:  Optional<ProductAttribute.ProductAttributeType>
     */
    public func getType() -> Optional<ProductAttribute.ProductAttributeType> {
        if let v = self.type {
            return ProductAttribute.ProductAttributeType(rawValue: v) ?? nil
        }
        return nil;
    }

    /**
     Getter for Image.

     - Returns:  Optional<String>
     */
    public func getImage() -> Optional<String> {
        return self.image
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
     Getter for Copy.

     - Returns:  Optional<Bool>
     */
    public func getCopy() -> Optional<Bool> {
        return self.copy
    }

    /**
     Getter for Required.

     - Returns:  Optional<Bool>
     */
    public func getRequired() -> Optional<Bool> {
        return self.required
    }

    /**
     Getter for Inventory.

     - Returns:  Optional<Bool>
     */
    public func getInventory() -> Optional<Bool> {
        return self.inventory
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
     Setter for Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCode(_ value: Optional<String>) -> Self {
        self.code = value
        return self
    }

    /**
     Setter for Prompt.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPrompt(_ value: Optional<String>) -> Self {
        self.prompt = value
        return self
    }

    /**
     Setter for Type.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setType(_ value: Optional<String>) -> Self {
        self.type = value
        return self
    }

    /**
     Enum Setter for Type.

     - Parameters:
        - value: ProductAttribute.ProductAttributeType
     - Returns:  Self
     */
    @discardableResult
    public func setType(_ value: ProductAttribute.ProductAttributeType) -> Self {
        self.type = value.rawValue
        return self
    }

    /**
     Setter for Image.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setImage(_ value: Optional<String>) -> Self {
        self.image = value
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

    /**
     Setter for Copy.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCopy(_ value: Optional<Bool>) -> Self {
        self.copy = value
        return self
    }

    /**
     Setter for Required.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setRequired(_ value: Optional<Bool>) -> Self {
        self.required = value
        return self
    }

    /**
     Setter for Inventory.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setInventory(_ value: Optional<Bool>) -> Self {
        self.inventory = value
        return self
    }
}
