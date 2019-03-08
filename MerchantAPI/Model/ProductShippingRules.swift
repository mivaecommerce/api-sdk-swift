/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: ProductShippingRules.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/// ProductShippingRules data model.
public class ProductShippingRules : Model {

    /// Model field product_id.
    var productId : Int

    /// Model field ownpackage.
    var ownPackage : Bool

    /// Model field width.
    var width : Decimal

    /// Model field length.
    var length : Decimal

    /// Model field height.
    var height : Decimal

    /// Model field limitmeths.
    var limitMethods : Bool

    /// Model field methods.
    var methods : [ProductShippingMethod]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case ownPackage = "ownpackage"
        case width
        case length
        case height
        case limitMethods = "limitmeths"
        case methods
    }

    /**
     ProductShippingRules Constructor.
     */
    public override init() {
        self.productId = 0
        self.ownPackage = false
        self.width = Decimal(0.00)
        self.length = Decimal(0.00)
        self.height = Decimal(0.00)
        self.limitMethods = false
        self.methods = []

        super.init()
    }

    /**
     ProductShippingRules Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.ownPackage = try container.decodeIfPresent(Bool.self, forKey: .ownPackage) ?? false
        self.width = try container.decodeIfPresent(Decimal.self, forKey: .width) ?? Decimal(0.00)
        self.length = try container.decodeIfPresent(Decimal.self, forKey: .length) ?? Decimal(0.00)
        self.height = try container.decodeIfPresent(Decimal.self, forKey: .height) ?? Decimal(0.00)
        self.limitMethods = try container.decodeIfPresent(Bool.self, forKey: .limitMethods) ?? false
        self.methods = try container.decodeIfPresent([ProductShippingMethod].self, forKey: .methods) ?? []

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

        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.ownPackage, forKey: .ownPackage)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.width, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .width)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.length, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .length)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.height, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .height)
        try container.encodeIfPresent(self.limitMethods, forKey: .limitMethods)
        try container.encodeIfPresent(self.methods, forKey: .methods)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for product_id.
     
     - Returns:  Int
     */
    public func getProductId() -> Int {
        return self.productId
    }
    
    /**
     Getter for ownpackage.
     
     - Returns:  Bool
     */
    public func getOwnPackage() -> Bool {
        return self.ownPackage
    }
    
    /**
     Getter for width.
     
     - Returns:  Decimal
     */
    public func getWidth() -> Decimal {
        return self.width
    }
    
    /**
     Getter for length.
     
     - Returns:  Decimal
     */
    public func getLength() -> Decimal {
        return self.length
    }
    
    /**
     Getter for height.
     
     - Returns:  Decimal
     */
    public func getHeight() -> Decimal {
        return self.height
    }
    
    /**
     Getter for limitmeths.
     
     - Returns:  Bool
     */
    public func getLimitMethods() -> Bool {
        return self.limitMethods
    }
    
    /**
     Getter for methods.
     
     - Returns:  [ProductShippingMethod]
     */
    public func getMethods() -> [ProductShippingMethod] {
        return self.methods
    }
    
    /**
     Add a ProductShippingMethod.
     
     - Parameters:
        - methods: ProductShippingMethod
     - Returns:  Self
     */
    @discardableResult
    public func addMethods(_ methods: ProductShippingMethod) -> Self {
        self.methods.append(methods)
        return self
    }
}
