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
 Handles API Request PageList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/pagelist_load_query
 */
public class PageListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PageList_Load_Query"
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

    /// Request field Branch_Name.
    var branchName : Optional<String> = nil

    /// Request field Edit_Branch.
    var editBranch : Optional<String> = nil

    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "code",
                "name",
                "secure",
                "title",
                "cache",
                "admin",
                "layout",
                "public",
                "fragment"
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
                "code",
                "name",
                "secure",
                "title",
                "cache",
                "admin",
                "layout",
                "public",
                "fragment"
            ]
        }
    }

    /**
     The available on demand columns applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableOnDemandColumns : [ String ] {
        get {
            return [
                "notes",
                "source",
                "settings",
                "url",
                "uris"
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
        case branchName = "Branch_Name"
        case editBranch = "Edit_Branch"
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
        } else if self.branchName != nil {
            try container.encode(self.branchName, forKey: .branchName)
        } else if self.editBranch != nil {
            try container.encode(self.editBranch, forKey: .editBranch)
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PageListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PageListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PageListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PageListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PageListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PageListLoadQueryResponse.self
    }

    /**
     Getter for Branch_ID.

     - Returns:  Optional<Int>
     */
    public func getBranchId() -> Optional<Int> {
        return self.branchId
    }

    /**
     Getter for Branch_Name.

     - Returns:  Optional<String>
     */
    public func getBranchName() -> Optional<String> {
        return self.branchName
    }

    /**
     Getter for Edit_Branch.

     - Returns:  Optional<String>
     */
    public func getEditBranch() -> Optional<String> {
        return self.editBranch
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
}
