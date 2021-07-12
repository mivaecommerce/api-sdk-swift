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
 Handles API Request AvailabilityGroupCategory_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/availabilitygroupcategory_update_assigned
 */
public class AvailabilityGroupCategoryUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AvailabilityGroupCategory_Update_Assigned"
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

    /// Request field Edit_Category.
    var editCategory : Optional<String> = nil

    /// Request field Category_Code.
    var categoryCode : Optional<String> = nil

    /// Request field AvailabilityGroup_ID.
    var availabilityGroupId : Optional<Int> = nil

    /// Request field Edit_AvailabilityGroup.
    var editAvailabilityGroup : Optional<String> = nil

    /// Request field AvailabilityGroup_Name.
    var availabilityGroupName : Optional<String> = nil

    /// Request field Assigned.
    var assigned : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case categoryId = "Category_ID"
        case editCategory = "Edit_Category"
        case categoryCode = "Category_Code"
        case availabilityGroupId = "AvailabilityGroup_ID"
        case editAvailabilityGroup = "Edit_AvailabilityGroup"
        case availabilityGroupName = "AvailabilityGroup_Name"
        case assigned = "Assigned"
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
            }

            self.categoryCode = category.code
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

        if self.availabilityGroupId != nil {
            try container.encodeIfPresent(self.availabilityGroupId, forKey: .availabilityGroupId)
        } else if self.editAvailabilityGroup != nil {
            try container.encode(self.editAvailabilityGroup, forKey: .editAvailabilityGroup)
        } else if self.availabilityGroupName != nil {
            try container.encode(self.availabilityGroupName, forKey: .availabilityGroupName)
        }

        if self.categoryId != nil {
            try container.encodeIfPresent(self.categoryId, forKey: .categoryId)
        } else if self.editCategory != nil {
            try container.encode(self.editCategory, forKey: .editCategory)
        } else if self.categoryCode != nil {
            try container.encode(self.categoryCode, forKey: .categoryCode)
        }

        try container.encodeIfPresent(self.categoryCode, forKey: .categoryCode)
        try container.encodeIfPresent(self.availabilityGroupName, forKey: .availabilityGroupName)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AvailabilityGroupCategoryUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AvailabilityGroupCategoryUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AvailabilityGroupCategoryUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AvailabilityGroupCategoryUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AvailabilityGroupCategoryUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AvailabilityGroupCategoryUpdateAssignedResponse.self
    }

    /**
     Getter for Category_ID.

     - Returns:  Optional<Int>
     */
    public func getCategoryId() -> Optional<Int> {
        return self.categoryId
    }

    /**
     Getter for Edit_Category.

     - Returns:  Optional<String>
     */
    public func getEditCategory() -> Optional<String> {
        return self.editCategory
    }

    /**
     Getter for Category_Code.

     - Returns:  Optional<String>
     */
    public func getCategoryCode() -> Optional<String> {
        return self.categoryCode
    }

    /**
     Getter for AvailabilityGroup_ID.

     - Returns:  Optional<Int>
     */
    public func getAvailabilityGroupId() -> Optional<Int> {
        return self.availabilityGroupId
    }

    /**
     Getter for Edit_AvailabilityGroup.

     - Returns:  Optional<String>
     */
    public func getEditAvailabilityGroup() -> Optional<String> {
        return self.editAvailabilityGroup
    }

    /**
     Getter for AvailabilityGroup_Name.

     - Returns:  Optional<String>
     */
    public func getAvailabilityGroupName() -> Optional<String> {
        return self.availabilityGroupName
    }

    /**
     Getter for Assigned.

     - Returns:  Optional<Bool>
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
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
     Setter for AvailabilityGroup_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAvailabilityGroupId(_ value: Optional<Int>) -> Self {
        self.availabilityGroupId = value
        return self
    }

    /**
     Setter for Edit_AvailabilityGroup.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditAvailabilityGroup(_ value: Optional<String>) -> Self {
        self.editAvailabilityGroup = value
        return self
    }

    /**
     Setter for AvailabilityGroup_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAvailabilityGroupName(_ value: Optional<String>) -> Self {
        self.availabilityGroupName = value
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
