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
 Handles API Request OrderList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderlist_load_query
 */
public class OrderListLoadQueryRequest : ListQueryRequest {

    /// Enumeration PayStatusFilter
    public enum PayStatusFilter : String {
        case AuthOnly = "auth_0_capt"
        case PartialCapture = "partial_capt"
        case CapturedNotShipped = "capt_not_ship"
        case ShippedNotCaptured = "ship_not_capt"
    }

    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Passphrase.
    var passphrase : Optional<String> = nil

    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "id",
                "batch_id",
                "status",
                "pay_status",
                "orderdate",
                "dt_instock",
                "ship_res",
                "ship_fname",
                "ship_lname",
                "ship_email",
                "ship_comp",
                "ship_phone",
                "ship_fax",
                "ship_addr1",
                "ship_addr2",
                "ship_city",
                "ship_state",
                "ship_zip",
                "ship_cntry",
                "bill_fname",
                "bill_lname",
                "bill_email",
                "bill_comp",
                "bill_phone",
                "bill_fax",
                "bill_addr1",
                "bill_addr2",
                "bill_city",
                "bill_state",
                "bill_zip",
                "bill_cntry",
                "ship_id",
                "ship_data",
                "source",
                "source_id",
                "total",
                "total_ship",
                "total_tax",
                "total_auth",
                "total_capt",
                "total_rfnd",
                "net_capt",
                "pend_count",
                "bord_count",
                "cust_login",
                "cust_pw_email",
                "business_title",
                "note_count"
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
                "batch_id",
                "status",
                "pay_status",
                "orderdate",
                "dt_instock",
                "ship_res",
                "ship_fname",
                "ship_lname",
                "ship_email",
                "ship_comp",
                "ship_phone",
                "ship_fax",
                "ship_addr1",
                "ship_addr2",
                "ship_city",
                "ship_state",
                "ship_zip",
                "ship_cntry",
                "bill_fname",
                "bill_lname",
                "bill_email",
                "bill_comp",
                "bill_phone",
                "bill_fax",
                "bill_addr1",
                "bill_addr2",
                "bill_city",
                "bill_state",
                "bill_zip",
                "bill_cntry",
                "ship_data",
                "source",
                "source_id",
                "total",
                "total_ship",
                "total_tax",
                "total_auth",
                "total_capt",
                "total_rfnd",
                "net_capt",
                "pend_count",
                "bord_count",
                "cust_login",
                "cust_pw_email",
                "business_title",
                "note_count",
                "payment_module"
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
                "ship_method",
                "cust_login",
                "cust_pw_email",
                "business_title",
                "payment_module",
                "customer",
                "items",
                "charges",
                "coupons",
                "discounts",
                "payments",
                "notes",
                "parts",
                "shipments",
                "returns",
                "payment_data"
            ]
        }
    }

    /**
     The available custom fileters applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableCustomFilters : [ String ] {
        get {
            return [
                "Customer_ID",
                "BusinessAccount_ID",
                "pay_id",
                "payment",
                "product_code"
            ]
        }
    }

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case passphrase = "Passphrase"
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
     Implementation of Encodable.

     - Parameters:
        - encode: A Encoder instance to encode to.
     - Throws: Error when unable to encode the request data.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.passphrase, forKey: .passphrase)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderListLoadQueryResponse.self
    }

    /**
     Getter for Passphrase.

     - Returns:  Optional<String>
     */
    public func getPassphrase() -> Optional<String> {
        return self.passphrase
    }

    /**
     Setter for Passphrase.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPassphrase(_ value: Optional<String>) -> Self {
        self.passphrase = value
        return self
    }
}
