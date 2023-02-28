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
 Handles API Request PriceGroupProductList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegroupproductlist_load_query
 */
public class PriceGroupProductListLoadQueryRequest : ListQueryRequest {

    /// Enumeration ProductShow
    public enum ProductShow : String {
        case All = "All"
        case Uncategorized = "Uncategorized"
        case Active = "Active"
    }

    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PriceGroupProductList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field PriceGroup_ID.
    var priceGroupId : Optional<Int> = nil

    /// Request field PriceGroup_Name.
    var priceGroupName : Optional<String> = nil

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
        case priceGroupId = "PriceGroup_ID"
        case priceGroupName = "PriceGroup_Name"
        case assigned = "Assigned"
        case unassigned = "Unassigned"
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
                self.priceGroupName = priceGroup.name
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
        } else if self.priceGroupName != nil {
            try container.encode(self.priceGroupName, forKey: .priceGroupName)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.unassigned, forKey: .unassigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PriceGroupProductListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PriceGroupProductListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PriceGroupProductListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PriceGroupProductListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PriceGroupProductListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PriceGroupProductListLoadQueryResponse.self
    }

    /**
     Getter for PriceGroup_ID.

     - Returns:  Optional<Int>
     */
    public func getPriceGroupId() -> Optional<Int> {
        return self.priceGroupId
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
     Getter for Unassigned.

     - Returns:  Optional<Bool>
     */
    public func getUnassigned() -> Optional<Bool> {
        return self.unassigned
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
