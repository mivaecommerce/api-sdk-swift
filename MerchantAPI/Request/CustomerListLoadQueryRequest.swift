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
 Handles API Request CustomerList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/customerlist_load_query
 */
public class CustomerListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CustomerList_Load_Query"
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
                "login",
                "pw_email",
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
                "ship_res",
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
                "business_title",
                "note_count",
                "dt_created",
                "dt_login",
                "credit"
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
                "login",
                "pw_email",
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
                "ship_res",
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
                "business_title",
                "note_count",
                "dt_created",
                "dt_login",
                "credit"
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
        - callback: The callback function with signature (CustomerListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CustomerListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CustomerListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CustomerListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CustomerListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerListLoadQueryResponse.self
    }
}
