/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: Encodable.swift 73863 2019-03-06 19:35:05Z gidriss $
 */

import Foundation

/// The float precision when encoding decimal values to json
public var MERCHANTAPI_FLOAT_ENCODE_PRECISION = 2

/// Allows for encoding of any encodable value
/// SeeAlso: https://forums.swift.org/t/how-to-encode-objects-of-unknown-type/12253/5

extension Encodable {
    fileprivate func encode(to container: inout SingleValueEncodingContainer) throws {
        try container.encode(self)
    }
}

/// Allows for encoding of any encodable value
public struct AnyEncodable : Encodable {
    var value: Encodable
    
    public init(_ value: Encodable) {
        self.value = value
        
        if self.value is Decimal {
            let rounded = Decimal.roundForEncoding(value: self.value as? Decimal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION)
            
            if rounded != nil {
                self.value = rounded
            }
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try self.value.encode(to: &container)
    }
}

/**
 EncodingKey used to map unknown key names at runtime.
 
 - SeeAlso: Codable
 */
public struct RuntimeCodingKey : CodingKey {
    public var stringValue: String
    
    public init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public var intValue: Int?
    
    public init?(intValue: Int) {
        return nil
    }
}

extension Decimal {
    /**
     Utility function to round a decimal to specified precision.
     
     - Parameters:
         - value: Decimal
         - precision: Int
     - Returns: Decimal
     */
    public static func roundForEncoding(value: Optional<Decimal>, precision: Int) -> Optional<Decimal> {
        if let value = value {
            var value   = value
            var ret     = value
            
            NSDecimalRound(&ret, &value, precision, NSDecimalNumber.RoundingMode.plain)
            
            return ret
        }
        
        return nil
    }
}
