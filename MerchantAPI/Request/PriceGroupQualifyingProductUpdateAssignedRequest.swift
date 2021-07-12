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
 Handles API Request PriceGroupQualifyingProduct_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegroupqualifyingproduct_update_assigned
 */
public class PriceGroupQualifyingProductUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PriceGroupQualifyingProduct_Update_Assigned"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Product_ID.
    var productId : Optional<Int> = nil

    /// Request field Edit_Product.
    var editProduct : Optional<String> = nil

    /// Request field Product_Code.
    var productCode : Optional<String> = nil

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
        case productId = "Product_ID"
        case editProduct = "Edit_Product"
        case productCode = "Product_Code"
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
                self.productId = priceGroup.id
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

        if self.priceGroupId != nil {
            try container.encodeIfPresent(self.priceGroupId, forKey: .priceGroupId)
        } else if self.editPriceGroup != nil {
            try container.encode(self.editPriceGroup, forKey: .editPriceGroup)
        } else if self.priceGroupName != nil {
            try container.encode(self.priceGroupName, forKey: .priceGroupName)
        }

        if self.productId != nil {
            try container.encodeIfPresent(self.productId, forKey: .productId)
        } else if self.editProduct != nil {
            try container.encode(self.editProduct, forKey: .editProduct)
        } else if self.productCode != nil {
            try container.encode(self.productCode, forKey: .productCode)
        }

        try container.encodeIfPresent(self.priceGroupName, forKey: .priceGroupName)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PriceGroupQualifyingProductUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PriceGroupQualifyingProductUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PriceGroupQualifyingProductUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PriceGroupQualifyingProductUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PriceGroupQualifyingProductUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PriceGroupQualifyingProductUpdateAssignedResponse.self
    }

    /**
     Getter for Product_ID.

     - Returns:  Optional<Int>
     */
    public func getProductId() -> Optional<Int> {
        return self.productId
    }

    /**
     Getter for Edit_Product.

     - Returns:  Optional<String>
     */
    public func getEditProduct() -> Optional<String> {
        return self.editProduct
    }

    /**
     Getter for Product_Code.

     - Returns:  Optional<String>
     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
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
