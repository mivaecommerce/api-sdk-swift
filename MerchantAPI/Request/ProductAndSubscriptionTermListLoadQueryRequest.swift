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
 Handles API Request ProductAndSubscriptionTermList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/productandsubscriptiontermlist_load_query
 */
public class ProductAndSubscriptionTermListLoadQueryRequest : ListQueryRequest {

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
        return "ProductAndSubscriptionTermList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

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
                "url",
                "subscriptionsettings",
                "subscriptionterms"
            ]
        }
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
     */
    public override init(client: Optional<BaseClient> = nil) {
        super.init(client: client)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductAndSubscriptionTermListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductAndSubscriptionTermListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductAndSubscriptionTermListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductAndSubscriptionTermListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductAndSubscriptionTermListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductAndSubscriptionTermListLoadQueryResponse.self
    }
}
