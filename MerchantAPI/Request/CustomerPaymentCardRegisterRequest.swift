/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CustomerPaymentCardRegisterRequest.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 Handles API Request CustomerPaymentCard_Register.

 - SeeAlso: https://docs.miva.com/json-api/functions/customerpaymentcard_register
 */
public class CustomerPaymentCardRegisterRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CustomerPaymentCard_Register"
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

    /// Request field FirstName.
    var firstName : Optional<String>

    /// Request field LastName.
    var lastName : Optional<String>

    /// Request field CardType.
    var cardType : Optional<String>

    /// Request field CardNumber.
    var cardNumber : Optional<String>

    /// Request field ExpirationMonth.
    var expirationMonth : Optional<Int>

    /// Request field ExpirationYear.
    var expirationYear : Optional<Int>

    /// Request field Address1.
    var address1 : Optional<String>

    /// Request field Address2.
    var address2 : Optional<String>

    /// Request field City.
    var city : Optional<String>

    /// Request field State.
    var state : Optional<String>

    /// Request field Zip.
    var zip : Optional<String>

    /// Request field Country.
    var country : Optional<String>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case customerId = "Customer_ID"
        case editCustomer = "Edit_Customer"
        case customerLogin = "Customer_Login"
        case firstName = "FirstName"
        case lastName = "LastName"
        case cardType = "CardType"
        case cardNumber = "CardNumber"
        case expirationMonth = "ExpirationMonth"
        case expirationYear = "ExpirationYear"
        case address1 = "Address1"
        case address2 = "Address2"
        case city = "City"
        case state = "State"
        case zip = "Zip"
        case country = "Country"
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

        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.cardType, forKey: .cardType)
        try container.encodeIfPresent(self.cardNumber, forKey: .cardNumber)
        try container.encodeIfPresent(self.expirationMonth, forKey: .expirationMonth)
        try container.encodeIfPresent(self.expirationYear, forKey: .expirationYear)
        try container.encodeIfPresent(self.address1, forKey: .address1)
        try container.encodeIfPresent(self.address2, forKey: .address2)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zip, forKey: .zip)
        try container.encodeIfPresent(self.country, forKey: .country)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CustomerPaymentCardRegisterResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CustomerPaymentCardRegisterResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CustomerPaymentCardRegisterResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CustomerPaymentCardRegisterResponse, error)
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
    public override func createResponse(data : Data) throws -> CustomerPaymentCardRegisterResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CustomerPaymentCardRegisterResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerPaymentCardRegisterResponse.self
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
     Getter for FirstName.

     - Returns:  Optional<String> 
     */
    public func getFirstName() -> Optional<String> {
        return self.firstName
    }
    
    /**
     Getter for LastName.

     - Returns:  Optional<String> 
     */
    public func getLastName() -> Optional<String> {
        return self.lastName
    }
    
    /**
     Getter for CardType.

     - Returns:  Optional<String> 
     */
    public func getCardType() -> Optional<String> {
        return self.cardType
    }
    
    /**
     Getter for CardNumber.

     - Returns:  Optional<String> 
     */
    public func getCardNumber() -> Optional<String> {
        return self.cardNumber
    }
    
    /**
     Getter for ExpirationMonth.
     
     - Returns:  Optional<Int> 
     */
    public func getExpirationMonth() -> Optional<Int> {
        return self.expirationMonth
    }
    
    /**
     Getter for ExpirationYear.
     
     - Returns:  Optional<Int> 
     */
    public func getExpirationYear() -> Optional<Int> {
        return self.expirationYear
    }
    
    /**
     Getter for Address1.

     - Returns:  Optional<String> 
     */
    public func getAddress1() -> Optional<String> {
        return self.address1
    }
    
    /**
     Getter for Address2.

     - Returns:  Optional<String> 
     */
    public func getAddress2() -> Optional<String> {
        return self.address2
    }
    
    /**
     Getter for City.

     - Returns:  Optional<String> 
     */
    public func getCity() -> Optional<String> {
        return self.city
    }
    
    /**
     Getter for State.

     - Returns:  Optional<String> 
     */
    public func getState() -> Optional<String> {
        return self.state
    }
    
    /**
     Getter for Zip.

     - Returns:  Optional<String> 
     */
    public func getZip() -> Optional<String> {
        return self.zip
    }
    
    /**
     Getter for Country.

     - Returns:  Optional<String> 
     */
    public func getCountry() -> Optional<String> {
        return self.country
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
    
    /**
     Setter for FirstName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setFirstName(_ value: Optional<String>) -> Self {
        self.firstName = value
        return self
    }
    
    /**
     Setter for LastName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setLastName(_ value: Optional<String>) -> Self {
        self.lastName = value
        return self
    }
    
    /**
     Setter for CardType.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCardType(_ value: Optional<String>) -> Self {
        self.cardType = value
        return self
    }
    
    /**
     Setter for CardNumber.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCardNumber(_ value: Optional<String>) -> Self {
        self.cardNumber = value
        return self
    }
    
    /**
     Setter for ExpirationMonth.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setExpirationMonth(_ value: Optional<Int>) -> Self {
        self.expirationMonth = value
        return self
    }
    
    /**
     Setter for ExpirationYear.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setExpirationYear(_ value: Optional<Int>) -> Self {
        self.expirationYear = value
        return self
    }
    
    /**
     Setter for Address1.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAddress1(_ value: Optional<String>) -> Self {
        self.address1 = value
        return self
    }
    
    /**
     Setter for Address2.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAddress2(_ value: Optional<String>) -> Self {
        self.address2 = value
        return self
    }
    
    /**
     Setter for City.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCity(_ value: Optional<String>) -> Self {
        self.city = value
        return self
    }
    
    /**
     Setter for State.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setState(_ value: Optional<String>) -> Self {
        self.state = value
        return self
    }
    
    /**
     Setter for Zip.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setZip(_ value: Optional<String>) -> Self {
        self.zip = value
        return self
    }
    
    /**
     Setter for Country.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCountry(_ value: Optional<String>) -> Self {
        self.country = value
        return self
    }
}
