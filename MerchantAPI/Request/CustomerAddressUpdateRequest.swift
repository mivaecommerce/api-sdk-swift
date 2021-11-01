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
 Handles API Request CustomerAddress_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/customeraddress_update
 */
public class CustomerAddressUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CustomerAddress_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Address_ID.
    var addressId : Optional<Int> = nil

    /// Request field CustomerAddress_ID.
    var customerAddressId : Optional<Int> = nil

    /// Request field Customer_ID.
    var customerId : Optional<Int> = nil

    /// Request field Customer_Login.
    var customerLogin : Optional<String> = nil

    /// Request field Description.
    var description : Optional<String> = nil

    /// Request field FirstName.
    var firstName : Optional<String> = nil

    /// Request field LastName.
    var lastName : Optional<String> = nil

    /// Request field Email.
    var email : Optional<String> = nil

    /// Request field Phone.
    var phone : Optional<String> = nil

    /// Request field Fax.
    var fax : Optional<String> = nil

    /// Request field Company.
    var company : Optional<String> = nil

    /// Request field Address1.
    var address1 : Optional<String> = nil

    /// Request field Address2.
    var address2 : Optional<String> = nil

    /// Request field City.
    var city : Optional<String> = nil

    /// Request field State.
    var state : Optional<String> = nil

    /// Request field Zip.
    var zip : Optional<String> = nil

    /// Request field Country.
    var country : Optional<String> = nil

    /// Request field Residential.
    var residential : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case addressId = "Address_ID"
        case customerAddressId = "CustomerAddress_ID"
        case customerId = "Customer_ID"
        case customerLogin = "Customer_Login"
        case description = "Description"
        case firstName = "FirstName"
        case lastName = "LastName"
        case email = "Email"
        case phone = "Phone"
        case fax = "Fax"
        case company = "Company"
        case address1 = "Address1"
        case address2 = "Address2"
        case city = "City"
        case state = "State"
        case zip = "Zip"
        case country = "Country"
        case residential = "Residential"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - customerAddress: An optional CustomerAddress instance.
     */
    public init(client: Optional<BaseClient> = nil, customerAddress: Optional<CustomerAddress> = nil) {
        super.init(client: client)
        if let customerAddress = customerAddress {
            if customerAddress.customerId > 0 {
                self.customerId = customerAddress.customerId
            }

            if customerAddress.id > 0 {
                self.addressId = customerAddress.id
            }

            self.description = customerAddress.description
            self.firstName = customerAddress.firstName
            self.lastName = customerAddress.lastName
            self.email = customerAddress.email
            self.phone = customerAddress.phone
            self.fax = customerAddress.fax
            self.company = customerAddress.company
            self.address1 = customerAddress.address1
            self.address2 = customerAddress.address2
            self.city = customerAddress.city
            self.state = customerAddress.state
            self.zip = customerAddress.zip
            self.country = customerAddress.country
            self.residential = customerAddress.residential
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
        }

        if self.addressId != nil {
            try container.encodeIfPresent(self.addressId, forKey: .addressId)
        } else if self.customerAddressId != nil {
            try container.encode(self.customerAddressId, forKey: .customerAddressId)
        }

        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.fax, forKey: .fax)
        try container.encodeIfPresent(self.company, forKey: .company)
        try container.encodeIfPresent(self.address1, forKey: .address1)
        try container.encodeIfPresent(self.address2, forKey: .address2)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zip, forKey: .zip)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.residential, forKey: .residential)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CustomerAddressUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CustomerAddressUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CustomerAddressUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CustomerAddressUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CustomerAddressUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerAddressUpdateResponse.self
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
     Getter for Description.

     - Returns:  Optional<String>
     */
    public func getDescription() -> Optional<String> {
        return self.description
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
     Getter for Email.

     - Returns:  Optional<String>
     */
    public func getEmail() -> Optional<String> {
        return self.email
    }

    /**
     Getter for Phone.

     - Returns:  Optional<String>
     */
    public func getPhone() -> Optional<String> {
        return self.phone
    }

    /**
     Getter for Fax.

     - Returns:  Optional<String>
     */
    public func getFax() -> Optional<String> {
        return self.fax
    }

    /**
     Getter for Company.

     - Returns:  Optional<String>
     */
    public func getCompany() -> Optional<String> {
        return self.company
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
     Getter for Residential.

     - Returns:  Optional<Bool>
     */
    public func getResidential() -> Optional<Bool> {
        return self.residential
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
     Setter for Description.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDescription(_ value: Optional<String>) -> Self {
        self.description = value
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
     Setter for Email.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEmail(_ value: Optional<String>) -> Self {
        self.email = value
        return self
    }

    /**
     Setter for Phone.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPhone(_ value: Optional<String>) -> Self {
        self.phone = value
        return self
    }

    /**
     Setter for Fax.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setFax(_ value: Optional<String>) -> Self {
        self.fax = value
        return self
    }

    /**
     Setter for Company.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCompany(_ value: Optional<String>) -> Self {
        self.company = value
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

    /**
     Setter for Residential.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setResidential(_ value: Optional<Bool>) -> Self {
        self.residential = value
        return self
    }
}
