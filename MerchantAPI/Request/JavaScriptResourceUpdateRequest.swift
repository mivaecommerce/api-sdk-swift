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
 Handles API Request JavaScriptResource_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/javascriptresource_update
 */
public class JavaScriptResourceUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "JavaScriptResource_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field JavaScriptResource_ID.
    var javaScriptResourceId : Optional<Int> = nil

    /// Request field Edit_JavaScriptResource.
    var editJavaScriptResource : Optional<String> = nil

    /// Request field JavaScriptResource_Code.
    var javaScriptResourceCode : Optional<String> = nil

    /// Request field JavaScriptResource_Type.
    var javaScriptResourceType : Optional<String> = nil

    /// Request field JavaScriptResource_Global.
    var javaScriptResourceGlobal : Optional<Bool> = nil

    /// Request field JavaScriptResource_Active.
    var javaScriptResourceActive : Optional<Bool> = nil

    /// Request field JavaScriptResource_File_Path.
    var javaScriptResourceFilePath : Optional<String> = nil

    /// Request field JavaScriptResource_Attributes.
    var javaScriptResourceAttributes : [JavaScriptResourceAttribute] = []

    /// Request field JavaScriptResource_Module_Code.
    var javaScriptResourceModuleCode : Optional<String> = nil

    /// Request field JavaScriptResource_Module_Data.
    var javaScriptResourceModuleData : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case javaScriptResourceId = "JavaScriptResource_ID"
        case editJavaScriptResource = "Edit_JavaScriptResource"
        case javaScriptResourceCode = "JavaScriptResource_Code"
        case javaScriptResourceType = "JavaScriptResource_Type"
        case javaScriptResourceGlobal = "JavaScriptResource_Global"
        case javaScriptResourceActive = "JavaScriptResource_Active"
        case javaScriptResourceFilePath = "JavaScriptResource_File_Path"
        case javaScriptResourceAttributes = "JavaScriptResource_Attributes"
        case javaScriptResourceModuleCode = "JavaScriptResource_Module_Code"
        case javaScriptResourceModuleData = "JavaScriptResource_Module_Data"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - javaScriptResource: An optional JavaScriptResource instance.
     */
    public init(client: Optional<BaseClient> = nil, javaScriptResource: Optional<JavaScriptResource> = nil) {
        super.init(client: client)
        if let javaScriptResource = javaScriptResource {
            if javaScriptResource.id > 0 {
                self.javaScriptResourceId = javaScriptResource.id
            } else if javaScriptResource.code.count > 0 {
                self.editJavaScriptResource = javaScriptResource.code
            }

            self.javaScriptResourceCode = javaScriptResource.code
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

        if self.javaScriptResourceId != nil {
            try container.encodeIfPresent(self.javaScriptResourceId, forKey: .javaScriptResourceId)
        } else if self.editJavaScriptResource != nil {
            try container.encode(self.editJavaScriptResource, forKey: .editJavaScriptResource)
        } else if self.javaScriptResourceCode != nil {
            try container.encode(self.javaScriptResourceCode, forKey: .javaScriptResourceCode)
        }

        try container.encodeIfPresent(self.javaScriptResourceCode, forKey: .javaScriptResourceCode)
        try container.encodeIfPresent(self.javaScriptResourceType, forKey: .javaScriptResourceType)
        try container.encodeIfPresent(self.javaScriptResourceGlobal, forKey: .javaScriptResourceGlobal)
        try container.encodeIfPresent(self.javaScriptResourceActive, forKey: .javaScriptResourceActive)
        try container.encodeIfPresent(self.javaScriptResourceFilePath, forKey: .javaScriptResourceFilePath)
        try container.encodeIfPresent(self.javaScriptResourceAttributes, forKey: .javaScriptResourceAttributes)
        try container.encodeIfPresent(self.javaScriptResourceModuleCode, forKey: .javaScriptResourceModuleCode)
        try container.encodeIfPresent(self.javaScriptResourceModuleData, forKey: .javaScriptResourceModuleData)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (JavaScriptResourceUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (JavaScriptResourceUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? JavaScriptResourceUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> JavaScriptResourceUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(JavaScriptResourceUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return JavaScriptResourceUpdateResponse.self
    }

    /**
     Getter for JavaScriptResource_ID.

     - Returns:  Optional<Int>
     */
    public func getJavaScriptResourceId() -> Optional<Int> {
        return self.javaScriptResourceId
    }

    /**
     Getter for Edit_JavaScriptResource.

     - Returns:  Optional<String>
     */
    public func getEditJavaScriptResource() -> Optional<String> {
        return self.editJavaScriptResource
    }

    /**
     Getter for JavaScriptResource_Code.

     - Returns:  Optional<String>
     */
    public func getJavaScriptResourceCode() -> Optional<String> {
        return self.javaScriptResourceCode
    }

    /**
     Getter for JavaScriptResource_Type.

     - Returns:  Optional<String>
     */
    public func getJavaScriptResourceType() -> Optional<String> {
        return self.javaScriptResourceType
    }

    /**
     Enum Getter for JavaScriptResource_Type.

     - Returns:  Optional<JavaScriptResource.ResourceType>
     */
    public func getJavaScriptResourceType() -> Optional<JavaScriptResource.ResourceType> {
        if let v = self.javaScriptResourceType {
            return JavaScriptResource.ResourceType(rawValue: v) ?? nil
        }
        return nil;
    }

    /**
     Getter for JavaScriptResource_Global.

     - Returns:  Optional<Bool>
     */
    public func getJavaScriptResourceGlobal() -> Optional<Bool> {
        return self.javaScriptResourceGlobal
    }

    /**
     Getter for JavaScriptResource_Active.

     - Returns:  Optional<Bool>
     */
    public func getJavaScriptResourceActive() -> Optional<Bool> {
        return self.javaScriptResourceActive
    }

    /**
     Getter for JavaScriptResource_File_Path.

     - Returns:  Optional<String>
     */
    public func getJavaScriptResourceFilePath() -> Optional<String> {
        return self.javaScriptResourceFilePath
    }

    /**
     Getter for JavaScriptResource_Attributes.

     - Returns:  [JavaScriptResourceAttribute]
     */
    public func getJavaScriptResourceAttributes() -> [JavaScriptResourceAttribute] {
        return self.javaScriptResourceAttributes
    }

    /**
     Getter for JavaScriptResource_Module_Code.

     - Returns:  Optional<String>
     */
    public func getJavaScriptResourceModuleCode() -> Optional<String> {
        return self.javaScriptResourceModuleCode
    }

    /**
     Getter for JavaScriptResource_Module_Data.

     - Returns:  Optional<String>
     */
    public func getJavaScriptResourceModuleData() -> Optional<String> {
        return self.javaScriptResourceModuleData
    }

    /**
     Setter for JavaScriptResource_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceId(_ value: Optional<Int>) -> Self {
        self.javaScriptResourceId = value
        return self
    }

    /**
     Setter for Edit_JavaScriptResource.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditJavaScriptResource(_ value: Optional<String>) -> Self {
        self.editJavaScriptResource = value
        return self
    }

    /**
     Setter for JavaScriptResource_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceCode(_ value: Optional<String>) -> Self {
        self.javaScriptResourceCode = value
        return self
    }

    /**
     Setter for JavaScriptResource_Type.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceType(_ value: Optional<String>) -> Self {
        self.javaScriptResourceType = value
        return self
    }

    /**
     Enum Setter for JavaScriptResource_Type.

     - Parameters:
        - value: JavaScriptResource.ResourceType
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceType(_ value: JavaScriptResource.ResourceType) -> Self {
        self.javaScriptResourceType = value.rawValue
        return self
    }

    /**
     Setter for JavaScriptResource_Global.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceGlobal(_ value: Optional<Bool>) -> Self {
        self.javaScriptResourceGlobal = value
        return self
    }

    /**
     Setter for JavaScriptResource_Active.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceActive(_ value: Optional<Bool>) -> Self {
        self.javaScriptResourceActive = value
        return self
    }

    /**
     Setter for JavaScriptResource_File_Path.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceFilePath(_ value: Optional<String>) -> Self {
        self.javaScriptResourceFilePath = value
        return self
    }

    /**
     Setter for JavaScriptResource_Module_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceModuleCode(_ value: Optional<String>) -> Self {
        self.javaScriptResourceModuleCode = value
        return self
    }

    /**
     Setter for JavaScriptResource_Module_Data.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceModuleData(_ value: Optional<String>) -> Self {
        self.javaScriptResourceModuleData = value
        return self
    }

    /**
     Add a JavaScriptResourceAttribute.

     - Parameters:
        - javaScriptResourceAttribute: JavaScriptResourceAttribute
     - Returns: Self
     */
    @discardableResult
    public func addJavaScriptResourceAttribute(_ javaScriptResourceAttribute : JavaScriptResourceAttribute) -> Self {
        self.javaScriptResourceAttributes.append(javaScriptResourceAttribute)
        return self
    }

    /**
     Add an array of JavaScriptResourceAttribute.

     - Parameters:
        - javaScriptResourceAttributes: [JavaScriptResourceAttribute]
     - Returns: Self
     */
    @discardableResult
    public func addJavaScriptResourceAttributes(_ javaScriptResourceAttributes: [JavaScriptResourceAttribute]) -> Self {
        for j in javaScriptResourceAttributes {
            self.javaScriptResourceAttributes.append(j);
        }

        return self
    }
}
