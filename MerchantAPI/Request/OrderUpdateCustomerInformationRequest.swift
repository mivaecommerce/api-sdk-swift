/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: OrderUpdateCustomerInformationRequest.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 Handles API Request Order_Update_Customer_Information.

 - SeeAlso: https://docs.miva.com/json-api/functions/order_update_customer_information
 */
public class OrderUpdateCustomerInformationRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Order_Update_Customer_Information"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field Order_ID.
    var orderId : Optional<Int>

    /// Request field Customer_ID.
    var customerId : Optional<Int>

    /// Request field Ship_Residential.
    var shipResidential : Optional<Bool>

    /// Request field Ship_FirstName.
    var shipFirstName : Optional<String>

    /// Request field Ship_LastName.
    var shipLastName : Optional<String>

    /// Request field Ship_Email.
    var shipEmail : Optional<String>

    /// Request field Ship_Phone.
    var shipPhone : Optional<String>

    /// Request field Ship_Fax.
    var shipFax : Optional<String>

    /// Request field Ship_Company.
    var shipCompany : Optional<String>

    /// Request field Ship_Address1.
    var shipAddress1 : Optional<String>

    /// Request field Ship_Address2.
    var shipAddress2 : Optional<String>

    /// Request field Ship_City.
    var shipCity : Optional<String>

    /// Request field Ship_State.
    var shipState : Optional<String>

    /// Request field Ship_Zip.
    var shipZip : Optional<String>

    /// Request field Ship_Country.
    var shipCountry : Optional<String>

    /// Request field Bill_FirstName.
    var billFirstName : Optional<String>

    /// Request field Bill_LastName.
    var billLastName : Optional<String>

    /// Request field Bill_Email.
    var billEmail : Optional<String>

    /// Request field Bill_Phone.
    var billPhone : Optional<String>

    /// Request field Bill_Fax.
    var billFax : Optional<String>

    /// Request field Bill_Company.
    var billCompany : Optional<String>

    /// Request field Bill_Address1.
    var billAddress1 : Optional<String>

    /// Request field Bill_Address2.
    var billAddress2 : Optional<String>

    /// Request field Bill_City.
    var billCity : Optional<String>

    /// Request field Bill_State.
    var billState : Optional<String>

    /// Request field Bill_Zip.
    var billZip : Optional<String>

    /// Request field Bill_Country.
    var billCountry : Optional<String>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderId = "Order_ID"
        case customerId = "Customer_ID"
        case shipResidential = "Ship_Residential"
        case shipFirstName = "Ship_FirstName"
        case shipLastName = "Ship_LastName"
        case shipEmail = "Ship_Email"
        case shipPhone = "Ship_Phone"
        case shipFax = "Ship_Fax"
        case shipCompany = "Ship_Company"
        case shipAddress1 = "Ship_Address1"
        case shipAddress2 = "Ship_Address2"
        case shipCity = "Ship_City"
        case shipState = "Ship_State"
        case shipZip = "Ship_Zip"
        case shipCountry = "Ship_Country"
        case billFirstName = "Bill_FirstName"
        case billLastName = "Bill_LastName"
        case billEmail = "Bill_Email"
        case billPhone = "Bill_Phone"
        case billFax = "Bill_Fax"
        case billCompany = "Bill_Company"
        case billAddress1 = "Bill_Address1"
        case billAddress2 = "Bill_Address2"
        case billCity = "Bill_City"
        case billState = "Bill_State"
        case billZip = "Bill_Zip"
        case billCountry = "Bill_Country"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - order: An optional Order instance.
     */
    public init(client: Optional<Client> = nil, order: Optional<Order> = nil) {
        super.init(client: client)
        if let order = order {
            self.orderId = order.id
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

        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encodeIfPresent(self.shipResidential, forKey: .shipResidential)
        try container.encodeIfPresent(self.shipFirstName, forKey: .shipFirstName)
        try container.encodeIfPresent(self.shipLastName, forKey: .shipLastName)
        try container.encodeIfPresent(self.shipEmail, forKey: .shipEmail)
        try container.encodeIfPresent(self.shipPhone, forKey: .shipPhone)
        try container.encodeIfPresent(self.shipFax, forKey: .shipFax)
        try container.encodeIfPresent(self.shipCompany, forKey: .shipCompany)
        try container.encodeIfPresent(self.shipAddress1, forKey: .shipAddress1)
        try container.encodeIfPresent(self.shipAddress2, forKey: .shipAddress2)
        try container.encodeIfPresent(self.shipCity, forKey: .shipCity)
        try container.encodeIfPresent(self.shipState, forKey: .shipState)
        try container.encodeIfPresent(self.shipZip, forKey: .shipZip)
        try container.encodeIfPresent(self.shipCountry, forKey: .shipCountry)
        try container.encodeIfPresent(self.billFirstName, forKey: .billFirstName)
        try container.encodeIfPresent(self.billLastName, forKey: .billLastName)
        try container.encodeIfPresent(self.billEmail, forKey: .billEmail)
        try container.encodeIfPresent(self.billPhone, forKey: .billPhone)
        try container.encodeIfPresent(self.billFax, forKey: .billFax)
        try container.encodeIfPresent(self.billCompany, forKey: .billCompany)
        try container.encodeIfPresent(self.billAddress1, forKey: .billAddress1)
        try container.encodeIfPresent(self.billAddress2, forKey: .billAddress2)
        try container.encodeIfPresent(self.billCity, forKey: .billCity)
        try container.encodeIfPresent(self.billState, forKey: .billState)
        try container.encodeIfPresent(self.billZip, forKey: .billZip)
        try container.encodeIfPresent(self.billCountry, forKey: .billCountry)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderUpdateCustomerInformationResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (OrderUpdateCustomerInformationResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? OrderUpdateCustomerInformationResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? OrderUpdateCustomerInformationResponse, error)
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
    public override func createResponse(data : Data) throws -> OrderUpdateCustomerInformationResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(OrderUpdateCustomerInformationResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderUpdateCustomerInformationResponse.self
    }
    
    /**
     Getter for Order_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
    }
    
    /**
     Getter for Customer_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getCustomerId() -> Optional<Int> {
        return self.customerId
    }
    
    /**
     Getter for Ship_Residential.
     
     - Returns:  Optional<Bool> 
     */
    public func getShipResidential() -> Optional<Bool> {
        return self.shipResidential
    }
    
    /**
     Getter for Ship_FirstName.

     - Returns:  Optional<String> 
     */
    public func getShipFirstName() -> Optional<String> {
        return self.shipFirstName
    }
    
    /**
     Getter for Ship_LastName.

     - Returns:  Optional<String> 
     */
    public func getShipLastName() -> Optional<String> {
        return self.shipLastName
    }
    
    /**
     Getter for Ship_Email.

     - Returns:  Optional<String> 
     */
    public func getShipEmail() -> Optional<String> {
        return self.shipEmail
    }
    
    /**
     Getter for Ship_Phone.

     - Returns:  Optional<String> 
     */
    public func getShipPhone() -> Optional<String> {
        return self.shipPhone
    }
    
    /**
     Getter for Ship_Fax.

     - Returns:  Optional<String> 
     */
    public func getShipFax() -> Optional<String> {
        return self.shipFax
    }
    
    /**
     Getter for Ship_Company.

     - Returns:  Optional<String> 
     */
    public func getShipCompany() -> Optional<String> {
        return self.shipCompany
    }
    
    /**
     Getter for Ship_Address1.

     - Returns:  Optional<String> 
     */
    public func getShipAddress1() -> Optional<String> {
        return self.shipAddress1
    }
    
    /**
     Getter for Ship_Address2.

     - Returns:  Optional<String> 
     */
    public func getShipAddress2() -> Optional<String> {
        return self.shipAddress2
    }
    
    /**
     Getter for Ship_City.

     - Returns:  Optional<String> 
     */
    public func getShipCity() -> Optional<String> {
        return self.shipCity
    }
    
    /**
     Getter for Ship_State.

     - Returns:  Optional<String> 
     */
    public func getShipState() -> Optional<String> {
        return self.shipState
    }
    
    /**
     Getter for Ship_Zip.

     - Returns:  Optional<String> 
     */
    public func getShipZip() -> Optional<String> {
        return self.shipZip
    }
    
    /**
     Getter for Ship_Country.

     - Returns:  Optional<String> 
     */
    public func getShipCountry() -> Optional<String> {
        return self.shipCountry
    }
    
    /**
     Getter for Bill_FirstName.

     - Returns:  Optional<String> 
     */
    public func getBillFirstName() -> Optional<String> {
        return self.billFirstName
    }
    
    /**
     Getter for Bill_LastName.

     - Returns:  Optional<String> 
     */
    public func getBillLastName() -> Optional<String> {
        return self.billLastName
    }
    
    /**
     Getter for Bill_Email.

     - Returns:  Optional<String> 
     */
    public func getBillEmail() -> Optional<String> {
        return self.billEmail
    }
    
    /**
     Getter for Bill_Phone.

     - Returns:  Optional<String> 
     */
    public func getBillPhone() -> Optional<String> {
        return self.billPhone
    }
    
    /**
     Getter for Bill_Fax.

     - Returns:  Optional<String> 
     */
    public func getBillFax() -> Optional<String> {
        return self.billFax
    }
    
    /**
     Getter for Bill_Company.

     - Returns:  Optional<String> 
     */
    public func getBillCompany() -> Optional<String> {
        return self.billCompany
    }
    
    /**
     Getter for Bill_Address1.

     - Returns:  Optional<String> 
     */
    public func getBillAddress1() -> Optional<String> {
        return self.billAddress1
    }
    
    /**
     Getter for Bill_Address2.

     - Returns:  Optional<String> 
     */
    public func getBillAddress2() -> Optional<String> {
        return self.billAddress2
    }
    
    /**
     Getter for Bill_City.

     - Returns:  Optional<String> 
     */
    public func getBillCity() -> Optional<String> {
        return self.billCity
    }
    
    /**
     Getter for Bill_State.

     - Returns:  Optional<String> 
     */
    public func getBillState() -> Optional<String> {
        return self.billState
    }
    
    /**
     Getter for Bill_Zip.

     - Returns:  Optional<String> 
     */
    public func getBillZip() -> Optional<String> {
        return self.billZip
    }
    
    /**
     Getter for Bill_Country.

     - Returns:  Optional<String> 
     */
    public func getBillCountry() -> Optional<String> {
        return self.billCountry
    }
    
    /**
     Setter for Order_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOrderId(_ value: Optional<Int>) -> Self {
        self.orderId = value
        return self
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
     Setter for Ship_Residential.
     
     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setShipResidential(_ value: Optional<Bool>) -> Self {
        self.shipResidential = value
        return self
    }
    
    /**
     Setter for Ship_FirstName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipFirstName(_ value: Optional<String>) -> Self {
        self.shipFirstName = value
        return self
    }
    
    /**
     Setter for Ship_LastName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipLastName(_ value: Optional<String>) -> Self {
        self.shipLastName = value
        return self
    }
    
    /**
     Setter for Ship_Email.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipEmail(_ value: Optional<String>) -> Self {
        self.shipEmail = value
        return self
    }
    
    /**
     Setter for Ship_Phone.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipPhone(_ value: Optional<String>) -> Self {
        self.shipPhone = value
        return self
    }
    
    /**
     Setter for Ship_Fax.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipFax(_ value: Optional<String>) -> Self {
        self.shipFax = value
        return self
    }
    
    /**
     Setter for Ship_Company.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipCompany(_ value: Optional<String>) -> Self {
        self.shipCompany = value
        return self
    }
    
    /**
     Setter for Ship_Address1.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipAddress1(_ value: Optional<String>) -> Self {
        self.shipAddress1 = value
        return self
    }
    
    /**
     Setter for Ship_Address2.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipAddress2(_ value: Optional<String>) -> Self {
        self.shipAddress2 = value
        return self
    }
    
    /**
     Setter for Ship_City.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipCity(_ value: Optional<String>) -> Self {
        self.shipCity = value
        return self
    }
    
    /**
     Setter for Ship_State.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipState(_ value: Optional<String>) -> Self {
        self.shipState = value
        return self
    }
    
    /**
     Setter for Ship_Zip.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipZip(_ value: Optional<String>) -> Self {
        self.shipZip = value
        return self
    }
    
    /**
     Setter for Ship_Country.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipCountry(_ value: Optional<String>) -> Self {
        self.shipCountry = value
        return self
    }
    
    /**
     Setter for Bill_FirstName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillFirstName(_ value: Optional<String>) -> Self {
        self.billFirstName = value
        return self
    }
    
    /**
     Setter for Bill_LastName.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillLastName(_ value: Optional<String>) -> Self {
        self.billLastName = value
        return self
    }
    
    /**
     Setter for Bill_Email.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillEmail(_ value: Optional<String>) -> Self {
        self.billEmail = value
        return self
    }
    
    /**
     Setter for Bill_Phone.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillPhone(_ value: Optional<String>) -> Self {
        self.billPhone = value
        return self
    }
    
    /**
     Setter for Bill_Fax.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillFax(_ value: Optional<String>) -> Self {
        self.billFax = value
        return self
    }
    
    /**
     Setter for Bill_Company.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillCompany(_ value: Optional<String>) -> Self {
        self.billCompany = value
        return self
    }
    
    /**
     Setter for Bill_Address1.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillAddress1(_ value: Optional<String>) -> Self {
        self.billAddress1 = value
        return self
    }
    
    /**
     Setter for Bill_Address2.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillAddress2(_ value: Optional<String>) -> Self {
        self.billAddress2 = value
        return self
    }
    
    /**
     Setter for Bill_City.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillCity(_ value: Optional<String>) -> Self {
        self.billCity = value
        return self
    }
    
    /**
     Setter for Bill_State.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillState(_ value: Optional<String>) -> Self {
        self.billState = value
        return self
    }
    
    /**
     Setter for Bill_Zip.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillZip(_ value: Optional<String>) -> Self {
        self.billZip = value
        return self
    }
    
    /**
     Setter for Bill_Country.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillCountry(_ value: Optional<String>) -> Self {
        self.billCountry = value
        return self
    }
}
