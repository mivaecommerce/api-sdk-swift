/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// CustomerAddress data model.
public class CustomerAddress : Model {

    /// Model field id.
    var id : Int

    /// Model field cust_id.
    var customerId : Int

    /// Model field descrip.
    var description : String

    /// Model field fname.
    var firstName : String

    /// Model field lname.
    var lastName : String

    /// Model field email.
    var email : String

    /// Model field comp.
    var company : String

    /// Model field phone.
    var phone : String

    /// Model field fax.
    var fax : String

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

    /// Model field resdntl.
    var residential : Bool

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case customerId = "cust_id"
        case description = "descrip"
        case firstName = "fname"
        case lastName = "lname"
        case email
        case company = "comp"
        case phone
        case fax
        case address1 = "addr1"
        case address2 = "addr2"
        case city
        case state
        case zip
        case country = "cntry"
        case residential = "resdntl"
    }

    /**
     CustomerAddress Constructor.
     */
    public override init() {
        self.id = 0
        self.customerId = 0
        self.description = ""
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.company = ""
        self.phone = ""
        self.fax = ""
        self.address1 = ""
        self.address2 = ""
        self.city = ""
        self.state = ""
        self.zip = ""
        self.country = ""
        self.residential = false

        super.init()
    }

    /**
     CustomerAddress Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.customerId = try container.decodeIfPresent(Int.self, forKey: .customerId) ?? 0
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        self.email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        self.company = try container.decodeIfPresent(String.self, forKey: .company) ?? ""
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        self.fax = try container.decodeIfPresent(String.self, forKey: .fax) ?? ""
        self.address1 = try container.decodeIfPresent(String.self, forKey: .address1) ?? ""
        self.address2 = try container.decodeIfPresent(String.self, forKey: .address2) ?? ""
        self.city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        self.state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        self.zip = try container.decodeIfPresent(String.self, forKey: .zip) ?? ""
        self.country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        self.residential = try container.decodeIfPresent(Bool.self, forKey: .residential) ?? false

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
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.company, forKey: .company)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.fax, forKey: .fax)
        try container.encodeIfPresent(self.address1, forKey: .address1)
        try container.encodeIfPresent(self.address2, forKey: .address2)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zip, forKey: .zip)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.residential, forKey: .residential)

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
     Getter for descrip.

     - Returns:  String
     */
    public func getDescription() -> String {
        return self.description
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
     Getter for email.

     - Returns:  String
     */
    public func getEmail() -> String {
        return self.email
    }
    
    /**
     Getter for comp.

     - Returns:  String
     */
    public func getCompany() -> String {
        return self.company
    }
    
    /**
     Getter for phone.

     - Returns:  String
     */
    public func getPhone() -> String {
        return self.phone
    }
    
    /**
     Getter for fax.

     - Returns:  String
     */
    public func getFax() -> String {
        return self.fax
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
     Getter for resdntl.
     
     - Returns:  Bool
     */
    public func getResidential() -> Bool {
        return self.residential
    }
}
