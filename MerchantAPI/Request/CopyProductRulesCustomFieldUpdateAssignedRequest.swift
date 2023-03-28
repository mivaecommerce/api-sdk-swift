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
 Handles API Request CopyProductRulesCustomField_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/copyproductrulescustomfield_update_assigned
 */
public class CopyProductRulesCustomFieldUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CopyProductRulesCustomField_Update_Assigned"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field CopyProductRules_ID.
    var copyProductRulesId : Optional<Int> = nil

    /// Request field CopyProductRules_Name.
    var copyProductRulesName : Optional<String> = nil

    /// Request field Module_Code.
    var moduleCode : Optional<String> = nil

    /// Request field Field_Code.
    var fieldCode : Optional<String> = nil

    /// Request field Assigned.
    var assigned : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case copyProductRulesId = "CopyProductRules_ID"
        case copyProductRulesName = "CopyProductRules_Name"
        case moduleCode = "Module_Code"
        case fieldCode = "Field_Code"
        case assigned = "Assigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - copyProductRule: An optional CopyProductRule instance.
     */
    public init(client: Optional<BaseClient> = nil, copyProductRule: Optional<CopyProductRule> = nil) {
        super.init(client: client)
        if let copyProductRule = copyProductRule {
            if copyProductRule.id > 0 {
                self.copyProductRulesId = copyProductRule.id
            } else if copyProductRule.name.count > 0 {
                self.copyProductRulesName = copyProductRule.name
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

        if self.copyProductRulesId != nil {
            try container.encodeIfPresent(self.copyProductRulesId, forKey: .copyProductRulesId)
        } else if self.copyProductRulesName != nil {
            try container.encode(self.copyProductRulesName, forKey: .copyProductRulesName)
        }

        try container.encodeIfPresent(self.moduleCode, forKey: .moduleCode)
        try container.encodeIfPresent(self.fieldCode, forKey: .fieldCode)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CopyProductRulesCustomFieldUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CopyProductRulesCustomFieldUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CopyProductRulesCustomFieldUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CopyProductRulesCustomFieldUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CopyProductRulesCustomFieldUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CopyProductRulesCustomFieldUpdateAssignedResponse.self
    }

    /**
     Getter for CopyProductRules_ID.

     - Returns:  Optional<Int>
     */
    public func getCopyProductRulesId() -> Optional<Int> {
        return self.copyProductRulesId
    }

    /**
     Getter for CopyProductRules_Name.

     - Returns:  Optional<String>
     */
    public func getCopyProductRulesName() -> Optional<String> {
        return self.copyProductRulesName
    }

    /**
     Getter for Module_Code.

     - Returns:  Optional<String>
     */
    public func getModuleCode() -> Optional<String> {
        return self.moduleCode
    }

    /**
     Getter for Field_Code.

     - Returns:  Optional<String>
     */
    public func getFieldCode() -> Optional<String> {
        return self.fieldCode
    }

    /**
     Getter for Assigned.

     - Returns:  Optional<Bool>
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
    }

    /**
     Setter for CopyProductRules_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyProductRulesId(_ value: Optional<Int>) -> Self {
        self.copyProductRulesId = value
        return self
    }

    /**
     Setter for CopyProductRules_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyProductRulesName(_ value: Optional<String>) -> Self {
        self.copyProductRulesName = value
        return self
    }

    /**
     Setter for Module_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setModuleCode(_ value: Optional<String>) -> Self {
        self.moduleCode = value
        return self
    }

    /**
     Setter for Field_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setFieldCode(_ value: Optional<String>) -> Self {
        self.fieldCode = value
        return self
    }

    /**
     Setter for Assigned.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setAssigned(_ value: Optional<Bool>) -> Self {
        self.assigned = value
        return self
    }
}
