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
 Handles API Request AttributeTemplateProductList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/attributetemplateproductlist_load_query
 */
public class AttributeTemplateProductListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AttributeTemplateProductList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field AttributeTemplate_ID.
    var attributeTemplateId : Optional<Int> = nil

    /// Request field AttributeTemplate_Code.
    var attributeTemplateCode : Optional<String> = nil

    /// Request field Edit_AttributeTemplate.
    var editAttributeTemplate : Optional<String> = nil

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
        case attributeTemplateId = "AttributeTemplate_ID"
        case attributeTemplateCode = "AttributeTemplate_Code"
        case editAttributeTemplate = "Edit_AttributeTemplate"
        case assigned = "Assigned"
        case unassigned = "Unassigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - attributeTemplate: An optional AttributeTemplate instance.
     */
    public init(client: Optional<BaseClient> = nil, attributeTemplate: Optional<AttributeTemplate> = nil) {
        super.init(client: client)
        if let attributeTemplate = attributeTemplate {
            if attributeTemplate.id > 0 {
                self.attributeTemplateId = attributeTemplate.id
            } else if attributeTemplate.code.count > 0 {
                self.attributeTemplateCode = attributeTemplate.code
            } else if attributeTemplate.code.count > 0 {
                self.editAttributeTemplate = attributeTemplate.code
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

        if self.attributeTemplateId != nil {
            try container.encodeIfPresent(self.attributeTemplateId, forKey: .attributeTemplateId)
        } else if self.attributeTemplateCode != nil {
            try container.encode(self.attributeTemplateCode, forKey: .attributeTemplateCode)
        } else if self.editAttributeTemplate != nil {
            try container.encode(self.editAttributeTemplate, forKey: .editAttributeTemplate)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.unassigned, forKey: .unassigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AttributeTemplateProductListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AttributeTemplateProductListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AttributeTemplateProductListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AttributeTemplateProductListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AttributeTemplateProductListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AttributeTemplateProductListLoadQueryResponse.self
    }

    /**
     Getter for AttributeTemplate_ID.

     - Returns:  Optional<Int>
     */
    public func getAttributeTemplateId() -> Optional<Int> {
        return self.attributeTemplateId
    }

    /**
     Getter for AttributeTemplate_Code.

     - Returns:  Optional<String>
     */
    public func getAttributeTemplateCode() -> Optional<String> {
        return self.attributeTemplateCode
    }

    /**
     Getter for Edit_AttributeTemplate.

     - Returns:  Optional<String>
     */
    public func getEditAttributeTemplate() -> Optional<String> {
        return self.editAttributeTemplate
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
     Setter for AttributeTemplate_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateId(_ value: Optional<Int>) -> Self {
        self.attributeTemplateId = value
        return self
    }

    /**
     Setter for AttributeTemplate_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeTemplateCode(_ value: Optional<String>) -> Self {
        self.attributeTemplateCode = value
        return self
    }

    /**
     Setter for Edit_AttributeTemplate.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditAttributeTemplate(_ value: Optional<String>) -> Self {
        self.editAttributeTemplate = value
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
