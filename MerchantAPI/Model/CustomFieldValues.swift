/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// CustomFieldValue data model. Represents a single value of unknown type, resolved during runtime.
/// SeeAlso: VariableValue
public class CustomFieldValue : VariableValue {

}

/// CustomFieldValues data model. The container for all CustomFieldValue objects.
public class CustomFieldValues : Codable {
    /// The value container
    var values : [ String : [ String : CustomFieldValue ] ] = [:]

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
    public init(_ values: [ String : [ String : CustomFieldValue ] ] = [:]) {
        self.values = values
    }

    /**
     Initialize from a decoder instance.

     - Parameter: decoder The decoder instance to decode from
     - SeeAlso: Decodable
     */
    public required init( from decoder: Decoder ) throws {
        let container = try decoder.singleValueContainer()
        self.values   = try container.decode([ String : [ String : CustomFieldValue ] ].self)
    }

    /**
     Encode the model into another format from an encoder.

     - Parameter: encoder The encoder instance to encode to
     - SeeAlso: Encodable
     - Throws: error when unable to encode
     */
    public func encode(to encoder: Encoder) throws {
        for (module, fields) in (self.values) {
            var container = encoder.container(keyedBy: EncodingKey.self)
            let codingKey = EncodingKey(stringValue: module)
            try container.encode(fields, forKey: codingKey!)
        }
    }

    /**
     Add a custom field value into the container.

     - Parameter: field The field code
     - Parameter: value The field value
     - Parameter: module The module, defaults to customfields.
     - Returns: Self
     */
    @discardableResult
    public func addValue(_ field: String, _ value: String, _ module : String = "customfields") -> Self {
        if self.values[module] == nil {
            self.values[module] = [:]
        }

        self.values[module]![field] = CustomFieldValue(from: value)

        return self
    }

    /**
     Check if custom field value is defined in the container.

     - Parameter: field The field code
     - Parameter: module The module, defaults to customfields.
     - Returns: Bool
     */
    public func hasValue(_ field: String, _ module: String = "customfields") -> Bool {
        return self.values[module] != nil && self.values[module]?[field] != nil
    }

    /**
     Get a custom field value from the container or nil.

     - Parameter: field The field code
     - Parameter: module The module, defaults to customfields.
     - Returns: Optional<CustomFieldValue>
     */
    public func getValue(_ field: String, _ module: String = "customfields") -> Optional<CustomFieldValue> {
        if self.hasValue(field, module) {
            return self.values[module]?[field]
        }

        return nil
    }
}
