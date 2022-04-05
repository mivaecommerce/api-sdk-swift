/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// VersionSetting data model. Represents a single value of unknown type, resolved during runtime.
/// SeeAlso: VariableValue
public typealias VersionSetting = VariableValue

/// VersionSettings data model. The container for all VersionSetting objects.
public class VersionSettings : Codable {
    /// The value container
    var settings : Optional<VersionSetting>

    /**
     EncodingKey used to map unknown keys into the object.

     - SeeAlso: Codable
     */
    struct EncodingKey : CodingKey {
        var stringValue: String

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int?

        init?(intValue: Int) {
            return nil
        }
    }

    /**
     Initialize and optionally construct from existing container.

     - Parameter: values Defaults to empty container
     */
    public init(_ values: Optional<VersionSetting> = nil) {
        self.settings = values
    }

    /**
     Initialize from a decoder instance.

     - Parameter: decoder The decoder instance to decode from
     - SeeAlso: Decodable
     */
    public required init( from decoder: Decoder ) throws {
        let container = try decoder.singleValueContainer()
        self.settings   = try container.decode(Optional<VersionSetting>.self)
    }

    public func hasItem(item: String) -> Bool {
        if let entry = self.settings?.getDictionaryValue() {
            if  entry[item] != nil {
                return true
            }
        }
        return false
    }

    public func getItem(item: String) -> Optional<VersionSetting> {
        if let entry = self.settings?.getDictionaryValue() {
            if  entry[item] != nil {
                return entry[item]
            }
        }

        return nil
    }

    public func itemHasProperty(item: String, property: String) -> Bool {
        if let entry = self.settings?.getDictionaryValue() {
            if  entry[item] != nil {
                if let ientry = entry[item]!.getDictionaryValue() {
                    if ientry[property] != nil {
                        return true
                    }
                }
            }
        }

        return false
    }

    public func getItemProperty(item: String, property: String) -> Optional<VersionSetting> {
        if let entry = self.settings?.getDictionaryValue() {
            if  entry[item] != nil {
                if let ientry = entry[item]!.getDictionaryValue() {
                    if ientry[property] != nil {
                        return ientry[property]
                    }
                }
            }
        }

        return nil
    }

    @discardableResult
    public func setItem(item: String, value: VersionSetting) -> Self {
        if self.settings == nil {
            self.settings = VersionSetting(from: [item:value])
            return self
        }
        else if let s = self.settings {
            if s.isDictionary(), var d = s.getDictionaryValue() {
                d[item] = value
            }
        }

        return self
    }

    @discardableResult
    public func setItemProperty(item: String, property: String, value: VersionSetting) -> Self {
       if self.settings == nil {
        self.settings = VersionSetting(from: [item:VersionSetting(from: [:])])
       }

        if let s = self.settings {
            if s.isDictionary(), var d = s.getDictionaryValue() {
                if let pitem = d[item] {
                    pitem.addToDictionary(key: property, value: value)
                } else {
                    d[item] = VersionSetting(from: [property:value])
                }
            }
        }

        return self
    }

    /**
     Encode the model into another format from an encoder.

     - Parameter: encoder The encoder instance to encode to
     - SeeAlso: Encodable
     - Throws: error when unable to encode
     */
    public func encode(to encoder: Encoder) throws {
        if self.settings?.isPrimitive() ?? false {
            if let value = self.settings?.getPrimitiveValue() {
                var container = encoder.singleValueContainer()

                if value is Bool {
                    try container.encode(value as! Bool)
                } else if value is Float {
                    try container.encode(value as! Float)
                } else if value is Int {
                    try container.encode(value as! Int)
                } else {
                    try container.encode(value as! String)
                }
            }
        } else if self.settings?.isArray() ?? false {
            if let array = self.settings?.getArrayValue() {
                var container = encoder.unkeyedContainer()
                for value in array {
                    try container.encode(value)
                }
            }
        } else if self.settings?.isDictionary() ?? false {
            if let dict = self.settings?.getDictionaryValue() {
                for (key, value) in (dict) {
                    var container = encoder.container(keyedBy: EncodingKey.self)
                    let codingKey = EncodingKey(stringValue: key)
                    try container.encode(value, forKey: codingKey!)
                }
            }
        } else if self.settings != nil {
            throw DecodingError.typeMismatch(VersionSetting.self, DecodingError.Context(codingPath: encoder.codingPath, debugDescription: "Expected a primitive value, array, or dictionary of values"))
        }
    }
}
