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
 Handles API Request CategoryURI_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/categoryuri_insert
 */
public class CategoryURIInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CategoryURI_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field URI.
    var uri : Optional<String> = nil

    /// Request field Status.
    var status : Optional<Int> = nil

    /// Request field Canonical.
    var canonical : Optional<Bool> = nil

    /// Request field Category_ID.
    var categoryId : Optional<Int> = nil

    /// Request field Category_Code.
    var categoryCode : Optional<String> = nil

    /// Request field Edit_Category.
    var editCategory : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case uri = "URI"
        case status = "Status"
        case canonical = "Canonical"
        case categoryId = "Category_ID"
        case categoryCode = "Category_Code"
        case editCategory = "Edit_Category"
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
                self.categoryCode = category.code
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
        } else if self.categoryCode != nil {
            try container.encode(self.categoryCode, forKey: .categoryCode)
        } else if self.editCategory != nil {
            try container.encode(self.editCategory, forKey: .editCategory)
        }

        try container.encodeIfPresent(self.uri, forKey: .uri)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.canonical, forKey: .canonical)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CategoryURIInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CategoryURIInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CategoryURIInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CategoryURIInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CategoryURIInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CategoryURIInsertResponse.self
    }

    /**
     Getter for URI.

     - Returns:  Optional<String>
     */
    public func getUri() -> Optional<String> {
        return self.uri
    }

    /**
     Getter for Status.

     - Returns:  Optional<Int>
     */
    public func getStatus() -> Optional<Int> {
        return self.status
    }

    /**
     Getter for Canonical.

     - Returns:  Optional<Bool>
     */
    public func getCanonical() -> Optional<Bool> {
        return self.canonical
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
     Setter for URI.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setUri(_ value: Optional<String>) -> Self {
        self.uri = value
        return self
    }

    /**
     Setter for Status.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setStatus(_ value: Optional<Int>) -> Self {
        self.status = value
        return self
    }

    /**
     Setter for Canonical.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCanonical(_ value: Optional<Bool>) -> Self {
        self.canonical = value
        return self
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
}
