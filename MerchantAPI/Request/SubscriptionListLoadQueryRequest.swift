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
 Handles API Request SubscriptionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/subscriptionlist_load_query
 */
public class SubscriptionListLoadQueryRequest : ListQueryRequest {

    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "SubscriptionList_Load_Query"
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
                "order_id",
                "quantity",
                "termrem",
                "termproc",
                "firstdate",
                "lastdate",
                "nextdate",
                "status",
                "message",
                "cncldate",
                "tax",
                "shipping",
                "subtotal",
                "total",
                "authfails",
                "lastafail",
                "frequency",
                "term",
                "descrip",
                "n",
                "fixed_dow",
                "fixed_dom",
                "sub_count",
                "customer_login",
                "customer_pw_email",
                "customer_business_title",
                "product_code",
                "product_name",
                "product_sku",
                "product_price",
                "product_cost",
                "product_weight",
                "product_descrip",
                "product_taxable",
                "product_thumbnail",
                "product_image",
                "product_active",
                "product_page_title",
                "product_cancat_code",
                "product_page_code",
                "address_descrip",
                "address_fname",
                "address_lname",
                "address_email",
                "address_phone",
                "address_fax",
                "address_comp",
                "address_addr1",
                "address_addr2",
                "address_city",
                "address_state",
                "address_zip",
                "address_cntry",
                "product_inventory_active"
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
                "order_id",
                "custpc_id",
                "quantity",
                "termrem",
                "termproc",
                "firstdate",
                "lastdate",
                "nextdate",
                "status",
                "message",
                "cncldate",
                "tax",
                "shipping",
                "subtotal",
                "total",
                "authfails",
                "lastafail",
                "frequency",
                "term",
                "descrip",
                "n",
                "fixed_dow",
                "fixed_dom",
                "sub_count",
                "customer_login",
                "customer_pw_email",
                "customer_business_title",
                "product_code",
                "product_name",
                "product_sku",
                "product_cancat_code",
                "product_page_code",
                "product_price",
                "product_cost",
                "product_weight",
                "product_descrip",
                "product_taxable",
                "product_thumbnail",
                "product_image",
                "product_active",
                "product_page_title",
                "address_descrip",
                "address_fname",
                "address_lname",
                "address_email",
                "address_phone",
                "address_fax",
                "address_comp",
                "address_addr1",
                "address_addr2",
                "address_city",
                "address_state",
                "address_zip",
                "address_cntry",
                "product_inventory"
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
                "imagetypes",
                "imagetype_count",
                "product_descrip"
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
        - callback: The callback function with signature (SubscriptionListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (SubscriptionListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? SubscriptionListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> SubscriptionListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(SubscriptionListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return SubscriptionListLoadQueryResponse.self
    }
}
