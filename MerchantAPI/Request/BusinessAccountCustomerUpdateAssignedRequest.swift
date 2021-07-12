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
 Handles API Request BusinessAccountCustomer_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/businessaccountcustomer_update_assigned
 */
public class BusinessAccountCustomerUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "BusinessAccountCustomer_Update_Assigned"
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

    /// Request field BusinessAccount_ID.
    var businessAccountId : Optional<Int> = nil

    /// Request field Edit_BusinessAccount.
    var editBusinessAccount : Optional<String> = nil

    /// Request field BusinessAccount_Title.
    var businessAccountTitle : Optional<String> = nil

    /// Request field Assigned.
    var assigned : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case customerId = "Customer_ID"
        case editCustomer = "Edit_Customer"
        case customerLogin = "Customer_Login"
        case businessAccountId = "BusinessAccount_ID"
        case editBusinessAccount = "Edit_BusinessAccount"
        case businessAccountTitle = "BusinessAccount_Title"
        case assigned = "Assigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - businessAccount: An optional BusinessAccount instance.
     */
    public init(client: Optional<BaseClient> = nil, businessAccount: Optional<BusinessAccount> = nil) {
        super.init(client: client)
        if let businessAccount = businessAccount {
            if businessAccount.id > 0 {
                self.businessAccountId = businessAccount.id
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

        if self.businessAccountId != nil {
            try container.encodeIfPresent(self.businessAccountId, forKey: .businessAccountId)
        } else if self.editBusinessAccount != nil {
            try container.encode(self.editBusinessAccount, forKey: .editBusinessAccount)
        } else if self.businessAccountTitle != nil {
            try container.encode(self.businessAccountTitle, forKey: .businessAccountTitle)
        }

        if self.customerId != nil {
            try container.encodeIfPresent(self.customerId, forKey: .customerId)
        } else if self.editCustomer != nil {
            try container.encode(self.editCustomer, forKey: .editCustomer)
        } else if self.customerLogin != nil {
            try container.encode(self.customerLogin, forKey: .customerLogin)
        }

        try container.encodeIfPresent(self.customerLogin, forKey: .customerLogin)
        try container.encodeIfPresent(self.businessAccountTitle, forKey: .businessAccountTitle)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (BusinessAccountCustomerUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (BusinessAccountCustomerUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? BusinessAccountCustomerUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> BusinessAccountCustomerUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(BusinessAccountCustomerUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return BusinessAccountCustomerUpdateAssignedResponse.self
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
     Getter for BusinessAccount_ID.

     - Returns:  Optional<Int>
     */
    public func getBusinessAccountId() -> Optional<Int> {
        return self.businessAccountId
    }

    /**
     Getter for Edit_BusinessAccount.

     - Returns:  Optional<String>
     */
    public func getEditBusinessAccount() -> Optional<String> {
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
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditBusinessAccount(_ value: Optional<String>) -> Self {
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
}
