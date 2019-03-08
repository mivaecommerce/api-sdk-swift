/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CustomerAddressListLoadQueryRequest.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 Handles API Request CustomerAddressList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/customeraddresslist_load_query
 */
public class CustomerAddressListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CustomerAddressList_Load_Query"
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
    var customerId : Optional<Int>

    /// Request field Edit_Customer.
    var editCustomer : Optional<String>

    /// Request field Customer_Login.
    var customerLogin : Optional<String>
    
    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "cust_id",
                "id",
                "descrip",
                "fname",
                "lname",
                "email",
                "comp",
                "phone",
                "fax",
                "addr1",
                "addr2",
                "city",
                "state",
                "zip",
                "cntry",
                "resdntl"
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
                "cust_id",
                "id",
                "descrip",
                "fname",
                "lname",
                "email",
                "comp",
                "phone",
                "fax",
                "addr1",
                "addr2",
                "city",
                "state",
                "zip",
                "cntry",
                "resdntl"
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
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - customer: An optional Customer instance.
     */
    public init(client: Optional<Client> = nil, customer: Optional<Customer> = nil) {
        super.init(client: client)
        if let customer = customer {
            if customer.id > 0 {
                self.customerId = customer.id
            } else if customer.login.count > 0 {
                self.editCustomer = customer.login
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

        if self.customerId != nil {
            try container.encodeIfPresent(self.customerId, forKey: .customerId)
        } else if self.editCustomer != nil {
            try container.encode(self.editCustomer, forKey: .editCustomer)
        } else if self.customerLogin != nil {
            try container.encode(self.customerLogin, forKey: .customerLogin)
        }

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CustomerAddressListLoadQueryResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CustomerAddressListLoadQueryResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CustomerAddressListLoadQueryResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CustomerAddressListLoadQueryResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(data : Data) throws -> CustomerAddressListLoadQueryResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CustomerAddressListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerAddressListLoadQueryResponse.self
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
