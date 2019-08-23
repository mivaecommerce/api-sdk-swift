/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// Coupon data model.
public class Coupon : Model {

    /// Enumeration CustomerScope
    public enum CustomerScope : String {
        case AllShoppers = "A"
        case SpecificCustomers = "X"
        case AllLoggedIn = "L"
    }

    /// Model field id.
    var id : Int

    /// Model field code.
    var code : String

    /// Model field descrip.
    var description : String

    /// Model field custscope.
    var customerScope : String

    /// Model field dt_start.
    var dateTimeStart : Int

    /// Model field dt_end.
    var dateTimeEnd : Int

    /// Model field max_use.
    var maxUse : Int

    /// Model field max_per.
    var maxPer : Int

    /// Model field active.
    var active : Bool

    /// Model field use_count.
    var useCount : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case code
        case description = "descrip"
        case customerScope = "custscope"
        case dateTimeStart = "dt_start"
        case dateTimeEnd = "dt_end"
        case maxUse = "max_use"
        case maxPer = "max_per"
        case active
        case useCount = "use_count"
    }

    /**
     Coupon Constructor.
     */
    public override init() {
        self.id = 0
        self.code = ""
        self.description = ""
        self.customerScope = ""
        self.dateTimeStart = 0
        self.dateTimeEnd = 0
        self.maxUse = 0
        self.maxPer = 0
        self.active = false
        self.useCount = 0

        super.init()
    }

    /**
     Coupon Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.customerScope = try container.decodeIfPresent(String.self, forKey: .customerScope) ?? ""
        self.dateTimeStart = try container.decodeIfPresent(Int.self, forKey: .dateTimeStart) ?? 0
        self.dateTimeEnd = try container.decodeIfPresent(Int.self, forKey: .dateTimeEnd) ?? 0
        self.maxUse = try container.decodeIfPresent(Int.self, forKey: .maxUse) ?? 0
        self.maxPer = try container.decodeIfPresent(Int.self, forKey: .maxPer) ?? 0
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false
        self.useCount = try container.decodeIfPresent(Int.self, forKey: .useCount) ?? 0

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
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.customerScope, forKey: .customerScope)
        try container.encodeIfPresent(self.dateTimeStart, forKey: .dateTimeStart)
        try container.encodeIfPresent(self.dateTimeEnd, forKey: .dateTimeEnd)
        try container.encodeIfPresent(self.maxUse, forKey: .maxUse)
        try container.encodeIfPresent(self.maxPer, forKey: .maxPer)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(self.useCount, forKey: .useCount)

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
     Getter for code.

     - Returns:  String
     */
    public func getCode() -> String {
        return self.code
    }
    
    /**
     Getter for descrip.

     - Returns:  String
     */
    public func getDescription() -> String {
        return self.description
    }
    
    /**
     Getter for custscope.

     - Returns:  String
     */
    public func getCustomerScope() -> String {
        return self.customerScope
    }
    
    /**
     Getter for dt_start.
     
     - Returns:  Int
     */
    public func getDateTimeStart() -> Int {
        return self.dateTimeStart
    }
    
    /**
     Getter for dt_end.
     
     - Returns:  Int
     */
    public func getDateTimeEnd() -> Int {
        return self.dateTimeEnd
    }
    
    /**
     Getter for max_use.
     
     - Returns:  Int
     */
    public func getMaxUse() -> Int {
        return self.maxUse
    }
    
    /**
     Getter for max_per.
     
     - Returns:  Int
     */
    public func getMaxPer() -> Int {
        return self.maxPer
    }
    
    /**
     Getter for active.
     
     - Returns:  Bool
     */
    public func getActive() -> Bool {
        return self.active
    }
    
    /**
     Getter for use_count.
     
     - Returns:  Int
     */
    public func getUseCount() -> Int {
        return self.useCount
    }

    /**
     Setter for code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setCode(_ value: String) -> Self {
        self.code = value
        return self
    }

    /**
     Setter for descrip.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setDescription(_ value: String) -> Self {
        self.description = value
        return self
    }

    /**
     Setter for custscope.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerScope(_ value: String) -> Self {
        self.customerScope = value
        return self
    }
    
    /**
     Setter for dt_start.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeStart(_ value: Int) -> Self {
        self.dateTimeStart = value
        return self
    }
    
    /**
     Setter for dt_end.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeEnd(_ value: Int) -> Self {
        self.dateTimeEnd = value
        return self
    }
    
    /**
     Setter for max_use.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setMaxUse(_ value: Int) -> Self {
        self.maxUse = value
        return self
    }
    
    /**
     Setter for max_per.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setMaxPer(_ value: Int) -> Self {
        self.maxPer = value
        return self
    }

    /**
     Setter for active.
     
     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setActive(_ value: Bool) -> Self {
        self.active = value
        return self
    }
}
