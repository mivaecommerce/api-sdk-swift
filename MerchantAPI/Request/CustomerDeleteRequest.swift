/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/**
 Handles API Request Customer_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/customer_delete
 */
public class CustomerDeleteRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Customer_Delete"
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

    /// Request field Customer_Login.
    var customerLogin : Optional<String>

    /// Request field Edit_Customer.
    var editCustomer : Optional<String>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case customerId = "Customer_ID"
        case customerLogin = "Customer_Login"
        case editCustomer = "Edit_Customer"
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
        } else if self.customerLogin != nil {
            try container.encode(self.customerLogin, forKey: .customerLogin)
        } else if self.editCustomer != nil {
            try container.encode(self.editCustomer, forKey: .editCustomer)
        }

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CustomerDeleteResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CustomerDeleteResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CustomerDeleteResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CustomerDeleteResponse, error)
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
    public override func createResponse(data : Data) throws -> CustomerDeleteResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CustomerDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerDeleteResponse.self
    }
    
    /**
     Getter for Customer_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getCustomerId() -> Optional<Int> {
        return self.customerId
    }
    
    /**
     Getter for Customer_Login.

     - Returns:  Optional<String> 
     */
    public func getCustomerLogin() -> Optional<String> {
        return self.customerLogin
    }
    
    /**
     Getter for Edit_Customer.

     - Returns:  Optional<String> 
     */
    public func getEditCustomer() -> Optional<String> {
        return self.editCustomer
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
}
