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
 Handles API Request CategoryProductList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/categoryproductlist_load_query
 */
public class CategoryProductListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CategoryProductList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Category_ID.
    var categoryId : Optional<Int> = nil

    /// Request field Category_Code.
    var categoryCode : Optional<String> = nil

    /// Request field Edit_Category.
    var editCategory : Optional<String> = nil

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
                "sku",
                "cancat_code",
                "page_code",
                "name",
                "thumbnail",
                "image",
                "price",
                "cost",
                "descrip",
                "weight",
                "taxable",
                "active",
                "page_title",
                "dt_created",
                "dt_updated",
                "category",
                "product_inventory"
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
                "sku",
                "cancat_code",
                "page_code",
                "name",
                "thumbnail",
                "image",
                "price",
                "cost",
                "descrip",
                "weight",
                "taxable",
                "active",
                "page_title",
                "dt_created",
                "dt_updated"
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
                "descrip",
                "catcount",
                "cancat_code",
                "page_code",
                "product_inventory",
                "productinventorysettings",
                "attributes",
                "productimagedata",
                "categories",
                "productshippingrules",
                "relatedproducts",
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
        case categoryId = "Category_ID"
        case categoryCode = "Category_Code"
        case editCategory = "Edit_Category"
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
                self.categoryId = category.id
            } else if category.code.count > 0 {
                self.editCategory = category.code
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

        if self.categoryId != nil {
            try container.encodeIfPresent(self.categoryId, forKey: .categoryId)
        } else if self.editCategory != nil {
            try container.encode(self.editCategory, forKey: .editCategory)
        } else if self.categoryCode != nil {
            try container.encode(self.categoryCode, forKey: .categoryCode)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.unassigned, forKey: .unassigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CategoryProductListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CategoryProductListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CategoryProductListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CategoryProductListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CategoryProductListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CategoryProductListLoadQueryResponse.self
    }

    /**
     Getter for Category_ID.

     - Returns:  Optional<Int>
     */
    public func getCategoryId() -> Optional<Int> {
        return self.categoryId
    }

    /**
     Getter for Category_Code.

     - Returns:  Optional<String>
     */
    public func getCategoryCode() -> Optional<String> {
        return self.categoryCode
    }

    /**
     Getter for Edit_Category.

     - Returns:  Optional<String>
     */
    public func getEditCategory() -> Optional<String> {
        return self.editCategory
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
     Setter for Category_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryId(_ value: Optional<Int>) -> Self {
        self.categoryId = value
        return self
    }

    /**
     Setter for Category_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryCode(_ value: Optional<String>) -> Self {
        self.categoryCode = value
        return self
    }

    /**
     Setter for Edit_Category.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditCategory(_ value: Optional<String>) -> Self {
        self.editCategory = value
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
