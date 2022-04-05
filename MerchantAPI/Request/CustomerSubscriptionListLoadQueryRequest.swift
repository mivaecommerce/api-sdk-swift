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
 Handles API Request CustomerSubscriptionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/customersubscriptionlist_load_query
 */
public class CustomerSubscriptionListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CustomerSubscriptionList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Customer_ID.
    var customerId : Optional<Int> = nil

    /// Request field Edit_Customer.
    var editCustomer : Optional<String> = nil

    /// Request field Customer_Login.
    var customerLogin : Optional<String> = nil

    /// Request field CustomField_Values.
    var customFieldValues : CustomFieldValues

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
                "product_inventory",
                "product_inventory_active",
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
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case customerId = "Customer_ID"
        case editCustomer = "Edit_Customer"
        case customerLogin = "Customer_Login"
        case customFieldValues = "CustomField_Values"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - customer: An optional Customer instance.
     */
    public init(client: Optional<BaseClient> = nil, customer: Optional<Customer> = nil) {
        self.customFieldValues = CustomFieldValues()
        super.init(client: client)
        if let customer = customer {
            if customer.id > 0 {
                self.customerId = customer.id
            } else if customer.login.count > 0 {
                self.editCustomer = customer.login
            }

            self.customFieldValues = customer.customFieldValues
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

        if self.customerId != nil {
            try container.encodeIfPresent(self.customerId, forKey: .customerId)
        } else if self.editCustomer != nil {
            try container.encode(self.editCustomer, forKey: .editCustomer)
        } else if self.customerLogin != nil {
            try container.encode(self.customerLogin, forKey: .customerLogin)
        }

        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CustomerSubscriptionListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CustomerSubscriptionListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CustomerSubscriptionListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CustomerSubscriptionListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CustomerSubscriptionListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerSubscriptionListLoadQueryResponse.self
    }

    /**
     Getter for Customer_ID.

     - Returns:  Optional<Int>
     */
    public func getCustomerId() -> Optional<Int> {
        return self.customerId
    }

    /**
     Getter for Edit_Customer.

     - Returns:  Optional<String>
     */
    public func getEditCustomer() -> Optional<String> {
        return self.editCustomer
    }

    /**
     Getter for Customer_Login.

     - Returns:  Optional<String>
     */
    public func getCustomerLogin() -> Optional<String> {
        return self.customerLogin
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
    }

    /**
     Setter for Customer_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerId(_ value: Optional<Int>) -> Self {
        self.customerId = value
        return self
    }

    /**
     Setter for Edit_Customer.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditCustomer(_ value: Optional<String>) -> Self {
        self.editCustomer = value
        return self
    }

    /**
     Setter for Customer_Login.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerLogin(_ value: Optional<String>) -> Self {
        self.customerLogin = value
        return self
    }
}
