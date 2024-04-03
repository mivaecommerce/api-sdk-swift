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
 Handles API Request BranchItemVersionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/branchitemversionlist_load_query
 */
public class BranchItemVersionListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "BranchItemVersionList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Branch_ID.
    var branchId : Optional<Int> = nil

    /// Request field Edit_Branch.
    var editBranch : Optional<String> = nil

    /// Request field Branch_Name.
    var branchName : Optional<String> = nil

    /// Request field Changeset_ID.
    var changesetId : Optional<Int> = nil

    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "id",
                "item_id",
                "user_id",
                "user_name",
                "code",
                "module_code",
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
                "item_id",
                "user_id",
                "user_name",
                "code",
                "module_id",
                "module_code",
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
        case branchId = "Branch_ID"
        case editBranch = "Edit_Branch"
        case branchName = "Branch_Name"
        case changesetId = "Changeset_ID"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - branch: An optional Branch instance.
     */
    public init(client: Optional<BaseClient> = nil, branch: Optional<Branch> = nil) {
        super.init(client: client)
        if let branch = branch {
            if branch.id > 0 {
                self.branchId = branch.id
            } else if branch.name.count > 0 {
                self.editBranch = branch.name
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

        if self.branchId != nil {
            try container.encodeIfPresent(self.branchId, forKey: .branchId)
        } else if self.editBranch != nil {
            try container.encode(self.editBranch, forKey: .editBranch)
        } else if self.branchName != nil {
            try container.encode(self.branchName, forKey: .branchName)
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (BranchItemVersionListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (BranchItemVersionListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? BranchItemVersionListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> BranchItemVersionListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(BranchItemVersionListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return BranchItemVersionListLoadQueryResponse.self
    }

    /**
     Getter for Branch_ID.

     - Returns:  Optional<Int>
     */
    public func getBranchId() -> Optional<Int> {
        return self.branchId
    }

    /**
     Getter for Edit_Branch.

     - Returns:  Optional<String>
     */
    public func getEditBranch() -> Optional<String> {
        return self.editBranch
    }

    /**
     Getter for Branch_Name.

     - Returns:  Optional<String>
     */
    public func getBranchName() -> Optional<String> {
        return self.branchName
    }

    /**
     Getter for Changeset_ID.

     - Returns:  Optional<Int>
     */
    public func getChangesetId() -> Optional<Int> {
        return self.changesetId
    }

    /**
     Setter for Branch_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setBranchId(_ value: Optional<Int>) -> Self {
        self.branchId = value
        return self
    }

    /**
     Setter for Edit_Branch.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditBranch(_ value: Optional<String>) -> Self {
        self.editBranch = value
        return self
    }

    /**
     Setter for Branch_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBranchName(_ value: Optional<String>) -> Self {
        self.branchName = value
        return self
    }

    /**
     Setter for Changeset_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setChangesetId(_ value: Optional<Int>) -> Self {
        self.changesetId = value
        return self
    }
}
