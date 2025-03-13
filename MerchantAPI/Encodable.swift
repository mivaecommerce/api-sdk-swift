/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// The float precision when encoding decimal values to json
@available(*, deprecated)
public var MERCHANTAPI_FLOAT_PRECISION = 2

@available(*, deprecated)
public var MERCHANTAPI_FLOAT_ENCODE_PRECISION = MERCHANTAPI_FLOAT_PRECISION

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

        if let dec = self.value as? Decimal {
            self.value = dec.rounded()
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
    public func rounded(precision: Int = 2, roundingMode: NSDecimalNumber.RoundingMode = .plain) -> Decimal {
        var value = self
        var ret = value
        NSDecimalRound(&ret, &value, precision, roundingMode)
        return ret
    }

    public static func roundForEncoding(value: Optional<Decimal>, precision: Int = 2, roundingMode: NSDecimalNumber.RoundingMode = .plain) -> Optional<Decimal> {
        if let value = value {
            return value.rounded(precision: precision, roundingMode: roundingMode)
        }

        return nil
    }
}

/// DateTimeStruct data model. Represents a DateTime in JSON_DateTime structure format
public class DateTime : Codable {
    var timeT : Date
    var year : Int = 0
    var month : Int = 0
    var day : Int = 0
    var hour : Int = 0
    var minute : Int = 0
    var second : Int = 0
    var timezone : Int = 0

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case timeT = "time_t"
        case year
        case month
        case day
        case hour
        case minute
        case second
        case timezone
    }

    /**
     CustomFieldValues Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let singleValue = try? decoder.singleValueContainer()

        if singleValue != nil {
            let dvalue = try? singleValue?.decode(Int64.self)
            if dvalue != nil {
                self.timeT = Date(timeIntervalSince1970: Double(dvalue ?? 0))
                return
            }
        }

        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.timeT = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int64.self, forKey: .timeT) ?? 0))
        self.year = try container.decode(Int.self, forKey: .year)
        self.month = try container.decode(Int.self, forKey: .month)
        self.day = try container.decode(Int.self, forKey: .day)
        self.hour = try container.decode(Int.self, forKey: .hour)
        self.minute = try container.decode(Int.self, forKey: .minute)
        self.second = try container.decode(Int.self, forKey: .second)
        self.timezone = try container.decode(Int.self, forKey: .timezone)
    }
}

public class DateTimeStruct : DateTime {

}

public func isPrimitiveCodableType(_ v: Any?) -> Bool
{
    return  v is String ||
            v is (any FixedWidthInteger) ||
            v is Float ||
            v is Double ||
            v is Decimal ||
            v is Bool
}

public func isDictionaryCodableType(_ v: Any?) -> Bool
{
    return v is Dictionary<String, Any>
}

public func isArrayCodableType(_ v: Any?) -> Bool
{
    return v is Array<Any>
}
