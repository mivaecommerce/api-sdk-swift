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
 Handles API Request AttributeTemplateOption_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/attributetemplateoption_insert
 */
public class AttributeTemplateOptionInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AttributeTemplateOption_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field AttributeTemplate_ID.
    var attributeTemplateId : Optional<Int> = nil

    /// Request field AttributeTemplate_Code.
    var attributeTemplateCode : Optional<String> = nil

    /// Request field Edit_AttributeTemplate.
    var editAttributeTemplate : Optional<String> = nil

    /// Request field AttributeTemplateAttribute_ID.
    var attributeTemplateAttributeId : Optional<Int> = nil

    /// Request field AttributeTemplateAttribute_Code.
    var attributeTemplateAttributeCode : Optional<String> = nil

    /// Request field Edit_AttributeTemplateAttribute.
    var editAttributeTemplateAttribute : Optional<String> = nil

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
        case attributeTemplateId = "AttributeTemplate_ID"
        case attributeTemplateCode = "AttributeTemplate_Code"
        case editAttributeTemplate = "Edit_AttributeTemplate"
        case attributeTemplateAttributeId = "AttributeTemplateAttribute_ID"
        case attributeTemplateAttributeCode = "AttributeTemplateAttribute_Code"
        case editAttributeTemplateAttribute = "Edit_AttributeTemplateAttribute"
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
        - attributeTemplateAttribute: An optional AttributeTemplateAttribute instance.
     */
    public init(client: Optional<BaseClient> = nil, attributeTemplateAttribute: Optional<AttributeTemplateAttribute> = nil) {
        super.init(client: client)
        if let attributeTemplateAttribute = attributeTemplateAttribute {
            if attributeTemplateAttribute.id > 0 {
                self.attributeTemplateAttributeId = attributeTemplateAttribute.id
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

        if self.attributeTemplateId != nil {
            try container.encodeIfPresent(self.attributeTemplateId, forKey: .attributeTemplateId)
        } else if self.attributeTemplateCode != nil {
            try container.encode(self.attributeTemplateCode, forKey: .attributeTemplateCode)
        } else if self.editAttributeTemplate != nil {
            try container.encode(self.editAttributeTemplate, forKey: .editAttributeTemplate)
        }

        if self.attributeTemplateAttributeId != nil {
            try container.encodeIfPresent(self.attributeTemplateAttributeId, forKey: .attributeTemplateAttributeId)
        } else if self.attributeTemplateAttributeCode != nil {
            try container.encode(self.attributeTemplateAttributeCode, forKey: .attributeTemplateAttributeCode)
        } else if self.editAttributeTemplateAttribute != nil {
            try container.encode(self.editAttributeTemplateAttribute, forKey: .editAttributeTemplateAttribute)
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
        - callback: The callback function with signature (AttributeTemplateOptionInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AttributeTemplateOptionInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AttributeTemplateOptionInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AttributeTemplateOptionInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AttributeTemplateOptionInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AttributeTemplateOptionInsertResponse.self
    }

    /**
     Getter for AttributeTemplate_ID.

     - Returns:  Optional<Int>
     */
    public func getAttributeTemplateId() -> Optional<Int> {
        return self.attributeTemplateId
    }

    /**
     Getter for AttributeTemplate_Code.

     - Returns:  Optional<String>
     */
    public func getAttributeTemplateCode() -> Optional<String> {
        return self.attributeTemplateCode
    }

    /**
     Getter for Edit_AttributeTemplate.

     - Returns:  Optional<String>
     */
    public func getEditAttributeTemplate() -> Optional<String> {
        return self.editAttributeTemplate
    }

    /**
     Getter for AttributeTemplateAttribute_ID.

     - Returns:  Optional<Int>
     */
    public func getAttributeTemplateAttributeId() -> Optional<Int> {
        return self.attributeTemplateAttributeId
    }

    /**
     Getter for AttributeTemplateAttribute_Code.

     - Returns:  Optional<String>
     */
    public func getAttributeTemplateAttributeCode() -> Optional<String> {
        return self.attributeTemplateAttributeCode
    }

    /**
     Getter for Edit_AttributeTemplateAttribute.

     - Returns:  Optional<String>
     */
    public func getEditAttributeTemplateAttribute() -> Optional<String> {
        return self.editAttributeTemplateAttribute
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
     Setter for AttributeTemplate_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateId(_ value: Optional<Int>) -> Self {
        self.attributeTemplateId = value
        return self
    }

    /**
     Setter for AttributeTemplate_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateCode(_ value: Optional<String>) -> Self {
        self.attributeTemplateCode = value
        return self
    }

    /**
     Setter for Edit_AttributeTemplate.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditAttributeTemplate(_ value: Optional<String>) -> Self {
        self.editAttributeTemplate = value
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
     Setter for AttributeTemplateAttribute_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateAttributeCode(_ value: Optional<String>) -> Self {
        self.attributeTemplateAttributeCode = value
        return self
    }

    /**
     Setter for Edit_AttributeTemplateAttribute.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditAttributeTemplateAttribute(_ value: Optional<String>) -> Self {
        self.editAttributeTemplateAttribute = value
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
