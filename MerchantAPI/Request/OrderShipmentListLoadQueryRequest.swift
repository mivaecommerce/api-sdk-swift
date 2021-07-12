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
 Handles API Request OrderShipmentList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/ordershipmentlist_load_query
 */
public class OrderShipmentListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderShipmentList_Load_Query"
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
                "code",
                "tracknum",
                "tracktype",
                "weight",
                "cost",
                "status",
                "ship_date",
                "batch_id",
                "order_batch_id",
                "order_pay_id",
                "order_status",
                "order_pay_status",
                "order_stk_status",
                "order_orderdate",
                "order_dt_instock",
                "order_cust_id",
                "order_ship_res",
                "order_ship_fname",
                "order_ship_lname",
                "order_ship_email",
                "order_ship_comp",
                "order_ship_phone",
                "order_ship_fax",
                "order_ship_addr1",
                "order_ship_addr2",
                "order_ship_city",
                "order_ship_state",
                "order_ship_zip",
                "order_ship_cntry",
                "order_bill_fname",
                "order_bill_lname",
                "order_bill_email",
                "order_bill_comp",
                "order_bill_phone",
                "order_bill_fax",
                "order_bill_addr1",
                "order_bill_addr2",
                "order_bill_city",
                "order_bill_state",
                "order_bill_zip",
                "order_bill_cntry",
                "order_ship_id",
                "order_ship_data",
                "order_source",
                "order_source_id",
                "order_total",
                "order_total_ship",
                "order_total_tax",
                "order_total_auth",
                "order_total_capt",
                "order_total_rfnd",
                "order_net_capt",
                "order_pend_count",
                "order_bord_count",
                "order_note_count"
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
                "code",
                "tracknum",
                "tracktype",
                "weight",
                "cost",
                "status",
                "ship_date",
                "batch_id",
                "order_batch_id",
                "order_pay_id",
                "order_status",
                "order_pay_status",
                "order_stk_status",
                "order_dt_instock",
                "order_orderdate",
                "order_cust_id",
                "order_ship_res",
                "order_ship_fname",
                "order_ship_lname",
                "order_ship_email",
                "order_ship_comp",
                "order_ship_phone",
                "order_ship_fax",
                "order_ship_addr1",
                "order_ship_addr2",
                "order_ship_city",
                "order_ship_state",
                "order_ship_zip",
                "order_ship_cntry",
                "order_bill_fname",
                "order_bill_lname",
                "order_bill_email",
                "order_bill_comp",
                "order_bill_phone",
                "order_bill_fax",
                "order_bill_addr1",
                "order_bill_addr2",
                "order_bill_city",
                "order_bill_state",
                "order_bill_zip",
                "order_bill_cntry",
                "order_ship_id",
                "order_ship_data",
                "order_source",
                "order_source_id",
                "order_total",
                "order_total_ship",
                "order_total_tax",
                "order_total_auth",
                "order_total_capt",
                "order_total_rfnd",
                "order_net_capt",
                "order_pend_count",
                "order_bord_count",
                "order_note_count"
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
                "items",
                "include_order"
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
        - callback: The callback function with signature (OrderShipmentListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderShipmentListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderShipmentListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderShipmentListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderShipmentListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderShipmentListLoadQueryResponse.self
    }
}
