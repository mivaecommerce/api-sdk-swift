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
 Handles API Request Order_Create.

 - SeeAlso: https://docs.miva.com/json-api/functions/order_create
 */
public class OrderCreateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Order_Create"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Customer_Login.
    var customerLogin : Optional<String> = nil

    /// Request field Customer_ID.
    var customerId : Optional<Int> = nil

    /// Request field ShipFirstName.
    var shipFirstName : Optional<String> = nil

    /// Request field ShipLastName.
    var shipLastName : Optional<String> = nil

    /// Request field ShipEmail.
    var shipEmail : Optional<String> = nil

    /// Request field ShipPhone.
    var shipPhone : Optional<String> = nil

    /// Request field ShipFax.
    var shipFax : Optional<String> = nil

    /// Request field ShipCompany.
    var shipCompany : Optional<String> = nil

    /// Request field ShipAddress1.
    var shipAddress1 : Optional<String> = nil

    /// Request field ShipAddress2.
    var shipAddress2 : Optional<String> = nil

    /// Request field ShipCity.
    var shipCity : Optional<String> = nil

    /// Request field ShipState.
    var shipState : Optional<String> = nil

    /// Request field ShipZip.
    var shipZip : Optional<String> = nil

    /// Request field ShipCountry.
    var shipCountry : Optional<String> = nil

    /// Request field ShipResidential.
    var shipResidential : Optional<Bool> = nil

    /// Request field BillFirstName.
    var billFirstName : Optional<String> = nil

    /// Request field BillLastName.
    var billLastName : Optional<String> = nil

    /// Request field BillEmail.
    var billEmail : Optional<String> = nil

    /// Request field BillPhone.
    var billPhone : Optional<String> = nil

    /// Request field BillFax.
    var billFax : Optional<String> = nil

    /// Request field BillCompany.
    var billCompany : Optional<String> = nil

    /// Request field BillAddress1.
    var billAddress1 : Optional<String> = nil

    /// Request field BillAddress2.
    var billAddress2 : Optional<String> = nil

    /// Request field BillCity.
    var billCity : Optional<String> = nil

    /// Request field BillState.
    var billState : Optional<String> = nil

    /// Request field BillZip.
    var billZip : Optional<String> = nil

    /// Request field BillCountry.
    var billCountry : Optional<String> = nil

    /// Request field Items.
    var items : [OrderItem] = []

    /// Request field Products.
    var products : [OrderProduct] = []

    /// Request field Charges.
    var charges : [OrderCharge] = []

    /// Request field CustomField_Values.
    var customFieldValues : CustomFieldValues

    /// Request field Shipping_Module_Code.
    var shippingModuleCode : Optional<String> = nil

    /// Request field Shipping_Module_Data.
    var shippingModuleData : Optional<String> = nil

    /// Request field CalculateCharges.
    var calculateCharges : Optional<Bool> = nil

    /// Request field TriggerFulfillmentModules.
    var triggerFulfillmentModules : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case customerLogin = "Customer_Login"
        case customerId = "Customer_ID"
        case shipFirstName = "ShipFirstName"
        case shipLastName = "ShipLastName"
        case shipEmail = "ShipEmail"
        case shipPhone = "ShipPhone"
        case shipFax = "ShipFax"
        case shipCompany = "ShipCompany"
        case shipAddress1 = "ShipAddress1"
        case shipAddress2 = "ShipAddress2"
        case shipCity = "ShipCity"
        case shipState = "ShipState"
        case shipZip = "ShipZip"
        case shipCountry = "ShipCountry"
        case shipResidential = "ShipResidential"
        case billFirstName = "BillFirstName"
        case billLastName = "BillLastName"
        case billEmail = "BillEmail"
        case billPhone = "BillPhone"
        case billFax = "BillFax"
        case billCompany = "BillCompany"
        case billAddress1 = "BillAddress1"
        case billAddress2 = "BillAddress2"
        case billCity = "BillCity"
        case billState = "BillState"
        case billZip = "BillZip"
        case billCountry = "BillCountry"
        case items = "Items"
        case products = "Products"
        case charges = "Charges"
        case customFieldValues = "CustomField_Values"
        case shippingModuleCode = "Shipping_Module_Code"
        case shippingModuleData = "Shipping_Module_Data"
        case calculateCharges = "CalculateCharges"
        case triggerFulfillmentModules = "TriggerFulfillmentModules"
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
                self.customerLogin = customer.login
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
        }

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
        try container.encodeIfPresent(self.shipResidential, forKey: .shipResidential)
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
        try container.encodeIfPresent(self.items, forKey: .items)
        try container.encodeIfPresent(self.products, forKey: .products)
        try container.encodeIfPresent(self.charges, forKey: .charges)
        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)
        try container.encodeIfPresent(self.shippingModuleCode, forKey: .shippingModuleCode)
        try container.encodeIfPresent(self.shippingModuleData, forKey: .shippingModuleData)
        try container.encodeIfPresent(self.calculateCharges, forKey: .calculateCharges)
        try container.encodeIfPresent(self.triggerFulfillmentModules, forKey: .triggerFulfillmentModules)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderCreateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderCreateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderCreateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderCreateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderCreateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderCreateResponse.self
    }

    /**
     Getter for Customer_Login.

     - Returns:  Optional<String>
     */
    public func getCustomerLogin() -> Optional<String> {
        return self.customerLogin
    }

    /**
     Getter for Customer_ID.

     - Returns:  Optional<Int>
     */
    public func getCustomerId() -> Optional<Int> {
        return self.customerId
    }

    /**
     Getter for ShipFirstName.

     - Returns:  Optional<String>
     */
    public func getShipFirstName() -> Optional<String> {
        return self.shipFirstName
    }

    /**
     Getter for ShipLastName.

     - Returns:  Optional<String>
     */
    public func getShipLastName() -> Optional<String> {
        return self.shipLastName
    }

    /**
     Getter for ShipEmail.

     - Returns:  Optional<String>
     */
    public func getShipEmail() -> Optional<String> {
        return self.shipEmail
    }

    /**
     Getter for ShipPhone.

     - Returns:  Optional<String>
     */
    public func getShipPhone() -> Optional<String> {
        return self.shipPhone
    }

    /**
     Getter for ShipFax.

     - Returns:  Optional<String>
     */
    public func getShipFax() -> Optional<String> {
        return self.shipFax
    }

    /**
     Getter for ShipCompany.

     - Returns:  Optional<String>
     */
    public func getShipCompany() -> Optional<String> {
        return self.shipCompany
    }

    /**
     Getter for ShipAddress1.

     - Returns:  Optional<String>
     */
    public func getShipAddress1() -> Optional<String> {
        return self.shipAddress1
    }

    /**
     Getter for ShipAddress2.

     - Returns:  Optional<String>
     */
    public func getShipAddress2() -> Optional<String> {
        return self.shipAddress2
    }

    /**
     Getter for ShipCity.

     - Returns:  Optional<String>
     */
    public func getShipCity() -> Optional<String> {
        return self.shipCity
    }

    /**
     Getter for ShipState.

     - Returns:  Optional<String>
     */
    public func getShipState() -> Optional<String> {
        return self.shipState
    }

    /**
     Getter for ShipZip.

     - Returns:  Optional<String>
     */
    public func getShipZip() -> Optional<String> {
        return self.shipZip
    }

    /**
     Getter for ShipCountry.

     - Returns:  Optional<String>
     */
    public func getShipCountry() -> Optional<String> {
        return self.shipCountry
    }

    /**
     Getter for ShipResidential.

     - Returns:  Optional<Bool>
     */
    public func getShipResidential() -> Optional<Bool> {
        return self.shipResidential
    }

    /**
     Getter for BillFirstName.

     - Returns:  Optional<String>
     */
    public func getBillFirstName() -> Optional<String> {
        return self.billFirstName
    }

    /**
     Getter for BillLastName.

     - Returns:  Optional<String>
     */
    public func getBillLastName() -> Optional<String> {
        return self.billLastName
    }

    /**
     Getter for BillEmail.

     - Returns:  Optional<String>
     */
    public func getBillEmail() -> Optional<String> {
        return self.billEmail
    }

    /**
     Getter for BillPhone.

     - Returns:  Optional<String>
     */
    public func getBillPhone() -> Optional<String> {
        return self.billPhone
    }

    /**
     Getter for BillFax.

     - Returns:  Optional<String>
     */
    public func getBillFax() -> Optional<String> {
        return self.billFax
    }

    /**
     Getter for BillCompany.

     - Returns:  Optional<String>
     */
    public func getBillCompany() -> Optional<String> {
        return self.billCompany
    }

    /**
     Getter for BillAddress1.

     - Returns:  Optional<String>
     */
    public func getBillAddress1() -> Optional<String> {
        return self.billAddress1
    }

    /**
     Getter for BillAddress2.

     - Returns:  Optional<String>
     */
    public func getBillAddress2() -> Optional<String> {
        return self.billAddress2
    }

    /**
     Getter for BillCity.

     - Returns:  Optional<String>
     */
    public func getBillCity() -> Optional<String> {
        return self.billCity
    }

    /**
     Getter for BillState.

     - Returns:  Optional<String>
     */
    public func getBillState() -> Optional<String> {
        return self.billState
    }

    /**
     Getter for BillZip.

     - Returns:  Optional<String>
     */
    public func getBillZip() -> Optional<String> {
        return self.billZip
    }

    /**
     Getter for BillCountry.

     - Returns:  Optional<String>
     */
    public func getBillCountry() -> Optional<String> {
        return self.billCountry
    }

    /**
     Getter for Items.

     - Returns:  [OrderItem]
     */
    public func getItems() -> [OrderItem] {
        return self.items
    }

    /**
     Getter for Products.

     - Returns:  [OrderProduct]
     */
    public func getProducts() -> [OrderProduct] {
        return self.products
    }

    /**
     Getter for Charges.

     - Returns:  [OrderCharge]
     */
    public func getCharges() -> [OrderCharge] {
        return self.charges
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
    }

    /**
     Getter for Shipping_Module_Code.

     - Returns:  Optional<String>
     */
    public func getShippingModuleCode() -> Optional<String> {
        return self.shippingModuleCode
    }

    /**
     Getter for Shipping_Module_Data.

     - Returns:  Optional<String>
     */
    public func getShippingModuleData() -> Optional<String> {
        return self.shippingModuleData
    }

    /**
     Getter for CalculateCharges.

     - Returns:  Optional<Bool>
     */
    public func getCalculateCharges() -> Optional<Bool> {
        return self.calculateCharges
    }

    /**
     Getter for TriggerFulfillmentModules.

     - Returns:  Optional<Bool>
     */
    public func getTriggerFulfillmentModules() -> Optional<Bool> {
        return self.triggerFulfillmentModules
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
     Setter for ShipFirstName.

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
     Setter for ShipLastName.

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
     Setter for ShipEmail.

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
     Setter for ShipPhone.

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
     Setter for ShipFax.

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
     Setter for ShipCompany.

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
     Setter for ShipAddress1.

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
     Setter for ShipAddress2.

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
     Setter for ShipCity.

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
     Setter for ShipState.

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
     Setter for ShipZip.

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
     Setter for ShipCountry.

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
     Setter for ShipResidential.

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
     Setter for BillFirstName.

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
     Setter for BillLastName.

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
     Setter for BillEmail.

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
     Setter for BillPhone.

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
     Setter for BillFax.

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
     Setter for BillCompany.

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
     Setter for BillAddress1.

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
     Setter for BillAddress2.

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
     Setter for BillCity.

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
     Setter for BillState.

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
     Setter for BillZip.

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
     Setter for BillCountry.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBillCountry(_ value: Optional<String>) -> Self {
        self.billCountry = value
        return self
    }

    /**
     Setter for Shipping_Module_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShippingModuleCode(_ value: Optional<String>) -> Self {
        self.shippingModuleCode = value
        return self
    }

    /**
     Setter for Shipping_Module_Data.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShippingModuleData(_ value: Optional<String>) -> Self {
        self.shippingModuleData = value
        return self
    }

    /**
     Setter for CalculateCharges.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCalculateCharges(_ value: Optional<Bool>) -> Self {
        self.calculateCharges = value
        return self
    }

    /**
     Setter for TriggerFulfillmentModules.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setTriggerFulfillmentModules(_ value: Optional<Bool>) -> Self {
        self.triggerFulfillmentModules = value
        return self
    }

    /**
     Add a OrderItem.

     - Parameters:
        - item: OrderItem
     - Returns: Self
     */
    @discardableResult
    public func addItem(_ item : OrderItem) -> Self {
        self.items.append(item)
        return self
    }

    /**
     Add an array of OrderItem.

     - Parameters:
        - items: [OrderItem]
     - Returns: Self
     */
    @discardableResult
    public func addItems(_ items: [OrderItem]) -> Self {
        for i in items {
            self.items.append(i);
        }

        return self
    }

    /**
     Add a OrderProduct.

     - Parameters:
        - product: OrderProduct
     - Returns: Self
     */
    @discardableResult
    public func addProduct(_ product : OrderProduct) -> Self {
        self.products.append(product)
        return self
    }

    /**
     Add an array of OrderProduct.

     - Parameters:
        - products: [OrderProduct]
     - Returns: Self
     */
    @discardableResult
    public func addProducts(_ products: [OrderProduct]) -> Self {
        for p in products {
            self.products.append(p);
        }

        return self
    }

    /**
     Add a OrderCharge.

     - Parameters:
        - charge: OrderCharge
     - Returns: Self
     */
    @discardableResult
    public func addCharge(_ charge : OrderCharge) -> Self {
        self.charges.append(charge)
        return self
    }

    /**
     Add an array of OrderCharge.

     - Parameters:
        - charges: [OrderCharge]
     - Returns: Self
     */
    @discardableResult
    public func addCharges(_ charges: [OrderCharge]) -> Self {
        for c in charges {
            self.charges.append(c);
        }

        return self
    }
}
