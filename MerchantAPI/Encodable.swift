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

/// VariableValue data model. Represents a single value.
public class VariableValue : Codable {

    /// Custom field value types.
    enum ValueType {
        case Unknown
        case Primitive
        case Array
        case Dictionary
        case Null
    }

    /// Underlying value
    var value : Optional<Any> = nil

    /// The type of value
    var type : ValueType = .Unknown

    /**
     Int constructor

     - Parameters:
        - from: Int
     */
    public init(from: Optional<Int>) {
        self.value = from
        self.type = ValueType.Primitive
    }

    /**
     String constructor

     - Parameters:
        - from: String
     */
    public init(from: Optional<String>) {
        self.value = from
        self.type = ValueType.Primitive
    }

    /**
     Float constructor

     - Parameters:
        - from: Float
     */
    public init(from: Optional<Float>) {
        self.value = from
        self.type = ValueType.Primitive
    }

    /**
     Bool constructor

     - Parameters:
        - from: Bool
     */
    public init(from: Optional<Bool>) {
        self.value = from
        self.type = ValueType.Primitive
    }

    /**
     Array constructor

     - Parameters:
        - from: [String]
     */
    public init(from:[VariableValue]) {
        self.value = from
        self.type = ValueType.Array
    }

    /**
     Dictionary constructor.

     - Parameters:
        - from: Dictionary<String, VariableValue>
     */
    public init(from: Dictionary<String, VariableValue>) {
        self.value = from
        self.type = ValueType.Dictionary
    }

    /**
     CustomFieldValues Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if (tryDecodeStringValue(container: container)) {
            self.type = ValueType.Primitive
        } else if (tryDecodeIntValue(container: container)) {
            self.type = ValueType.Primitive
        } else if (tryDecodeFloatValue(container: container)) {
            self.type = ValueType.Primitive
        } else if (tryDecodeBoolValue(container: container)) {
            self.type = ValueType.Primitive
        } else if (tryDecodeArrayValue(container: container)) {
            self.type = ValueType.Array
        } else if (tryDecodeDictionaryValue(container: container)) {
            self.type = ValueType.Dictionary
        } else if (container.decodeNil()) {
            self.type = ValueType.Null
        } else {
           throw DecodingError.typeMismatch(VariableValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected a primitive value, array, or dictionary of values"))
        }
    }

    /**
     Tries to decode the value as a string primitive

      - Parameters:
         - container: SingleValueDecodingContainer
      - Returns:
         - Bool
     */
    private func tryDecodeStringValue(container: SingleValueDecodingContainer) -> Bool  {
        do {
            self.value = try container.decode(String?.self)
        } catch {
            return false;
        }

        return true
    }

    /**
     Tries to decode the value as a bool primitive

      - Parameters:
         - container: SingleValueDecodingContainer
      - Returns:
         - Bool
     */
    private func tryDecodeBoolValue(container: SingleValueDecodingContainer) -> Bool  {
        do {
            self.value = try container.decode(Bool?.self)
        } catch {
            return false;
        }

        return true
    }

    /**
     Tries to decode the value as a float primitive

      - Parameters:
         - container: SingleValueDecodingContainer
      - Returns:
         - Bool
     */
    private func tryDecodeFloatValue(container: SingleValueDecodingContainer) -> Bool  {
        do {
            self.value = try container.decode(Float?.self)
        } catch {
            return false;
        }

        return true
    }

    /**
     Tries to decode the value as a int primitive

      - Parameters:
         - container: SingleValueDecodingContainer
      - Returns:
         - Bool
     */
    private func tryDecodeIntValue(container: SingleValueDecodingContainer) -> Bool  {
        do {
            self.value = try container.decode(Int?.self)
        } catch {
            return false;
        }

        return true
    }

    /**
     Tries to decode the value as an array

      - Parameters:
         - container: SingleValueDecodingContainer
      - Returns:
         - Bool
    */
    private func tryDecodeArrayValue(container: SingleValueDecodingContainer) -> Bool  {
        do {
            self.value = try container.decode([VariableValue].self)
        } catch {
            return false;
        }

        return true
    }

    /**
     Tries to decode the value as a dictionary

      - Parameters:
         - container: SingleValueDecodingContainer
      - Returns:
         - Bool
     */
    private func tryDecodeDictionaryValue(container: SingleValueDecodingContainer) -> Bool  {
        do {
            self.value = try container.decode(Dictionary<String, VariableValue?>.self)
        } catch {
            return false;
        }

        return true
    }

    /**
     Check to see if the underlying data type is an array

      - Returns:
         - Bool
     */
    public func isArray() -> Bool {
        return self.type == ValueType.Array
    }

    /**
     Check to see if the underlying data type is a dictionary

      - Returns:
         - Bool
     */
    public func isDictionary() -> Bool {
        return self.type == ValueType.Dictionary
    }

    /**
     Check to see if the underlying data type is a primitive value

      - Returns:
         - Bool
     */
    public func isPrimitive() -> Bool {
        return self.type == ValueType.Primitive
    }

    /**
     Check to see if the underlying data type is a primitive value of int type

      - Returns:
         - Bool
     */
    public func isInt() -> Bool {
        return self.type == ValueType.Primitive && self.value != nil && self.value is Int
    }

    /**
     Check to see if the underlying data type is a primitive value of float type

      - Returns:
         - Bool
     */
    public func isFloat() -> Bool {
        return self.type == ValueType.Primitive && self.value != nil && self.value is Float
    }

    /**
     Check to see if the underlying data type is a primitive value of string type

      - Returns:
         - Bool
     */
    public func isString() -> Bool {
        return self.type == ValueType.Primitive && self.value != nil && self.value is String
    }

    /**
     Check to see if the underlying data type is a primitive value of string type

      - Returns:
         - Bool
     */
    public func isBool() -> Bool {
        return self.type == ValueType.Primitive && self.value != nil && self.value is Bool
    }

    /**
     Get the underlying array, if the value is an array or nil

      - Returns:
         - Optional<[VariableValue]>
     */
    public func getArrayValue() -> Optional<[VariableValue]> {
        return self.value as? Optional<[VariableValue]> ?? nil
    }

    /**
     Get the underlying dictionary, if the value is a dictionary or nil

      - Returns:
         - Optional<[Dictionary<String, VariableValue>]>
     */
    public func getDictionaryValue() -> Optional<Dictionary<String, VariableValue>> {
        return self.value as? Optional<Dictionary<String, VariableValue>> ?? nil
    }

    /**
     Get the underlying primitive value, if the value is primitive or nil

      - Returns:
         - Optional<Any>
     */
    public func getPrimitiveValue() -> Optional<Any> {
        return self.value
    }

    /**
     Get the underlying primitive value as a string, if the value is primitive and can be converted or nil

      - Returns:
         - Optional<String>
     */
    public func toString() -> Optional<String> {
        return self.value as? String ?? nil
    }

    /**
     Get the underlying primitive value as an integer, if the value is primitive and can be converted or nil

      - Returns:
         - Optional<Int>
     */
    public func toInt() -> Optional<Int> {
        return self.value as? Int ?? nil
    }

    /**
     Get the underlying primitive value as a float, if the value is primitive and can be converted or nil

      - Returns:
         - Optional<Float>
     */
    public func toFloat() -> Optional<Float> {
        return self.value as? Float ?? nil
    }

    /**
     Get the underlying primitive value as a bool, if the value is primitive and can be converted or nil

      - Returns:
         - Optional<Bool>
    */
    public func toBool() -> Optional<Bool> {
        return self.value as? Bool ?? nil
    }

    /**
     Add the the underlying dictionary value, if the value is of a dictionary type. If not this has no effect

      - Returns:
         - Self
    */
    @discardableResult
    public func addToDictionary(key: String, value: VariableValue) -> Self {
        if isDictionary() {
            if var d = getDictionaryValue()  {
                d[key] = value
            }
        }

        return self
    }

    /**
     Add the the underlying array value, if the value is of an array type. If not this has no effect

      - Returns:
         - Self
    */
    @discardableResult
    public func addToArray(value: VariableValue) -> Self {
        if isArray() {
            if var a = getArrayValue() {
                a.append(value)
            }
        }

        return self
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encoder: The Encoder instance.
     - Throws: error when unable to encode.
     - SeeAlso: Encodable
     */
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch(self.type) {
        case .Null:
            try container.encodeNil()
        case .Primitive:
            if self.value is String {
                try container.encode(self.value as! String)
            } else if self.value is Int {
                try container.encode(self.value as! Int)
            } else if self.value is Float {
                try container.encode(self.value as! Float)
            } else if self.value is Bool {
                try container.encode(self.value as! Bool)
            } else {
                throw DecodingError.typeMismatch(VariableValue.self, DecodingError.Context(codingPath: encoder.codingPath, debugDescription: "Unexpected data type"))
            }
        case .Array:
            try container.encode(getArrayValue())
        case .Dictionary:
            try container.encode(getDictionaryValue())
        case .Unknown:
            throw DecodingError.typeMismatch(CustomFieldValue.self, DecodingError.Context(codingPath: encoder.codingPath, debugDescription: "Expected a primitive value, array, or dictionary of values"))
        }
    }
}
