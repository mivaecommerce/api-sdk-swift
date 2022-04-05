/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CustomerPaymentCard data model.
public class CustomerPaymentCard : Model {

    /// Model field id.
    var id : Int

    /// Model field cust_id.
    var customerId : Int

    /// Model field fname.
    var firstName : String

    /// Model field lname.
    var lastName : String

    /// Model field exp_month.
    var expirationMonth : Int

    /// Model field exp_year.
    var expirationYear : Int

    /// Model field lastfour.
    var lastFour : String

    /// Model field addr1.
    var address1 : String

    /// Model field addr2.
    var address2 : String

    /// Model field city.
    var city : String

    /// Model field state.
    var state : String

    /// Model field zip.
    var zip : String

    /// Model field cntry.
    var country : String

    /// Model field lastused.
    var lastUsed : String

    /// Model field token.
    var token : String

    /// Model field type_id.
    var typeId : Int

    /// Model field refcount.
    var referenceCount : Int

    /// Model field type.
    var type : String

    /// Model field mod_code.
    var moduleCode : String

    /// Model field meth_code.
    var methodCode : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case customerId = "cust_id"
        case firstName = "fname"
        case lastName = "lname"
        case expirationMonth = "exp_month"
        case expirationYear = "exp_year"
        case lastFour = "lastfour"
        case address1 = "addr1"
        case address2 = "addr2"
        case city
        case state
        case zip
        case country = "cntry"
        case lastUsed = "lastused"
        case token
        case typeId = "type_id"
        case referenceCount = "refcount"
        case type
        case moduleCode = "mod_code"
        case methodCode = "meth_code"
    }

    /**
     CustomerPaymentCard Constructor.
     */
    public override init() {
        self.id = 0
        self.customerId = 0
        self.firstName = ""
        self.lastName = ""
        self.expirationMonth = 0
        self.expirationYear = 0
        self.lastFour = ""
        self.address1 = ""
        self.address2 = ""
        self.city = ""
        self.state = ""
        self.zip = ""
        self.country = ""
        self.lastUsed = ""
        self.token = ""
        self.typeId = 0
        self.referenceCount = 0
        self.type = ""
        self.moduleCode = ""
        self.methodCode = ""

        super.init()
    }

    /**
     CustomerPaymentCard Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.customerId = try container.decodeIfPresent(Int.self, forKey: .customerId) ?? 0
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        self.expirationMonth = try container.decodeIfPresent(Int.self, forKey: .expirationMonth) ?? 0
        self.expirationYear = try container.decodeIfPresent(Int.self, forKey: .expirationYear) ?? 0
        self.lastFour = try container.decodeIfPresent(String.self, forKey: .lastFour) ?? ""
        self.address1 = try container.decodeIfPresent(String.self, forKey: .address1) ?? ""
        self.address2 = try container.decodeIfPresent(String.self, forKey: .address2) ?? ""
        self.city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        self.state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        self.zip = try container.decodeIfPresent(String.self, forKey: .zip) ?? ""
        self.country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        self.lastUsed = try container.decodeIfPresent(String.self, forKey: .lastUsed) ?? ""
        self.token = try container.decodeIfPresent(String.self, forKey: .token) ?? ""
        self.typeId = try container.decodeIfPresent(Int.self, forKey: .typeId) ?? 0
        self.referenceCount = try container.decodeIfPresent(Int.self, forKey: .referenceCount) ?? 0
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.moduleCode = try container.decodeIfPresent(String.self, forKey: .moduleCode) ?? ""
        self.methodCode = try container.decodeIfPresent(String.self, forKey: .methodCode) ?? ""

        try super.init(from : decoder)
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encoder: The Encoder instance.
     - Throws: error when unable to encode.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.expirationMonth, forKey: .expirationMonth)
        try container.encodeIfPresent(self.expirationYear, forKey: .expirationYear)
        try container.encodeIfPresent(self.lastFour, forKey: .lastFour)
        try container.encodeIfPresent(self.address1, forKey: .address1)
        try container.encodeIfPresent(self.address2, forKey: .address2)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zip, forKey: .zip)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.lastUsed, forKey: .lastUsed)
        try container.encodeIfPresent(self.token, forKey: .token)
        try container.encodeIfPresent(self.typeId, forKey: .typeId)
        try container.encodeIfPresent(self.referenceCount, forKey: .referenceCount)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.moduleCode, forKey: .moduleCode)
        try container.encodeIfPresent(self.methodCode, forKey: .methodCode)

        try super.encode(to: encoder)
    }

    /**
     Getter for id.

     - Returns:  Int

     */
    public func getId() -> Int {
        return self.id
    }

    /**
     Getter for cust_id.

     - Returns:  Int

     */
    public func getCustomerId() -> Int {
        return self.customerId
    }

    /**
     Getter for fname.

     - Returns:  String

     */
    public func getFirstName() -> String {
        return self.firstName
    }

    /**
     Getter for lname.

     - Returns:  String

     */
    public func getLastName() -> String {
        return self.lastName
    }

    /**
     Getter for exp_month.

     - Returns:  Int

     */
    public func getExpirationMonth() -> Int {
        return self.expirationMonth
    }

    /**
     Getter for exp_year.

     - Returns:  Int

     */
    public func getExpirationYear() -> Int {
        return self.expirationYear
    }

    /**
     Getter for lastfour.

     - Returns:  String

     */
    public func getLastFour() -> String {
        return self.lastFour
    }

    /**
     Getter for addr1.

     - Returns:  String

     */
    public func getAddress1() -> String {
        return self.address1
    }

    /**
     Getter for addr2.

     - Returns:  String

     */
    public func getAddress2() -> String {
        return self.address2
    }

    /**
     Getter for city.

     - Returns:  String

     */
    public func getCity() -> String {
        return self.city
    }

    /**
     Getter for state.

     - Returns:  String

     */
    public func getState() -> String {
        return self.state
    }

    /**
     Getter for zip.

     - Returns:  String

     */
    public func getZip() -> String {
        return self.zip
    }

    /**
     Getter for cntry.

     - Returns:  String

     */
    public func getCountry() -> String {
        return self.country
    }

    /**
     Getter for lastused.

     - Returns:  String

     */
    public func getLastUsed() -> String {
        return self.lastUsed
    }

    /**
     Getter for token.

     - Returns:  String

     */
    public func getToken() -> String {
        return self.token
    }

    /**
     Getter for type_id.

     - Returns:  Int

     */
    public func getTypeId() -> Int {
        return self.typeId
    }

    /**
     Getter for refcount.

     - Returns:  Int

     */
    public func getReferenceCount() -> Int {
        return self.referenceCount
    }

    /**
     Getter for type.

     - Returns:  String

     */
    public func getType() -> String {
        return self.type
    }

    /**
     Getter for mod_code.

     - Returns:  String

     */
    public func getModuleCode() -> String {
        return self.moduleCode
    }

    /**
     Getter for meth_code.

     - Returns:  String

     */
    public func getMethodCode() -> String {
        return self.methodCode
    }
}
