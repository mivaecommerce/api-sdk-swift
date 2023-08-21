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
 Handles API Request ChildCategoryList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/childcategorylist_load_query
 */
public class ChildCategoryListLoadQueryRequest : ListQueryRequest {

    /// Enumeration CategoryShow
    public enum CategoryShow : String {
        case All = "All"
        case Active = "Active"
    }

    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ChildCategoryList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field ParentCategory_ID.
    var parentCategoryId : Optional<Int> = nil

    /// Request field ParentCategory_Code.
    var parentCategoryCode : Optional<String> = nil

    /// Request field Edit_ParentCategory.
    var editParentCategory : Optional<String> = nil

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
                "id",
                "code",
                "name",
                "page_title",
                "parent_category",
                "page_code",
                "dt_created",
                "dt_updated",
                "depth"
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
                "name",
                "page_title",
                "active",
                "page_code",
                "parent_category",
                "disp_order",
                "dt_created",
                "dt_updated",
                "depth"
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
                "uris",
                "url"
            ]
        }
    }

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case parentCategoryId = "ParentCategory_ID"
        case parentCategoryCode = "ParentCategory_Code"
        case editParentCategory = "Edit_ParentCategory"
        case assigned = "Assigned"
        case unassigned = "Unassigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - category: An optional Category instance.
     */
    public init(client: Optional<BaseClient> = nil, category: Optional<Category> = nil) {
        super.init(client: client)
        if let category = category {
            if category.id > 0 {
                self.parentCategoryId = category.id
            } else if category.code.count > 0 {
                self.editParentCategory = category.code
            } else if category.code.count > 0 {
                self.parentCategoryCode = category.code
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

        if self.parentCategoryId != nil {
            try container.encodeIfPresent(self.parentCategoryId, forKey: .parentCategoryId)
        } else if self.parentCategoryCode != nil {
            try container.encode(self.parentCategoryCode, forKey: .parentCategoryCode)
        } else if self.editParentCategory != nil {
            try container.encode(self.editParentCategory, forKey: .editParentCategory)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.unassigned, forKey: .unassigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ChildCategoryListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ChildCategoryListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ChildCategoryListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ChildCategoryListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ChildCategoryListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ChildCategoryListLoadQueryResponse.self
    }

    /**
     Getter for ParentCategory_ID.

     - Returns:  Optional<Int>
     */
    public func getParentCategoryId() -> Optional<Int> {
        return self.parentCategoryId
    }

    /**
     Getter for ParentCategory_Code.

     - Returns:  Optional<String>
     */
    public func getParentCategoryCode() -> Optional<String> {
        return self.parentCategoryCode
    }

    /**
     Getter for Edit_ParentCategory.

     - Returns:  Optional<String>
     */
    public func getEditParentCategory() -> Optional<String> {
        return self.editParentCategory
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
     Setter for ParentCategory_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setParentCategoryId(_ value: Optional<Int>) -> Self {
        self.parentCategoryId = value
        return self
    }

    /**
     Setter for ParentCategory_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setParentCategoryCode(_ value: Optional<String>) -> Self {
        self.parentCategoryCode = value
        return self
    }

    /**
     Setter for Edit_ParentCategory.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditParentCategory(_ value: Optional<String>) -> Self {
        self.editParentCategory = value
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
