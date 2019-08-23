/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// OrderItemOption data model.
public class OrderItemOption : Model {

    /// Model field attribute.
    var attribute : String

    /// Model field value.
    var value : String

    /// Model field weight.
    var weight : Decimal

    /// Model field retail.
    var retail : Decimal

    /// Model field base_price.
    var basePrice : Decimal

    /// Model field price.
    var price : Decimal

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case attribute
        case value
        case weight
        case retail
        case basePrice = "base_price"
        case price
    }

    /**
     EncodeCodingKeys used to map the model when encoding
     
     - SeeAlso: Codable
     */
    private enum EncodeCodingKeys: String, CodingKey {
        case attribute  = "attr_code"
        case value      = "opt_code_or_data"
        case weight
        case price
    }

    /**
     OrderItemOption Constructor.
     */
    public override init() {
        self.attribute = ""
        self.value = ""
        self.weight = Decimal(0.00)
        self.retail = Decimal(0.00)
        self.basePrice = Decimal(0.00)
        self.price = Decimal(0.00)

        super.init()
    }

    /**
     OrderItemOption Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.attribute = try container.decodeIfPresent(String.self, forKey: .attribute) ?? ""
        self.value = try container.decodeIfPresent(String.self, forKey: .value) ?? ""
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? Decimal(0.00)
        self.retail = try container.decodeIfPresent(Decimal.self, forKey: .retail) ?? Decimal(0.00)
        self.basePrice = try container.decodeIfPresent(Decimal.self, forKey: .basePrice) ?? Decimal(0.00)
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? Decimal(0.00)

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
        var container = encoder.container(keyedBy: EncodeCodingKeys.self)
        
        try container.encodeIfPresent(self.attribute, forKey: .attribute)
        try container.encodeIfPresent(self.value, forKey: .value)
        try container.encodeIfPresent(self.weight, forKey: .weight)
        try container.encodeIfPresent(self.price, forKey: .price)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for attribute.

     - Returns:  String
     */
    public func getAttribute() -> String {
        return self.attribute
    }
    
    /**
     Getter for value.

     - Returns:  String
     */
    public func getValue() -> String {
        return self.value
    }
    
    /**
     Getter for weight.
     
     - Returns:  Decimal
     */
    public func getWeight() -> Decimal {
        return self.weight
    }
    
    /**
     Getter for retail.
     
     - Returns:  Decimal
     */
    public func getRetail() -> Decimal {
        return self.retail
    }
    
    /**
     Getter for base_price.
     
     - Returns:  Decimal
     */
    public func getBasePrice() -> Decimal {
        return self.basePrice
    }
    
    /**
     Getter for price.
     
     - Returns:  Decimal
     */
    public func getPrice() -> Decimal {
        return self.price
    }

    /**
     Setter for attribute.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setAttribute(_ value: String) -> Self {
        self.attribute = value
        return self
    }

    /**
     Setter for value.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setValue(_ value: String) -> Self {
        self.value = value
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
}
