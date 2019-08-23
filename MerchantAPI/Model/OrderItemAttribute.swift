/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// OrderItemAttribute data model.
public class OrderItemAttribute : Model {

    /// Model field attr_code.
    var attributeCode : String

    /// Model field opt_code_or_data.
    var optionCodeOrData : String

    /// Model field price.
    var price : Decimal

    /// Model field weight.
    var weight : Decimal

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case attributeCode = "attr_code"
        case optionCodeOrData = "opt_code_or_data"
        case price
        case weight
    }

    /**
     OrderItemAttribute Constructor.
     */
    public override init() {
        self.attributeCode = ""
        self.optionCodeOrData = ""
        self.price = Decimal(0.00)
        self.weight = Decimal(0.00)

        super.init()
    }

    /**
     OrderItemAttribute Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.attributeCode = try container.decodeIfPresent(String.self, forKey: .attributeCode) ?? ""
        self.optionCodeOrData = try container.decodeIfPresent(String.self, forKey: .optionCodeOrData) ?? ""
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? Decimal(0.00)
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? Decimal(0.00)

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

        try container.encodeIfPresent(self.attributeCode, forKey: .attributeCode)
        try container.encodeIfPresent(self.optionCodeOrData, forKey: .optionCodeOrData)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .weight)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for attr_code.

     - Returns:  String
     */
    public func getAttributeCode() -> String {
        return self.attributeCode
    }
    
    /**
     Getter for opt_code_or_data.

     - Returns:  String
     */
    public func getOptionCodeOrData() -> String {
        return self.optionCodeOrData
    }
    
    /**
     Getter for price.
     
     - Returns:  Decimal
     */
    public func getPrice() -> Decimal {
        return self.price
    }
    
    /**
     Getter for weight.
     
     - Returns:  Decimal
     */
    public func getWeight() -> Decimal {
        return self.weight
    }

    /**
     Setter for attr_code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeCode(_ value: String) -> Self {
        self.attributeCode = value
        return self
    }

    /**
     Setter for opt_code_or_data.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setOptionCodeOrData(_ value: String) -> Self {
        self.optionCodeOrData = value
        return self
    }

    /**
     Setter for price.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setPrice(_ value: Decimal) -> Self {
        self.price = value
        return self
    }

    /**
     Setter for weight.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setWeight(_ value: Decimal) -> Self {
        self.weight = value
        return self
    }
}
