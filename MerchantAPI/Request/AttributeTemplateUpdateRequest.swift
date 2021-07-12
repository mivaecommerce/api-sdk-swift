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
 Handles API Request AttributeTemplate_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/attributetemplate_update
 */
public class AttributeTemplateUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AttributeTemplate_Update"
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

    /// Request field Code.
    var code : Optional<String> = nil

    /// Request field Prompt.
    var prompt : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case attributeTemplateId = "AttributeTemplate_ID"
        case attributeTemplateCode = "AttributeTemplate_Code"
        case editAttributeTemplate = "Edit_AttributeTemplate"
        case code = "Code"
        case prompt = "Prompt"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - attributeTemplate: An optional AttributeTemplate instance.
     */
    public init(client: Optional<BaseClient> = nil, attributeTemplate: Optional<AttributeTemplate> = nil) {
        super.init(client: client)
        if let attributeTemplate = attributeTemplate {
            if attributeTemplate.id > 0 {
                self.attributeTemplateId = attributeTemplate.id
            } else if attributeTemplate.code.count > 0 {
                self.attributeTemplateCode = attributeTemplate.code
            } else if attributeTemplate.code.count > 0 {
                self.editAttributeTemplate = attributeTemplate.code
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

        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AttributeTemplateUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AttributeTemplateUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AttributeTemplateUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AttributeTemplateUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AttributeTemplateUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AttributeTemplateUpdateResponse.self
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
}
