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
 Handles API Request CSSResource_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/cssresource_update
 */
public class CSSResourceUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CSSResource_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field CSSResource_ID.
    var CSSResourceId : Optional<Int> = nil

    /// Request field Edit_CSSResource.
    var editCSSResource : Optional<String> = nil

    /// Request field CSSResource_Code.
    var CSSResourceCode : Optional<String> = nil

    /// Request field CSSResource_Global.
    var CSSResourceGlobal : Optional<Bool> = nil

    /// Request field CSSResource_Active.
    var CSSResourceActive : Optional<Bool> = nil

    /// Request field CSSResource_File_Path.
    var CSSResourceFilePath : Optional<String> = nil

    /// Request field CSSResource_Attributes.
    var CSSResourceAttributes : [CSSResourceAttribute] = []

    /// Request field CSSResource_Module_Code.
    var CSSResourceModuleCode : Optional<String> = nil

    /// Request field CSSResource_Module_Data.
    var CSSResourceModuleData : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case CSSResourceId = "CSSResource_ID"
        case editCSSResource = "Edit_CSSResource"
        case CSSResourceCode = "CSSResource_Code"
        case CSSResourceGlobal = "CSSResource_Global"
        case CSSResourceActive = "CSSResource_Active"
        case CSSResourceFilePath = "CSSResource_File_Path"
        case CSSResourceAttributes = "CSSResource_Attributes"
        case CSSResourceModuleCode = "CSSResource_Module_Code"
        case CSSResourceModuleData = "CSSResource_Module_Data"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - CSSResource: An optional CSSResource instance.
     */
    public init(client: Optional<BaseClient> = nil, CSSResource: Optional<CSSResource> = nil) {
        super.init(client: client)
        if let CSSResource = CSSResource {
            if CSSResource.id > 0 {
                self.CSSResourceId = CSSResource.id
            } else if CSSResource.code.count > 0 {
                self.editCSSResource = CSSResource.code
            }

            self.CSSResourceCode = CSSResource.code
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

        if self.CSSResourceId != nil {
            try container.encodeIfPresent(self.CSSResourceId, forKey: .CSSResourceId)
        } else if self.editCSSResource != nil {
            try container.encode(self.editCSSResource, forKey: .editCSSResource)
        } else if self.CSSResourceCode != nil {
            try container.encode(self.CSSResourceCode, forKey: .CSSResourceCode)
        }

        try container.encodeIfPresent(self.CSSResourceCode, forKey: .CSSResourceCode)
        try container.encodeIfPresent(self.CSSResourceGlobal, forKey: .CSSResourceGlobal)
        try container.encodeIfPresent(self.CSSResourceActive, forKey: .CSSResourceActive)
        try container.encodeIfPresent(self.CSSResourceFilePath, forKey: .CSSResourceFilePath)
        try container.encodeIfPresent(self.CSSResourceAttributes, forKey: .CSSResourceAttributes)
        try container.encodeIfPresent(self.CSSResourceModuleCode, forKey: .CSSResourceModuleCode)
        try container.encodeIfPresent(self.CSSResourceModuleData, forKey: .CSSResourceModuleData)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CSSResourceUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CSSResourceUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CSSResourceUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CSSResourceUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CSSResourceUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CSSResourceUpdateResponse.self
    }

    /**
     Getter for CSSResource_ID.

     - Returns:  Optional<Int>
     */
    public func getCSSResourceId() -> Optional<Int> {
        return self.CSSResourceId
    }

    /**
     Getter for Edit_CSSResource.

     - Returns:  Optional<String>
     */
    public func getEditCSSResource() -> Optional<String> {
        return self.editCSSResource
    }

    /**
     Getter for CSSResource_Code.

     - Returns:  Optional<String>
     */
    public func getCSSResourceCode() -> Optional<String> {
        return self.CSSResourceCode
    }

    /**
     Getter for CSSResource_Global.

     - Returns:  Optional<Bool>
     */
    public func getCSSResourceGlobal() -> Optional<Bool> {
        return self.CSSResourceGlobal
    }

    /**
     Getter for CSSResource_Active.

     - Returns:  Optional<Bool>
     */
    public func getCSSResourceActive() -> Optional<Bool> {
        return self.CSSResourceActive
    }

    /**
     Getter for CSSResource_File_Path.

     - Returns:  Optional<String>
     */
    public func getCSSResourceFilePath() -> Optional<String> {
        return self.CSSResourceFilePath
    }

    /**
     Getter for CSSResource_Attributes.

     - Returns:  [CSSResourceAttribute]
     */
    public func getCSSResourceAttributes() -> [CSSResourceAttribute] {
        return self.CSSResourceAttributes
    }

    /**
     Getter for CSSResource_Module_Code.

     - Returns:  Optional<String>
     */
    public func getCSSResourceModuleCode() -> Optional<String> {
        return self.CSSResourceModuleCode
    }

    /**
     Getter for CSSResource_Module_Data.

     - Returns:  Optional<String>
     */
    public func getCSSResourceModuleData() -> Optional<String> {
        return self.CSSResourceModuleData
    }

    /**
     Setter for CSSResource_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceId(_ value: Optional<Int>) -> Self {
        self.CSSResourceId = value
        return self
    }

    /**
     Setter for Edit_CSSResource.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditCSSResource(_ value: Optional<String>) -> Self {
        self.editCSSResource = value
        return self
    }

    /**
     Setter for CSSResource_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceCode(_ value: Optional<String>) -> Self {
        self.CSSResourceCode = value
        return self
    }

    /**
     Setter for CSSResource_Global.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceGlobal(_ value: Optional<Bool>) -> Self {
        self.CSSResourceGlobal = value
        return self
    }

    /**
     Setter for CSSResource_Active.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceActive(_ value: Optional<Bool>) -> Self {
        self.CSSResourceActive = value
        return self
    }

    /**
     Setter for CSSResource_File_Path.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceFilePath(_ value: Optional<String>) -> Self {
        self.CSSResourceFilePath = value
        return self
    }

    /**
     Setter for CSSResource_Module_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceModuleCode(_ value: Optional<String>) -> Self {
        self.CSSResourceModuleCode = value
        return self
    }

    /**
     Setter for CSSResource_Module_Data.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceModuleData(_ value: Optional<String>) -> Self {
        self.CSSResourceModuleData = value
        return self
    }

    /**
     Add a CSSResourceAttribute.

     - Parameters:
        - CSSResourceAttribute: CSSResourceAttribute
     - Returns: Self
     */
    @discardableResult
    public func addCSSResourceAttribute(_ CSSResourceAttribute : CSSResourceAttribute) -> Self {
        self.CSSResourceAttributes.append(CSSResourceAttribute)
        return self
    }

    /**
     Add an array of CSSResourceAttribute.

     - Parameters:
        - CSSResourceAttributes: [CSSResourceAttribute]
     - Returns: Self
     */
    @discardableResult
    public func addCSSResourceAttributes(_ CSSResourceAttributes: [CSSResourceAttribute]) -> Self {
        for C in CSSResourceAttributes {
            self.CSSResourceAttributes.append(C);
        }

        return self
    }
}
