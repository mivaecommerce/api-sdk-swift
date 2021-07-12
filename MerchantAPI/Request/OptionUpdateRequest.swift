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
 Handles API Request Option_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/option_update
 */
public class OptionUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Option_Update"
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

    /// Request field Option_ID.
    var optionId : Optional<Int> = nil

    /// Request field Option_Code.
    var optionCode : Optional<String> = nil

    /// Request field Attribute_ID.
    var attributeId : Optional<Int> = nil

    /// Request field Edit_Attribute.
    var editAttribute : Optional<String> = nil

    /// Request field Attribute_Code.
    var attributeCode : Optional<String> = nil

    /// Request field Code.
    var code : Optional<String> = nil

    /// Request field Prompt.
    var prompt : Optional<String> = nil

    /// Request field Image.
    var image : Optional<String> = nil

    /// Request field Price.
    var price : Optional<Decimal> = nil

    /// Request field Cost.
    var cost : Optional<Decimal> = nil

    /// Request field Weight.
    var weight : Optional<Decimal> = nil

    /// Request field Default.
    var defaultOption : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case productCode = "Product_Code"
        case editProduct = "Edit_Product"
        case optionId = "Option_ID"
        case optionCode = "Option_Code"
        case attributeId = "Attribute_ID"
        case editAttribute = "Edit_Attribute"
        case attributeCode = "Attribute_Code"
        case code = "Code"
        case prompt = "Prompt"
        case image = "Image"
        case price = "Price"
        case cost = "Cost"
        case weight = "Weight"
        case defaultOption = "Default"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - productOption: An optional ProductOption instance.
     */
    public init(client: Optional<BaseClient> = nil, productOption: Optional<ProductOption> = nil) {
        super.init(client: client)
        if let productOption = productOption {
            if productOption.productId > 0 {
                self.productId = productOption.productId
            }

            if productOption.attributeId > 0 {
                self.attributeId = productOption.attributeId
            }

            if productOption.id > 0 {
                self.optionId = productOption.id
            } else if productOption.code.count > 0 {
                self.optionCode = productOption.code
            }

            self.code = productOption.code
            self.prompt = productOption.prompt
            self.image = productOption.image
            self.price = productOption.price
            self.cost = productOption.cost
            self.weight = productOption.weight
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
        }

        if self.attributeId != nil {
            try container.encodeIfPresent(self.attributeId, forKey: .attributeId)
        } else if self.editAttribute != nil {
            try container.encode(self.editAttribute, forKey: .editAttribute)
        } else if self.attributeCode != nil {
            try container.encode(self.attributeCode, forKey: .attributeCode)
        }

        if self.optionId != nil {
            try container.encodeIfPresent(self.optionId, forKey: .optionId)
        } else if self.optionCode != nil {
            try container.encode(self.optionCode, forKey: .optionCode)
        }

        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .cost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .weight)
        try container.encodeIfPresent(self.defaultOption, forKey: .defaultOption)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OptionUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OptionUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OptionUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OptionUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OptionUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OptionUpdateResponse.self
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
     Getter for Option_ID.

     - Returns:  Optional<Int>
     */
    public func getOptionId() -> Optional<Int> {
        return self.optionId
    }

    /**
     Getter for Option_Code.

     - Returns:  Optional<String>
     */
    public func getOptionCode() -> Optional<String> {
        return self.optionCode
    }

    /**
     Getter for Attribute_ID.

     - Returns:  Optional<Int>
     */
    public func getAttributeId() -> Optional<Int> {
        return self.attributeId
    }

    /**
     Getter for Edit_Attribute.

     - Returns:  Optional<String>
     */
    public func getEditAttribute() -> Optional<String> {
        return self.editAttribute
    }

    /**
     Getter for Attribute_Code.

     - Returns:  Optional<String>
     */
    public func getAttributeCode() -> Optional<String> {
        return self.attributeCode
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
     Getter for Default.

     - Returns:  Optional<Bool>
     */
    public func getDefaultOption() -> Optional<Bool> {
        return self.defaultOption
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
     Setter for Option_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setOptionCode(_ value: Optional<String>) -> Self {
        self.optionCode = value
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
     Setter for Edit_Attribute.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditAttribute(_ value: Optional<String>) -> Self {
        self.editAttribute = value
        return self
    }

    /**
     Setter for Attribute_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeCode(_ value: Optional<String>) -> Self {
        self.attributeCode = value
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
     Setter for Default.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setDefaultOption(_ value: Optional<Bool>) -> Self {
        self.defaultOption = value
        return self
    }
}
