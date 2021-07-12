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
 Handles API Request BusinessAccountCustomerList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/businessaccountcustomerlist_load_query
 */
public class BusinessAccountCustomerListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "BusinessAccountCustomerList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field BusinessAccount_ID.
    var businessAccountId : Optional<Int> = nil

    /// Request field Edit_BusinessAccount.
    var editBusinessAccount : Optional<Int> = nil

    /// Request field BusinessAccount_Title.
    var businessAccountTitle : Optional<String> = nil

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
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case businessAccountId = "BusinessAccount_ID"
        case editBusinessAccount = "Edit_BusinessAccount"
        case businessAccountTitle = "BusinessAccount_Title"
        case assigned = "Assigned"
        case unassigned = "Unassigned"
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

        if self.businessAccountId != nil {
            try container.encodeIfPresent(self.businessAccountId, forKey: .businessAccountId)
        } else if self.editBusinessAccount != nil {
            try container.encode(self.editBusinessAccount, forKey: .editBusinessAccount)
        } else if self.businessAccountTitle != nil {
            try container.encode(self.businessAccountTitle, forKey: .businessAccountTitle)
        }

        try container.encodeIfPresent(self.businessAccountId, forKey: .businessAccountId)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.unassigned, forKey: .unassigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (BusinessAccountCustomerListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (BusinessAccountCustomerListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? BusinessAccountCustomerListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> BusinessAccountCustomerListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(BusinessAccountCustomerListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return BusinessAccountCustomerListLoadQueryResponse.self
    }

    /**
     Getter for BusinessAccount_ID.

     - Returns:  Optional<Int>
     */
    public func getBusinessAccountId() -> Optional<Int> {
        return self.businessAccountId
    }

    /**
     Getter for Edit_BusinessAccount.

     - Returns:  Optional<Int>
     */
    public func getEditBusinessAccount() -> Optional<Int> {
        return self.editBusinessAccount
    }

    /**
     Getter for BusinessAccount_Title.

     - Returns:  Optional<String>
     */
    public func getBusinessAccountTitle() -> Optional<String> {
        return self.businessAccountTitle
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
     Setter for BusinessAccount_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setBusinessAccountId(_ value: Optional<Int>) -> Self {
        self.businessAccountId = value
        return self
    }

    /**
     Setter for Edit_BusinessAccount.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setEditBusinessAccount(_ value: Optional<Int>) -> Self {
        self.editBusinessAccount = value
        return self
    }

    /**
     Setter for BusinessAccount_Title.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBusinessAccountTitle(_ value: Optional<String>) -> Self {
        self.businessAccountTitle = value
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
