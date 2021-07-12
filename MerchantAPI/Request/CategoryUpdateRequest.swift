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
 Handles API Request Category_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/category_update
 */
public class CategoryUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Category_Update"
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

    /// Request field Category_Name.
    var categoryName : Optional<String> = nil

    /// Request field Category_Page_Title.
    var categoryPageTitle : Optional<String> = nil

    /// Request field Category_Active.
    var categoryActive : Optional<Bool> = nil

    /// Request field Category_Parent_Category.
    var categoryParentCategory : Optional<String> = nil

    /// Request field Category_Alternate_Display_Page.
    var categoryAlternateDisplayPage : Optional<String> = nil

    /// Request field CustomField_Values.
    var customFieldValues : CustomFieldValues

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case categoryId = "Category_ID"
        case categoryCode = "Category_Code"
        case editCategory = "Edit_Category"
        case categoryName = "Category_Name"
        case categoryPageTitle = "Category_Page_Title"
        case categoryActive = "Category_Active"
        case categoryParentCategory = "Category_Parent_Category"
        case categoryAlternateDisplayPage = "Category_Alternate_Display_Page"
        case customFieldValues = "CustomField_Values"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - category: An optional Category instance.
     */
    public init(client: Optional<BaseClient> = nil, category: Optional<Category> = nil) {
        self.customFieldValues = CustomFieldValues()
        super.init(client: client)
        if let category = category {
            if category.id > 0 {
                self.categoryId = category.id
            } else if category.code.count > 0 {
                self.editCategory = category.code
            }

            self.categoryCode = category.code
            self.categoryName = category.name
            self.categoryPageTitle = category.pageTitle
            self.categoryActive = category.active
            self.categoryParentCategory = category.parentCategory
            self.categoryAlternateDisplayPage = category.pageCode
            self.customFieldValues = category.customFieldValues
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
        }

        try container.encodeIfPresent(self.categoryCode, forKey: .categoryCode)
        try container.encodeIfPresent(self.categoryName, forKey: .categoryName)
        try container.encodeIfPresent(self.categoryPageTitle, forKey: .categoryPageTitle)
        try container.encodeIfPresent(self.categoryActive, forKey: .categoryActive)
        try container.encodeIfPresent(self.categoryParentCategory, forKey: .categoryParentCategory)
        try container.encodeIfPresent(self.categoryAlternateDisplayPage, forKey: .categoryAlternateDisplayPage)
        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CategoryUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CategoryUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CategoryUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CategoryUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CategoryUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CategoryUpdateResponse.self
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
     Getter for Category_Name.

     - Returns:  Optional<String>
     */
    public func getCategoryName() -> Optional<String> {
        return self.categoryName
    }

    /**
     Getter for Category_Page_Title.

     - Returns:  Optional<String>
     */
    public func getCategoryPageTitle() -> Optional<String> {
        return self.categoryPageTitle
    }

    /**
     Getter for Category_Active.

     - Returns:  Optional<Bool>
     */
    public func getCategoryActive() -> Optional<Bool> {
        return self.categoryActive
    }

    /**
     Getter for Category_Parent_Category.

     - Returns:  Optional<String>
     */
    public func getCategoryParentCategory() -> Optional<String> {
        return self.categoryParentCategory
    }

    /**
     Getter for Category_Alternate_Display_Page.

     - Returns:  Optional<String>
     */
    public func getCategoryAlternateDisplayPage() -> Optional<String> {
        return self.categoryAlternateDisplayPage
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
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
     Setter for Category_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryName(_ value: Optional<String>) -> Self {
        self.categoryName = value
        return self
    }

    /**
     Setter for Category_Page_Title.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryPageTitle(_ value: Optional<String>) -> Self {
        self.categoryPageTitle = value
        return self
    }

    /**
     Setter for Category_Active.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryActive(_ value: Optional<Bool>) -> Self {
        self.categoryActive = value
        return self
    }

    /**
     Setter for Category_Parent_Category.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryParentCategory(_ value: Optional<String>) -> Self {
        self.categoryParentCategory = value
        return self
    }

    /**
     Setter for Category_Alternate_Display_Page.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryAlternateDisplayPage(_ value: Optional<String>) -> Self {
        self.categoryAlternateDisplayPage = value
        return self
    }
}
