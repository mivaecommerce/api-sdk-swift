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
 Handles API Request AttributeTemplateOption_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/attributetemplateoption_delete
 */
public class AttributeTemplateOptionDeleteRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AttributeTemplateOption_Delete"
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

    /// Request field AttributeTemplateOption_ID.
    var attributeTemplateOptionId : Optional<Int> = nil

    /// Request field AttributeTemplateOption_Code.
    var attributeTemplateOptionCode : Optional<String> = nil

    /// Request field Edit_AttributeTemplateOption.
    var editAttributeTemplateOption : Optional<String> = nil

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
        case attributeTemplateOptionId = "AttributeTemplateOption_ID"
        case attributeTemplateOptionCode = "AttributeTemplateOption_Code"
        case editAttributeTemplateOption = "Edit_AttributeTemplateOption"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - attributeTemplateOption: An optional AttributeTemplateOption instance.
     */
    public init(client: Optional<BaseClient> = nil, attributeTemplateOption: Optional<AttributeTemplateOption> = nil) {
        super.init(client: client)
        if let attributeTemplateOption = attributeTemplateOption {
            if attributeTemplateOption.id > 0 {
                self.attributeTemplateOptionId = attributeTemplateOption.id
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

        if self.attributeTemplateOptionId != nil {
            try container.encodeIfPresent(self.attributeTemplateOptionId, forKey: .attributeTemplateOptionId)
        } else if self.attributeTemplateOptionCode != nil {
            try container.encode(self.attributeTemplateOptionCode, forKey: .attributeTemplateOptionCode)
        } else if self.editAttributeTemplateOption != nil {
            try container.encode(self.editAttributeTemplateOption, forKey: .editAttributeTemplateOption)
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AttributeTemplateOptionDeleteResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AttributeTemplateOptionDeleteResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AttributeTemplateOptionDeleteResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AttributeTemplateOptionDeleteResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AttributeTemplateOptionDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AttributeTemplateOptionDeleteResponse.self
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
     Getter for AttributeTemplateOption_ID.

     - Returns:  Optional<Int>
     */
    public func getAttributeTemplateOptionId() -> Optional<Int> {
        return self.attributeTemplateOptionId
    }

    /**
     Getter for AttributeTemplateOption_Code.

     - Returns:  Optional<String>
     */
    public func getAttributeTemplateOptionCode() -> Optional<String> {
        return self.attributeTemplateOptionCode
    }

    /**
     Getter for Edit_AttributeTemplateOption.

     - Returns:  Optional<String>
     */
    public func getEditAttributeTemplateOption() -> Optional<String> {
        return self.editAttributeTemplateOption
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
     Setter for AttributeTemplateOption_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateOptionId(_ value: Optional<Int>) -> Self {
        self.attributeTemplateOptionId = value
        return self
    }

    /**
     Setter for AttributeTemplateOption_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateOptionCode(_ value: Optional<String>) -> Self {
        self.attributeTemplateOptionCode = value
        return self
    }

    /**
     Setter for Edit_AttributeTemplateOption.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditAttributeTemplateOption(_ value: Optional<String>) -> Self {
        self.editAttributeTemplateOption = value
        return self
    }
}
