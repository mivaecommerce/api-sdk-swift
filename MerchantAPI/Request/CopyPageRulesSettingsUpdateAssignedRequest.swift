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
 Handles API Request CopyPageRulesSettings_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/copypagerulessettings_update_assigned
 */
public class CopyPageRulesSettingsUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CopyPageRulesSettings_Update_Assigned"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field CopyPageRules_ID.
    var copyPageRulesId : Optional<Int> = nil

    /// Request field CopyPageRules_Name.
    var copyPageRulesName : Optional<String> = nil

    /// Request field Item_Code.
    var itemCode : Optional<String> = nil

    /// Request field Assigned.
    var assigned : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case copyPageRulesId = "CopyPageRules_ID"
        case copyPageRulesName = "CopyPageRules_Name"
        case itemCode = "Item_Code"
        case assigned = "Assigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - copyPageRule: An optional CopyPageRule instance.
     */
    public init(client: Optional<BaseClient> = nil, copyPageRule: Optional<CopyPageRule> = nil) {
        super.init(client: client)
        if let copyPageRule = copyPageRule {
            if copyPageRule.id > 0 {
                self.copyPageRulesId = copyPageRule.id
            } else if copyPageRule.name.count > 0 {
                self.copyPageRulesName = copyPageRule.name
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

        if self.copyPageRulesId != nil {
            try container.encodeIfPresent(self.copyPageRulesId, forKey: .copyPageRulesId)
        } else if self.copyPageRulesName != nil {
            try container.encode(self.copyPageRulesName, forKey: .copyPageRulesName)
        }

        try container.encodeIfPresent(self.itemCode, forKey: .itemCode)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CopyPageRulesSettingsUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CopyPageRulesSettingsUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CopyPageRulesSettingsUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CopyPageRulesSettingsUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CopyPageRulesSettingsUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CopyPageRulesSettingsUpdateAssignedResponse.self
    }

    /**
     Getter for CopyPageRules_ID.

     - Returns:  Optional<Int>
     */
    public func getCopyPageRulesId() -> Optional<Int> {
        return self.copyPageRulesId
    }

    /**
     Getter for CopyPageRules_Name.

     - Returns:  Optional<String>
     */
    public func getCopyPageRulesName() -> Optional<String> {
        return self.copyPageRulesName
    }

    /**
     Getter for Item_Code.

     - Returns:  Optional<String>
     */
    public func getItemCode() -> Optional<String> {
        return self.itemCode
    }

    /**
     Getter for Assigned.

     - Returns:  Optional<Bool>
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
    }

    /**
     Setter for CopyPageRules_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyPageRulesId(_ value: Optional<Int>) -> Self {
        self.copyPageRulesId = value
        return self
    }

    /**
     Setter for CopyPageRules_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyPageRulesName(_ value: Optional<String>) -> Self {
        self.copyPageRulesName = value
        return self
    }

    /**
     Setter for Item_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setItemCode(_ value: Optional<String>) -> Self {
        self.itemCode = value
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
