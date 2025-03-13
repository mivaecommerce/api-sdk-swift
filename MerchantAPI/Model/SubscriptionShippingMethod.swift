/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// SubscriptionShippingMethod data model.
public class SubscriptionShippingMethod : Model {

    /// Model field module
    var module : Module

    /// Model field method_code.
    var methodCode : String

    /// Model field method_name.
    var methodName : String

    /// Model field price.
    var price : Decimal

    /// Model field formatted_price.
    var formattedPrice : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case module
        case methodCode = "method_code"
        case methodName = "method_name"
        case price
        case formattedPrice = "formatted_price"
    }

    /**
     SubscriptionShippingMethod Constructor.
     */
    public override init() {
        self.module = Module()
        self.methodCode = ""
        self.methodName = ""
        self.price = Decimal(0.00)
        self.formattedPrice = ""

        super.init()
    }

    /**
     SubscriptionShippingMethod Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.module = try container.decodeIfPresent(Module.self, forKey: .module) ?? Module()
        self.methodCode = try container.decodeIfPresent(String.self, forKey: .methodCode) ?? ""
        self.methodName = try container.decodeIfPresent(String.self, forKey: .methodName) ?? ""
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? Decimal(0.00)
        self.formattedPrice = try container.decodeIfPresent(String.self, forKey: .formattedPrice) ?? ""

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

        try container.encodeIfPresent(self.module, forKey: .module)
        try container.encodeIfPresent(self.methodCode, forKey: .methodCode)
        try container.encodeIfPresent(self.methodName, forKey: .methodName)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: 2), forKey: .price)
        try container.encodeIfPresent(self.formattedPrice, forKey: .formattedPrice)

        try super.encode(to: encoder)
    }

    /**
     Getter for module.

     - Returns:  Module
     */
    public func getModule() -> Module {
        return self.module
    }

    /**
     Getter for method_code.

     - Returns:  String

     */
    public func getMethodCode() -> String {
        return self.methodCode
    }

    /**
     Getter for method_name.

     - Returns:  String

     */
    public func getMethodName() -> String {
        return self.methodName
    }

    /**
     Getter for price.

     - Returns:  Decimal     */
    public func getPrice() -> Decimal {
        return self.price
    }

    /**
     Getter for formatted_price.

     - Returns:  String

     */
    public func getFormattedPrice() -> String {
        return self.formattedPrice
    }
}
