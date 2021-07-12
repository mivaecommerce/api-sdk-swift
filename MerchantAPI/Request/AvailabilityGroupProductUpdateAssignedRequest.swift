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
 Handles API Request AvailabilityGroupProduct_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/availabilitygroupproduct_update_assigned
 */
public class AvailabilityGroupProductUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AvailabilityGroupProduct_Update_Assigned"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field AvailabilityGroup_ID.
    var availabilityGroupId : Optional<Int> = nil

    /// Request field Edit_AvailabilityGroup.
    var editAvailabilityGroup : Optional<String> = nil

    /// Request field AvailabilityGroup_Name.
    var availabilityGroupName : Optional<String> = nil

    /// Request field Product_ID.
    var productId : Optional<Int> = nil

    /// Request field Product_Code.
    var productCode : Optional<String> = nil

    /// Request field Product_SKU.
    var productSku : Optional<String> = nil

    /// Request field Edit_Product.
    var editProduct : Optional<String> = nil

    /// Request field Assigned.
    var assigned : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case availabilityGroupId = "AvailabilityGroup_ID"
        case editAvailabilityGroup = "Edit_AvailabilityGroup"
        case availabilityGroupName = "AvailabilityGroup_Name"
        case productId = "Product_ID"
        case productCode = "Product_Code"
        case productSku = "Product_SKU"
        case editProduct = "Edit_Product"
        case assigned = "Assigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - availabilityGroup: An optional AvailabilityGroup instance.
     */
    public init(client: Optional<BaseClient> = nil, availabilityGroup: Optional<AvailabilityGroup> = nil) {
        super.init(client: client)
        if let availabilityGroup = availabilityGroup {
            if availabilityGroup.id > 0 {
                self.availabilityGroupId = availabilityGroup.id
            } else if availabilityGroup.name.count > 0 {
                self.editAvailabilityGroup = availabilityGroup.name
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

        if self.availabilityGroupId != nil {
            try container.encodeIfPresent(self.availabilityGroupId, forKey: .availabilityGroupId)
        } else if self.editAvailabilityGroup != nil {
            try container.encode(self.editAvailabilityGroup, forKey: .editAvailabilityGroup)
        } else if self.availabilityGroupName != nil {
            try container.encode(self.availabilityGroupName, forKey: .availabilityGroupName)
        }

        if self.productId != nil {
            try container.encodeIfPresent(self.productId, forKey: .productId)
        } else if self.editProduct != nil {
            try container.encode(self.editProduct, forKey: .editProduct)
        } else if self.productCode != nil {
            try container.encode(self.productCode, forKey: .productCode)
        } else if self.productSku != nil {
            try container.encode(self.productSku, forKey: .productSku)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AvailabilityGroupProductUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AvailabilityGroupProductUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AvailabilityGroupProductUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AvailabilityGroupProductUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AvailabilityGroupProductUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AvailabilityGroupProductUpdateAssignedResponse.self
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
     Getter for Product_ID.

     - Returns:  Optional<Int>
     */
    public func getProductId() -> Optional<Int> {
        return self.productId
    }

    /**
     Getter for Product_Code.

     - Returns:  Optional<String>
     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
    }

    /**
     Getter for Product_SKU.

     - Returns:  Optional<String>
     */
    public func getProductSku() -> Optional<String> {
        return self.productSku
    }

    /**
     Getter for Edit_Product.

     - Returns:  Optional<String>
     */
    public func getEditProduct() -> Optional<String> {
        return self.editProduct
    }

    /**
     Getter for Assigned.

     - Returns:  Optional<Bool>
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
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
     Setter for Product_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductId(_ value: Optional<Int>) -> Self {
        self.productId = value
        return self
    }

    /**
     Setter for Product_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductCode(_ value: Optional<String>) -> Self {
        self.productCode = value
        return self
    }

    /**
     Setter for Product_SKU.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductSku(_ value: Optional<String>) -> Self {
        self.productSku = value
        return self
    }

    /**
     Setter for Edit_Product.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditProduct(_ value: Optional<String>) -> Self {
        self.editProduct = value
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
