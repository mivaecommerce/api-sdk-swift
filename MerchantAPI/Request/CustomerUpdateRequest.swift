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
 Handles API Request Customer_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/customer_update
 */
public class CustomerUpdateRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Customer_Update"
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

    /// Request field Customer_PasswordEmail.
    var customerPasswordEmail : Optional<String>

    /// Request field Customer_Password.
    var customerPassword : Optional<String>

    /// Request field Customer_ShipResidential.
    var customerShipResidential : Optional<Bool>

    /// Request field Customer_ShipFirstName.
    var customerShipFirstName : Optional<String>

    /// Request field Customer_ShipLastName.
    var customerShipLastName : Optional<String>

    /// Request field Customer_ShipEmail.
    var customerShipEmail : Optional<String>

    /// Request field Customer_ShipCompany.
    var customerShipCompany : Optional<String>

    /// Request field Customer_ShipPhone.
    var customerShipPhone : Optional<String>

    /// Request field Customer_ShipFax.
    var customerShipFax : Optional<String>

    /// Request field Customer_ShipAddress1.
    var customerShipAddress1 : Optional<String>

    /// Request field Customer_ShipAddress2.
    var customerShipAddress2 : Optional<String>

    /// Request field Customer_ShipCity.
    var customerShipCity : Optional<String>

    /// Request field Customer_ShipState.
    var customerShipState : Optional<String>

    /// Request field Customer_ShipZip.
    var customerShipZip : Optional<String>

    /// Request field Customer_ShipCountry.
    var customerShipCountry : Optional<String>

    /// Request field Customer_BillFirstName.
    var customerBillFirstName : Optional<String>

    /// Request field Customer_BillLastName.
    var customerBillLastName : Optional<String>

    /// Request field Customer_BillEmail.
    var customerBillEmail : Optional<String>

    /// Request field Customer_BillCompany.
    var customerBillCompany : Optional<String>

    /// Request field Customer_BillPhone.
    var customerBillPhone : Optional<String>

    /// Request field Customer_BillFax.
    var customerBillFax : Optional<String>

    /// Request field Customer_BillAddress1.
    var customerBillAddress1 : Optional<String>

    /// Request field Customer_BillAddress2.
    var customerBillAddress2 : Optional<String>

    /// Request field Customer_BillCity.
    var customerBillCity : Optional<String>

    /// Request field Customer_BillState.
    var customerBillState : Optional<String>

    /// Request field Customer_BillZip.
    var customerBillZip : Optional<String>

    /// Request field Customer_BillCountry.
    var customerBillCountry : Optional<String>

    /// Request field Customer_Tax_Exempt.
    var customerTaxExempt : Optional<String>

    /// Request field Customer_BusinessAccount.
    var customerBusinessAccount : Optional<String>

    /// Request field CustomField_Values.
    var customFieldValues : CustomFieldValues
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case customerId = "Customer_ID"
        case editCustomer = "Edit_Customer"
        case customerLogin = "Customer_Login"
        case customerPasswordEmail = "Customer_PasswordEmail"
        case customerPassword = "Customer_Password"
        case customerShipResidential = "Customer_ShipResidential"
        case customerShipFirstName = "Customer_ShipFirstName"
        case customerShipLastName = "Customer_ShipLastName"
        case customerShipEmail = "Customer_ShipEmail"
        case customerShipCompany = "Customer_ShipCompany"
        case customerShipPhone = "Customer_ShipPhone"
        case customerShipFax = "Customer_ShipFax"
        case customerShipAddress1 = "Customer_ShipAddress1"
        case customerShipAddress2 = "Customer_ShipAddress2"
        case customerShipCity = "Customer_ShipCity"
        case customerShipState = "Customer_ShipState"
        case customerShipZip = "Customer_ShipZip"
        case customerShipCountry = "Customer_ShipCountry"
        case customerBillFirstName = "Customer_BillFirstName"
        case customerBillLastName = "Customer_BillLastName"
        case customerBillEmail = "Customer_BillEmail"
        case customerBillCompany = "Customer_BillCompany"
        case customerBillPhone = "Customer_BillPhone"
        case customerBillFax = "Customer_BillFax"
        case customerBillAddress1 = "Customer_BillAddress1"
        case customerBillAddress2 = "Customer_BillAddress2"
        case customerBillCity = "Customer_BillCity"
        case customerBillState = "Customer_BillState"
        case customerBillZip = "Customer_BillZip"
        case customerBillCountry = "Customer_BillCountry"
        case customerTaxExempt = "Customer_Tax_Exempt"
        case customerBusinessAccount = "Customer_BusinessAccount"
        case customFieldValues = "CustomField_Values"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - customer: An optional Customer instance.
     */
    public init(client: Optional<Client> = nil, customer: Optional<Customer> = nil) {
        self.customFieldValues = CustomFieldValues()
        super.init(client: client)
        if let customer = customer {
            if customer.id > 0 {
                self.customerId = customer.id
            } else if customer.login.count > 0 {
                self.editCustomer = customer.login
            }

            self.customerLogin = customer.login
            self.customerPasswordEmail = customer.passwordEmail
            self.customerShipResidential = customer.shippingResidential
            self.customerShipFirstName = customer.shipFirstName
            self.customerShipLastName = customer.shipLastName
            self.customerShipEmail = customer.shipEmail
            self.customerShipCompany = customer.shipCompany
            self.customerShipPhone = customer.shipPhone
            self.customerShipFax = customer.shipFax
            self.customerShipAddress1 = customer.shipAddress1
            self.customerShipAddress2 = customer.shipAddress2
            self.customerShipCity = customer.shipCity
            self.customerShipState = customer.shipState
            self.customerShipZip = customer.shipZip
            self.customerShipCountry = customer.shipCountry
            self.customerBillFirstName = customer.billFirstName
            self.customerBillLastName = customer.billLastName
            self.customerBillEmail = customer.billEmail
            self.customerBillCompany = customer.billCompany
            self.customerBillPhone = customer.billPhone
            self.customerBillFax = customer.billFax
            self.customerBillAddress1 = customer.billAddress1
            self.customerBillAddress2 = customer.billAddress2
            self.customerBillCity = customer.billCity
            self.customerBillState = customer.billState
            self.customerBillZip = customer.billZip
            self.customerBillCountry = customer.billCountry
            self.customerBusinessAccount = customer.businessTitle
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
        }

        try container.encodeIfPresent(self.customerLogin, forKey: .customerLogin)
        try container.encodeIfPresent(self.customerPasswordEmail, forKey: .customerPasswordEmail)
        try container.encodeIfPresent(self.customerPassword, forKey: .customerPassword)
        try container.encodeIfPresent(self.customerShipResidential, forKey: .customerShipResidential)
        try container.encodeIfPresent(self.customerShipFirstName, forKey: .customerShipFirstName)
        try container.encodeIfPresent(self.customerShipLastName, forKey: .customerShipLastName)
        try container.encodeIfPresent(self.customerShipEmail, forKey: .customerShipEmail)
        try container.encodeIfPresent(self.customerShipCompany, forKey: .customerShipCompany)
        try container.encodeIfPresent(self.customerShipPhone, forKey: .customerShipPhone)
        try container.encodeIfPresent(self.customerShipFax, forKey: .customerShipFax)
        try container.encodeIfPresent(self.customerShipAddress1, forKey: .customerShipAddress1)
        try container.encodeIfPresent(self.customerShipAddress2, forKey: .customerShipAddress2)
        try container.encodeIfPresent(self.customerShipCity, forKey: .customerShipCity)
        try container.encodeIfPresent(self.customerShipState, forKey: .customerShipState)
        try container.encodeIfPresent(self.customerShipZip, forKey: .customerShipZip)
        try container.encodeIfPresent(self.customerShipCountry, forKey: .customerShipCountry)
        try container.encodeIfPresent(self.customerBillFirstName, forKey: .customerBillFirstName)
        try container.encodeIfPresent(self.customerBillLastName, forKey: .customerBillLastName)
        try container.encodeIfPresent(self.customerBillEmail, forKey: .customerBillEmail)
        try container.encodeIfPresent(self.customerBillCompany, forKey: .customerBillCompany)
        try container.encodeIfPresent(self.customerBillPhone, forKey: .customerBillPhone)
        try container.encodeIfPresent(self.customerBillFax, forKey: .customerBillFax)
        try container.encodeIfPresent(self.customerBillAddress1, forKey: .customerBillAddress1)
        try container.encodeIfPresent(self.customerBillAddress2, forKey: .customerBillAddress2)
        try container.encodeIfPresent(self.customerBillCity, forKey: .customerBillCity)
        try container.encodeIfPresent(self.customerBillState, forKey: .customerBillState)
        try container.encodeIfPresent(self.customerBillZip, forKey: .customerBillZip)
        try container.encodeIfPresent(self.customerBillCountry, forKey: .customerBillCountry)
        try container.encodeIfPresent(self.customerTaxExempt, forKey: .customerTaxExempt)
        try container.encodeIfPresent(self.customerBusinessAccount, forKey: .customerBusinessAccount)
        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CustomerUpdateResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CustomerUpdateResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CustomerUpdateResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CustomerUpdateResponse, error)
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
    public override func createResponse(data : Data) throws -> CustomerUpdateResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CustomerUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerUpdateResponse.self
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
     Getter for Customer_PasswordEmail.

     - Returns:  Optional<String> 
     */
    public func getCustomerPasswordEmail() -> Optional<String> {
        return self.customerPasswordEmail
    }
    
    /**
     Getter for Customer_Password.

     - Returns:  Optional<String> 
     */
    public func getCustomerPassword() -> Optional<String> {
        return self.customerPassword
    }
    
    /**
     Getter for Customer_ShipResidential.
     
     - Returns:  Optional<Bool> 
     */
    public func getCustomerShipResidential() -> Optional<Bool> {
        return self.customerShipResidential
    }
    
    /**
     Getter for Customer_ShipFirstName.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipFirstName() -> Optional<String> {
        return self.customerShipFirstName
    }
    
    /**
     Getter for Customer_ShipLastName.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipLastName() -> Optional<String> {
        return self.customerShipLastName
    }
    
    /**
     Getter for Customer_ShipEmail.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipEmail() -> Optional<String> {
        return self.customerShipEmail
    }
    
    /**
     Getter for Customer_ShipCompany.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipCompany() -> Optional<String> {
        return self.customerShipCompany
    }
    
    /**
     Getter for Customer_ShipPhone.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipPhone() -> Optional<String> {
        return self.customerShipPhone
    }
    
    /**
     Getter for Customer_ShipFax.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipFax() -> Optional<String> {
        return self.customerShipFax
    }
    
    /**
     Getter for Customer_ShipAddress1.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipAddress1() -> Optional<String> {
        return self.customerShipAddress1
    }
    
    /**
     Getter for Customer_ShipAddress2.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipAddress2() -> Optional<String> {
        return self.customerShipAddress2
    }
    
    /**
     Getter for Customer_ShipCity.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipCity() -> Optional<String> {
        return self.customerShipCity
    }
    
    /**
     Getter for Customer_ShipState.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipState() -> Optional<String> {
        return self.customerShipState
    }
    
    /**
     Getter for Customer_ShipZip.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipZip() -> Optional<String> {
        return self.customerShipZip
    }
    
    /**
     Getter for Customer_ShipCountry.

     - Returns:  Optional<String> 
     */
    public func getCustomerShipCountry() -> Optional<String> {
        return self.customerShipCountry
    }
    
    /**
     Getter for Customer_BillFirstName.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillFirstName() -> Optional<String> {
        return self.customerBillFirstName
    }
    
    /**
     Getter for Customer_BillLastName.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillLastName() -> Optional<String> {
        return self.customerBillLastName
    }
    
    /**
     Getter for Customer_BillEmail.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillEmail() -> Optional<String> {
        return self.customerBillEmail
    }
    
    /**
     Getter for Customer_BillCompany.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillCompany() -> Optional<String> {
        return self.customerBillCompany
    }
    
    /**
     Getter for Customer_BillPhone.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillPhone() -> Optional<String> {
        return self.customerBillPhone
    }
    
    /**
     Getter for Customer_BillFax.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillFax() -> Optional<String> {
        return self.customerBillFax
    }
    
    /**
     Getter for Customer_BillAddress1.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillAddress1() -> Optional<String> {
        return self.customerBillAddress1
    }
    
    /**
     Getter for Customer_BillAddress2.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillAddress2() -> Optional<String> {
        return self.customerBillAddress2
    }
    
    /**
     Getter for Customer_BillCity.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillCity() -> Optional<String> {
        return self.customerBillCity
    }
    
    /**
     Getter for Customer_BillState.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillState() -> Optional<String> {
        return self.customerBillState
    }
    
    /**
     Getter for Customer_BillZip.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillZip() -> Optional<String> {
        return self.customerBillZip
    }
    
    /**
     Getter for Customer_BillCountry.

     - Returns:  Optional<String> 
     */
    public func getCustomerBillCountry() -> Optional<String> {
        return self.customerBillCountry
    }
    
    /**
     Getter for Customer_Tax_Exempt.

     - Returns:  Optional<String> 
     */
    public func getCustomerTaxExempt() -> Optional<String> {
        return self.customerTaxExempt
    }
    
    /**
     Getter for Customer_BusinessAccount.

     - Returns:  Optional<String> 
     */
    public func getCustomerBusinessAccount() -> Optional<String> {
        return self.customerBusinessAccount
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
    
    /**
     Setter for Customer_PasswordEmail.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerPasswordEmail(_ value: Optional<String>) -> Self {
        self.customerPasswordEmail = value
        return self
    }
    
    /**
     Setter for Customer_Password.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerPassword(_ value: Optional<String>) -> Self {
        self.customerPassword = value
        return self
    }
    
    /**
     Setter for Customer_ShipResidential.
     
     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipResidential(_ value: Optional<Bool>) -> Self {
        self.customerShipResidential = value
        return self
    }
    
    /**
     Setter for Customer_ShipFirstName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipFirstName(_ value: Optional<String>) -> Self {
        self.customerShipFirstName = value
        return self
    }
    
    /**
     Setter for Customer_ShipLastName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipLastName(_ value: Optional<String>) -> Self {
        self.customerShipLastName = value
        return self
    }
    
    /**
     Setter for Customer_ShipEmail.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipEmail(_ value: Optional<String>) -> Self {
        self.customerShipEmail = value
        return self
    }
    
    /**
     Setter for Customer_ShipCompany.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipCompany(_ value: Optional<String>) -> Self {
        self.customerShipCompany = value
        return self
    }
    
    /**
     Setter for Customer_ShipPhone.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipPhone(_ value: Optional<String>) -> Self {
        self.customerShipPhone = value
        return self
    }
    
    /**
     Setter for Customer_ShipFax.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipFax(_ value: Optional<String>) -> Self {
        self.customerShipFax = value
        return self
    }
    
    /**
     Setter for Customer_ShipAddress1.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipAddress1(_ value: Optional<String>) -> Self {
        self.customerShipAddress1 = value
        return self
    }
    
    /**
     Setter for Customer_ShipAddress2.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipAddress2(_ value: Optional<String>) -> Self {
        self.customerShipAddress2 = value
        return self
    }
    
    /**
     Setter for Customer_ShipCity.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipCity(_ value: Optional<String>) -> Self {
        self.customerShipCity = value
        return self
    }
    
    /**
     Setter for Customer_ShipState.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipState(_ value: Optional<String>) -> Self {
        self.customerShipState = value
        return self
    }
    
    /**
     Setter for Customer_ShipZip.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipZip(_ value: Optional<String>) -> Self {
        self.customerShipZip = value
        return self
    }
    
    /**
     Setter for Customer_ShipCountry.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerShipCountry(_ value: Optional<String>) -> Self {
        self.customerShipCountry = value
        return self
    }
    
    /**
     Setter for Customer_BillFirstName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillFirstName(_ value: Optional<String>) -> Self {
        self.customerBillFirstName = value
        return self
    }
    
    /**
     Setter for Customer_BillLastName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillLastName(_ value: Optional<String>) -> Self {
        self.customerBillLastName = value
        return self
    }
    
    /**
     Setter for Customer_BillEmail.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillEmail(_ value: Optional<String>) -> Self {
        self.customerBillEmail = value
        return self
    }
    
    /**
     Setter for Customer_BillCompany.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillCompany(_ value: Optional<String>) -> Self {
        self.customerBillCompany = value
        return self
    }
    
    /**
     Setter for Customer_BillPhone.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillPhone(_ value: Optional<String>) -> Self {
        self.customerBillPhone = value
        return self
    }
    
    /**
     Setter for Customer_BillFax.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillFax(_ value: Optional<String>) -> Self {
        self.customerBillFax = value
        return self
    }
    
    /**
     Setter for Customer_BillAddress1.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillAddress1(_ value: Optional<String>) -> Self {
        self.customerBillAddress1 = value
        return self
    }
    
    /**
     Setter for Customer_BillAddress2.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillAddress2(_ value: Optional<String>) -> Self {
        self.customerBillAddress2 = value
        return self
    }
    
    /**
     Setter for Customer_BillCity.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillCity(_ value: Optional<String>) -> Self {
        self.customerBillCity = value
        return self
    }
    
    /**
     Setter for Customer_BillState.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillState(_ value: Optional<String>) -> Self {
        self.customerBillState = value
        return self
    }
    
    /**
     Setter for Customer_BillZip.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillZip(_ value: Optional<String>) -> Self {
        self.customerBillZip = value
        return self
    }
    
    /**
     Setter for Customer_BillCountry.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBillCountry(_ value: Optional<String>) -> Self {
        self.customerBillCountry = value
        return self
    }
    
    /**
     Setter for Customer_Tax_Exempt.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerTaxExempt(_ value: Optional<String>) -> Self {
        self.customerTaxExempt = value
        return self
    }
    
    /**
     Setter for Customer_BusinessAccount.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerBusinessAccount(_ value: Optional<String>) -> Self {
        self.customerBusinessAccount = value
        return self
    }
}
