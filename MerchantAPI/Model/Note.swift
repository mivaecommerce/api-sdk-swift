/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// Note data model.
public class Note : Model {

    /// Model field id.
    var id : Int

    /// Model field cust_id.
    var customerId : Int

    /// Model field account_id.
    var accountId : Int

    /// Model field order_id.
    var orderId : Int

    /// Model field user_id.
    var userId : Int

    /// Model field notetext.
    var noteText : String

    /// Model field dtstamp.
    var dateTimeStamp : Int

    /// Model field cust_login.
    var customerLogin : String

    /// Model field business_title.
    var businessTitle : String

    /// Model field admin_user.
    var adminUser : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case customerId = "cust_id"
        case accountId = "account_id"
        case orderId = "order_id"
        case userId = "user_id"
        case noteText = "notetext"
        case dateTimeStamp = "dtstamp"
        case customerLogin = "cust_login"
        case businessTitle = "business_title"
        case adminUser = "admin_user"
    }

    /**
     Note Constructor.
     */
    public override init() {
        self.id = 0
        self.customerId = 0
        self.accountId = 0
        self.orderId = 0
        self.userId = 0
        self.noteText = ""
        self.dateTimeStamp = 0
        self.customerLogin = ""
        self.businessTitle = ""
        self.adminUser = ""

        super.init()
    }

    /**
     Note Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.customerId = try container.decodeIfPresent(Int.self, forKey: .customerId) ?? 0
        self.accountId = try container.decodeIfPresent(Int.self, forKey: .accountId) ?? 0
        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        self.noteText = try container.decodeIfPresent(String.self, forKey: .noteText) ?? ""
        self.dateTimeStamp = try container.decodeIfPresent(Int.self, forKey: .dateTimeStamp) ?? 0
        self.customerLogin = try container.decodeIfPresent(String.self, forKey: .customerLogin) ?? ""
        self.businessTitle = try container.decodeIfPresent(String.self, forKey: .businessTitle) ?? ""
        self.adminUser = try container.decodeIfPresent(String.self, forKey: .adminUser) ?? ""

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
        try container.encodeIfPresent(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.noteText, forKey: .noteText)
        try container.encodeIfPresent(self.dateTimeStamp, forKey: .dateTimeStamp)
        try container.encodeIfPresent(self.customerLogin, forKey: .customerLogin)
        try container.encodeIfPresent(self.businessTitle, forKey: .businessTitle)
        try container.encodeIfPresent(self.adminUser, forKey: .adminUser)

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
     Getter for account_id.
     
     - Returns:  Int
     */
    public func getAccountId() -> Int {
        return self.accountId
    }
    
    /**
     Getter for order_id.
     
     - Returns:  Int
     */
    public func getOrderId() -> Int {
        return self.orderId
    }
    
    /**
     Getter for user_id.
     
     - Returns:  Int
     */
    public func getUserId() -> Int {
        return self.userId
    }
    
    /**
     Getter for notetext.

     - Returns:  String
     */
    public func getNoteText() -> String {
        return self.noteText
    }
    
    /**
     Getter for dtstamp.
     
     - Returns:  Int
     */
    public func getDateTimeStamp() -> Int {
        return self.dateTimeStamp
    }
    
    /**
     Getter for cust_login.

     - Returns:  String
     */
    public func getCustomerLogin() -> String {
        return self.customerLogin
    }
    
    /**
     Getter for business_title.

     - Returns:  String
     */
    public func getBusinessTitle() -> String {
        return self.businessTitle
    }
    
    /**
     Getter for admin_user.

     - Returns:  String
     */
    public func getAdminUser() -> String {
        return self.adminUser
    }
    
    /**
     Setter for cust_id.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerId(_ value: Int) -> Self {
        self.customerId = value
        return self
    }
    
    /**
     Setter for account_id.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAccountId(_ value: Int) -> Self {
        self.accountId = value
        return self
    }
    
    /**
     Setter for order_id.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOrderId(_ value: Int) -> Self {
        self.orderId = value
        return self
    }

    /**
     Setter for notetext.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setNoteText(_ value: String) -> Self {
        self.noteText = value
        return self
    }
}
