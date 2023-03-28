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
 Handles API Request CopyPageRulesSettingsList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/copypagerulessettingslist_load_query
 */
public class CopyPageRulesSettingsListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CopyPageRulesSettingsList_Load_Query"
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

    /// Request field Assigned.
    var assigned : Optional<Bool> = nil

    /// Request field Unassigned.
    var unassigned : Optional<Bool> = nil

    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "code",
                "module_name"
            ]
        }
    }

    /**
     The available sort fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSortFields : [ String ] {
        get {
            return [
                "id",
                "code",
                "module_name"
            ]
        }
    }

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case copyPageRulesId = "CopyPageRules_ID"
        case copyPageRulesName = "CopyPageRules_Name"
        case assigned = "Assigned"
        case unassigned = "Unassigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
     */
    public override init(client: Optional<BaseClient> = nil) {
        super.init(client: client)
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

        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.unassigned, forKey: .unassigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CopyPageRulesSettingsListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CopyPageRulesSettingsListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CopyPageRulesSettingsListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CopyPageRulesSettingsListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CopyPageRulesSettingsListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CopyPageRulesSettingsListLoadQueryResponse.self
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
     Getter for Assigned.

     - Returns:  Optional<Bool>
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
    }

    /**
     Getter for Unassigned.

     - Returns:  Optional<Bool>
     */
    public func getUnassigned() -> Optional<Bool> {
        return self.unassigned
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

    /**
     Setter for Unassigned.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setUnassigned(_ value: Optional<Bool>) -> Self {
        self.unassigned = value
        return self
    }
}
