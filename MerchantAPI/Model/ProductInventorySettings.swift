/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: ProductInventorySettings.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/// ProductInventorySettings data model.
public class ProductInventorySettings : Model {

    /// Model field active.
    var active : Bool

    /// Model field in_short.
    var inStockMessageShort : String

    /// Model field in_long.
    var inStockMessageLong : String

    /// Model field low_track.
    var trackLowStockLevel : String

    /// Model field low_level.
    var lowStockLevel : Int

    /// Model field low_lvl_d.
    var lowStockLevelDefault : Bool

    /// Model field low_short.
    var lowStockMessageShort : String

    /// Model field low_long.
    var lowStockMessageLong : String

    /// Model field out_track.
    var trackOutOfStockLevel : String

    /// Model field out_hide.
    var hideOutOfStock : String

    /// Model field out_level.
    var outOfStockLevel : Int

    /// Model field out_lvl_d.
    var outOfStockLevelDefault : Bool

    /// Model field out_short.
    var outOfStockMessageShort : String

    /// Model field out_long.
    var outOfStockMessageLong : String

    /// Model field ltd_long.
    var limitedStockMessage : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case active
        case inStockMessageShort = "in_short"
        case inStockMessageLong = "in_long"
        case trackLowStockLevel = "low_track"
        case lowStockLevel = "low_level"
        case lowStockLevelDefault = "low_lvl_d"
        case lowStockMessageShort = "low_short"
        case lowStockMessageLong = "low_long"
        case trackOutOfStockLevel = "out_track"
        case hideOutOfStock = "out_hide"
        case outOfStockLevel = "out_level"
        case outOfStockLevelDefault = "out_lvl_d"
        case outOfStockMessageShort = "out_short"
        case outOfStockMessageLong = "out_long"
        case limitedStockMessage = "ltd_long"
    }

    /**
     ProductInventorySettings Constructor.
     */
    public override init() {
        self.active = false
        self.inStockMessageShort = ""
        self.inStockMessageLong = ""
        self.trackLowStockLevel = ""
        self.lowStockLevel = 0
        self.lowStockLevelDefault = false
        self.lowStockMessageShort = ""
        self.lowStockMessageLong = ""
        self.trackOutOfStockLevel = ""
        self.hideOutOfStock = ""
        self.outOfStockLevel = 0
        self.outOfStockLevelDefault = false
        self.outOfStockMessageShort = ""
        self.outOfStockMessageLong = ""
        self.limitedStockMessage = ""

        super.init()
    }

    /**
     ProductInventorySettings Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false
        self.inStockMessageShort = try container.decodeIfPresent(String.self, forKey: .inStockMessageShort) ?? ""
        self.inStockMessageLong = try container.decodeIfPresent(String.self, forKey: .inStockMessageLong) ?? ""
        self.trackLowStockLevel = try container.decodeIfPresent(String.self, forKey: .trackLowStockLevel) ?? ""
        self.lowStockLevel = try container.decodeIfPresent(Int.self, forKey: .lowStockLevel) ?? 0
        self.lowStockLevelDefault = try container.decodeIfPresent(Bool.self, forKey: .lowStockLevelDefault) ?? false
        self.lowStockMessageShort = try container.decodeIfPresent(String.self, forKey: .lowStockMessageShort) ?? ""
        self.lowStockMessageLong = try container.decodeIfPresent(String.self, forKey: .lowStockMessageLong) ?? ""
        self.trackOutOfStockLevel = try container.decodeIfPresent(String.self, forKey: .trackOutOfStockLevel) ?? ""
        self.hideOutOfStock = try container.decodeIfPresent(String.self, forKey: .hideOutOfStock) ?? ""
        self.outOfStockLevel = try container.decodeIfPresent(Int.self, forKey: .outOfStockLevel) ?? 0
        self.outOfStockLevelDefault = try container.decodeIfPresent(Bool.self, forKey: .outOfStockLevelDefault) ?? false
        self.outOfStockMessageShort = try container.decodeIfPresent(String.self, forKey: .outOfStockMessageShort) ?? ""
        self.outOfStockMessageLong = try container.decodeIfPresent(String.self, forKey: .outOfStockMessageLong) ?? ""
        self.limitedStockMessage = try container.decodeIfPresent(String.self, forKey: .limitedStockMessage) ?? ""

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

        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(self.inStockMessageShort, forKey: .inStockMessageShort)
        try container.encodeIfPresent(self.inStockMessageLong, forKey: .inStockMessageLong)
        try container.encodeIfPresent(self.trackLowStockLevel, forKey: .trackLowStockLevel)
        try container.encodeIfPresent(self.lowStockLevel, forKey: .lowStockLevel)
        try container.encodeIfPresent(self.lowStockLevelDefault, forKey: .lowStockLevelDefault)
        try container.encodeIfPresent(self.lowStockMessageShort, forKey: .lowStockMessageShort)
        try container.encodeIfPresent(self.lowStockMessageLong, forKey: .lowStockMessageLong)
        try container.encodeIfPresent(self.trackOutOfStockLevel, forKey: .trackOutOfStockLevel)
        try container.encodeIfPresent(self.hideOutOfStock, forKey: .hideOutOfStock)
        try container.encodeIfPresent(self.outOfStockLevel, forKey: .outOfStockLevel)
        try container.encodeIfPresent(self.outOfStockLevelDefault, forKey: .outOfStockLevelDefault)
        try container.encodeIfPresent(self.outOfStockMessageShort, forKey: .outOfStockMessageShort)
        try container.encodeIfPresent(self.outOfStockMessageLong, forKey: .outOfStockMessageLong)
        try container.encodeIfPresent(self.limitedStockMessage, forKey: .limitedStockMessage)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for active.
     
     - Returns:  Bool
     */
    public func getActive() -> Bool {
        return self.active
    }
    
    /**
     Getter for in_short.

     - Returns:  String
     */
    public func getInStockMessageShort() -> String {
        return self.inStockMessageShort
    }
    
    /**
     Getter for in_long.

     - Returns:  String
     */
    public func getInStockMessageLong() -> String {
        return self.inStockMessageLong
    }
    
    /**
     Getter for low_track.

     - Returns:  String
     */
    public func getTrackLowStockLevel() -> String {
        return self.trackLowStockLevel
    }
    
    /**
     Getter for low_level.
     
     - Returns:  Int
     */
    public func getLowStockLevel() -> Int {
        return self.lowStockLevel
    }
    
    /**
     Getter for low_lvl_d.
     
     - Returns:  Bool
     */
    public func getLowStockLevelDefault() -> Bool {
        return self.lowStockLevelDefault
    }
    
    /**
     Getter for low_short.

     - Returns:  String
     */
    public func getLowStockMessageShort() -> String {
        return self.lowStockMessageShort
    }
    
    /**
     Getter for low_long.

     - Returns:  String
     */
    public func getLowStockMessageLong() -> String {
        return self.lowStockMessageLong
    }
    
    /**
     Getter for out_track.

     - Returns:  String
     */
    public func getTrackOutOfStockLevel() -> String {
        return self.trackOutOfStockLevel
    }
    
    /**
     Getter for out_hide.

     - Returns:  String
     */
    public func getHideOutOfStock() -> String {
        return self.hideOutOfStock
    }
    
    /**
     Getter for out_level.
     
     - Returns:  Int
     */
    public func getOutOfStockLevel() -> Int {
        return self.outOfStockLevel
    }
    
    /**
     Getter for out_lvl_d.
     
     - Returns:  Bool
     */
    public func getOutOfStockLevelDefault() -> Bool {
        return self.outOfStockLevelDefault
    }
    
    /**
     Getter for out_short.

     - Returns:  String
     */
    public func getOutOfStockMessageShort() -> String {
        return self.outOfStockMessageShort
    }
    
    /**
     Getter for out_long.

     - Returns:  String
     */
    public func getOutOfStockMessageLong() -> String {
        return self.outOfStockMessageLong
    }
    
    /**
     Getter for ltd_long.

     - Returns:  String
     */
    public func getLimitedStockMessage() -> String {
        return self.limitedStockMessage
    }
}
