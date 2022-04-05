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
 Handles API Request Subscription_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/subscription_insert
 */
public class SubscriptionInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Subscription_Insert"
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

    /// Request field Address_ID.
    var addressId : Optional<Int> = nil

    /// Request field CustomerAddress_ID.
    var customerAddressId : Optional<Int> = nil

    /// Request field Product_ID.
    var productId : Optional<Int> = nil

    /// Request field Edit_Product.
    var editProduct : Optional<String> = nil

    /// Request field Product_Code.
    var productCode : Optional<String> = nil

    /// Request field ProductSubscriptionTerm_ID.
    var productSubscriptionTermId : Optional<Int> = nil

    /// Request field ProductSubscriptionTerm_Description.
    var productSubscriptionTermDescription : Optional<String> = nil

    /// Request field Quantity.
    var quantity : Optional<Int> = nil

    /// Request field NextDate.
    var nextDate : Optional<Date> = nil

    /// Request field PaymentCard_ID.
    var paymentCardId : Optional<Int> = nil

    /// Request field Ship_ID.
    var shipId : Optional<Int> = nil

    /// Request field Ship_Data.
    var shipData : Optional<String> = nil

    /// Request field Attributes.
    var attributes : [SubscriptionAttribute] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case customerId = "Customer_ID"
        case editCustomer = "Edit_Customer"
        case customerLogin = "Customer_Login"
        case addressId = "Address_ID"
        case customerAddressId = "CustomerAddress_ID"
        case productId = "Product_ID"
        case editProduct = "Edit_Product"
        case productCode = "Product_Code"
        case productSubscriptionTermId = "ProductSubscriptionTerm_ID"
        case productSubscriptionTermDescription = "ProductSubscriptionTerm_Description"
        case quantity = "Quantity"
        case nextDate = "NextDate"
        case paymentCardId = "PaymentCard_ID"
        case shipId = "Ship_ID"
        case shipData = "Ship_Data"
        case attributes = "Attributes"
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

        if self.productId != nil {
            try container.encodeIfPresent(self.productId, forKey: .productId)
        } else if self.editProduct != nil {
            try container.encode(self.editProduct, forKey: .editProduct)
        } else if self.productCode != nil {
            try container.encode(self.productCode, forKey: .productCode)
        }

        if self.productSubscriptionTermId != nil {
            try container.encodeIfPresent(self.productSubscriptionTermId, forKey: .productSubscriptionTermId)
        } else if self.productSubscriptionTermDescription != nil {
            try container.encode(self.productSubscriptionTermDescription, forKey: .productSubscriptionTermDescription)
        }

        if self.customerId != nil {
            try container.encodeIfPresent(self.customerId, forKey: .customerId)
        } else if self.editCustomer != nil {
            try container.encode(self.editCustomer, forKey: .editCustomer)
        } else if self.customerLogin != nil {
            try container.encode(self.customerLogin, forKey: .customerLogin)
        }

        if self.addressId != nil {
            try container.encodeIfPresent(self.addressId, forKey: .addressId)
        } else if self.customerAddressId != nil {
            try container.encode(self.customerAddressId, forKey: .customerAddressId)
        }

        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        if let nextDate = self.nextDate {
            try container.encodeIfPresent(Int64(nextDate.timeIntervalSince1970), forKey: .nextDate)
        }
        try container.encodeIfPresent(self.paymentCardId, forKey: .paymentCardId)
        try container.encodeIfPresent(self.shipId, forKey: .shipId)
        try container.encodeIfPresent(self.shipData, forKey: .shipData)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (SubscriptionInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (SubscriptionInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? SubscriptionInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> SubscriptionInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(SubscriptionInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return SubscriptionInsertResponse.self
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
     Getter for Address_ID.

     - Returns:  Optional<Int>
     */
    public func getAddressId() -> Optional<Int> {
        return self.addressId
    }

    /**
     Getter for CustomerAddress_ID.

     - Returns:  Optional<Int>
     */
    public func getCustomerAddressId() -> Optional<Int> {
        return self.customerAddressId
    }

    /**
     Getter for Product_ID.

     - Returns:  Optional<Int>
     */
    public func getProductId() -> Optional<Int> {
        return self.productId
    }

    /**
     Getter for Edit_Product.

     - Returns:  Optional<String>
     */
    public func getEditProduct() -> Optional<String> {
        return self.editProduct
    }

    /**
     Getter for Product_Code.

     - Returns:  Optional<String>
     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
    }

    /**
     Getter for ProductSubscriptionTerm_ID.

     - Returns:  Optional<Int>
     */
    public func getProductSubscriptionTermId() -> Optional<Int> {
        return self.productSubscriptionTermId
    }

    /**
     Getter for ProductSubscriptionTerm_Description.

     - Returns:  Optional<String>
     */
    public func getProductSubscriptionTermDescription() -> Optional<String> {
        return self.productSubscriptionTermDescription
    }

    /**
     Getter for Quantity.

     - Returns:  Optional<Int>
     */
    public func getQuantity() -> Optional<Int> {
        return self.quantity
    }

    /**
     Getter for NextDate.

     - Returns:  Optional<Date>
     */
    public func getNextDate() -> Optional<Date> {
        return self.nextDate
    }

    /**
     Getter for PaymentCard_ID.

     - Returns:  Optional<Int>
     */
    public func getPaymentCardId() -> Optional<Int> {
        return self.paymentCardId
    }

    /**
     Getter for Ship_ID.

     - Returns:  Optional<Int>
     */
    public func getShipId() -> Optional<Int> {
        return self.shipId
    }

    /**
     Getter for Ship_Data.

     - Returns:  Optional<String>
     */
    public func getShipData() -> Optional<String> {
        return self.shipData
    }

    /**
     Getter for Attributes.

     - Returns:  [SubscriptionAttribute]
     */
    public func getAttributes() -> [SubscriptionAttribute] {
        return self.attributes
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
     Setter for Address_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAddressId(_ value: Optional<Int>) -> Self {
        self.addressId = value
        return self
    }

    /**
     Setter for CustomerAddress_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerAddressId(_ value: Optional<Int>) -> Self {
        self.customerAddressId = value
        return self
    }

    /**
     Setter for Product_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductId(_ value: Optional<Int>) -> Self {
        self.productId = value
        return self
    }

    /**
     Setter for Edit_Product.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditProduct(_ value: Optional<String>) -> Self {
        self.editProduct = value
        return self
    }

    /**
     Setter for Product_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductCode(_ value: Optional<String>) -> Self {
        self.productCode = value
        return self
    }

    /**
     Setter for ProductSubscriptionTerm_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductSubscriptionTermId(_ value: Optional<Int>) -> Self {
        self.productSubscriptionTermId = value
        return self
    }

    /**
     Setter for ProductSubscriptionTerm_Description.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductSubscriptionTermDescription(_ value: Optional<String>) -> Self {
        self.productSubscriptionTermDescription = value
        return self
    }

    /**
     Setter for Quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setQuantity(_ value: Optional<Int>) -> Self {
        self.quantity = value
        return self
    }

    /**
     Setter for NextDate.

     - Parameters:
        - value: Optional<Date>
     - Returns:  Self
     */
    @discardableResult
    public func setNextDate(_ value: Optional<Date>) -> Self {
        self.nextDate = value
        return self
    }

    /**
     Setter for PaymentCard_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPaymentCardId(_ value: Optional<Int>) -> Self {
        self.paymentCardId = value
        return self
    }

    /**
     Setter for Ship_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setShipId(_ value: Optional<Int>) -> Self {
        self.shipId = value
        return self
    }

    /**
     Setter for Ship_Data.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setShipData(_ value: Optional<String>) -> Self {
        self.shipData = value
        return self
    }

    /**
     Add a SubscriptionAttribute.

     - Parameters:
        - attribute: SubscriptionAttribute
     - Returns: Self
     */
    @discardableResult
    public func addAttribute(_ attribute : SubscriptionAttribute) -> Self {
        self.attributes.append(attribute)
        return self
    }

    /**
     Add an array of SubscriptionAttribute.

     - Parameters:
        - attributes: [SubscriptionAttribute]
     - Returns: Self
     */
    @discardableResult
    public func addAttributes(_ attributes: [SubscriptionAttribute]) -> Self {
        for a in attributes {
            self.attributes.append(a);
        }

        return self
    }
}
