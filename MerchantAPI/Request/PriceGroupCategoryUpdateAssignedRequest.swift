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
 Handles API Request PriceGroupCategory_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegroupcategory_update_assigned
 */
public class PriceGroupCategoryUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PriceGroupCategory_Update_Assigned"
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

    /// Request field PriceGroup_ID.
    var priceGroupId : Optional<Int> = nil

    /// Request field Edit_PriceGroup.
    var editPriceGroup : Optional<String> = nil

    /// Request field PriceGroup_Name.
    var priceGroupName : Optional<String> = nil

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
        case priceGroupId = "PriceGroup_ID"
        case editPriceGroup = "Edit_PriceGroup"
        case priceGroupName = "PriceGroup_Name"
        case assigned = "Assigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - priceGroup: An optional PriceGroup instance.
     */
    public init(client: Optional<BaseClient> = nil, priceGroup: Optional<PriceGroup> = nil) {
        super.init(client: client)
        if let priceGroup = priceGroup {
            if priceGroup.id > 0 {
                self.priceGroupId = priceGroup.id
            } else if priceGroup.name.count > 0 {
                self.editPriceGroup = priceGroup.name
            } else if priceGroup.name.count > 0 {
                self.priceGroupName = priceGroup.name
            }

            self.priceGroupName = priceGroup.name
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

        if self.priceGroupId != nil {
            try container.encodeIfPresent(self.priceGroupId, forKey: .priceGroupId)
        } else if self.editPriceGroup != nil {
            try container.encode(self.editPriceGroup, forKey: .editPriceGroup)
        } else if self.priceGroupName != nil {
            try container.encode(self.priceGroupName, forKey: .priceGroupName)
        }

        if self.categoryId != nil {
            try container.encodeIfPresent(self.categoryId, forKey: .categoryId)
        } else if self.editCategory != nil {
            try container.encode(self.editCategory, forKey: .editCategory)
        } else if self.categoryCode != nil {
            try container.encode(self.categoryCode, forKey: .categoryCode)
        }

        try container.encodeIfPresent(self.priceGroupName, forKey: .priceGroupName)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PriceGroupCategoryUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PriceGroupCategoryUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PriceGroupCategoryUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PriceGroupCategoryUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PriceGroupCategoryUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PriceGroupCategoryUpdateAssignedResponse.self
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
     Getter for PriceGroup_ID.

     - Returns:  Optional<Int>
     */
    public func getPriceGroupId() -> Optional<Int> {
        return self.priceGroupId
    }

    /**
     Getter for Edit_PriceGroup.

     - Returns:  Optional<String>
     */
    public func getEditPriceGroup() -> Optional<String> {
        return self.editPriceGroup
    }

    /**
     Getter for PriceGroup_Name.

     - Returns:  Optional<String>
     */
    public func getPriceGroupName() -> Optional<String> {
        return self.priceGroupName
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
     Setter for PriceGroup_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupId(_ value: Optional<Int>) -> Self {
        self.priceGroupId = value
        return self
    }

    /**
     Setter for Edit_PriceGroup.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditPriceGroup(_ value: Optional<String>) -> Self {
        self.editPriceGroup = value
        return self
    }

    /**
     Setter for PriceGroup_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupName(_ value: Optional<String>) -> Self {
        self.priceGroupName = value
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
