/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// ProductOption data model.
public class ProductOption : Model {

    /// Model field id.
    var id : Int

    /// Model field product_id.
    var productId : Int

    /// Model field attr_id.
    var attributeId : Int

    /// Model field attemp_id.
    var attempId : Int

    /// Model field attmpat_id.
    var attmpatId : Int

    /// Model field disp_order.
    var displayOrder : Int

    /// Model field code.
    var code : String

    /// Model field prompt.
    var prompt : String

    /// Model field price.
    var price : Decimal

    /// Model field cost.
    var cost : Decimal

    /// Model field weight.
    var weight : Decimal

    /// Model field image.
    var image : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case productId = "product_id"
        case attributeId = "attr_id"
        case attempId = "attemp_id"
        case attmpatId = "attmpat_id"
        case displayOrder = "disp_order"
        case code
        case prompt
        case price
        case cost
        case weight
        case image
    }

    /**
     ProductOption Constructor.
     */
    public override init() {
        self.id = 0
        self.productId = 0
        self.attributeId = 0
        self.attempId = 0
        self.attmpatId = 0
        self.displayOrder = 0
        self.code = ""
        self.prompt = ""
        self.price = Decimal(0.00)
        self.cost = Decimal(0.00)
        self.weight = Decimal(0.00)
        self.image = ""

        super.init()
    }

    /**
     ProductOption Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.attributeId = try container.decodeIfPresent(Int.self, forKey: .attributeId) ?? 0
        self.attempId = try container.decodeIfPresent(Int.self, forKey: .attempId) ?? 0
        self.attmpatId = try container.decodeIfPresent(Int.self, forKey: .attmpatId) ?? 0
        self.displayOrder = try container.decodeIfPresent(Int.self, forKey: .displayOrder) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt) ?? ""
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? Decimal(0.00)
        self.cost = try container.decodeIfPresent(Decimal.self, forKey: .cost) ?? Decimal(0.00)
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? Decimal(0.00)
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""

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

        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.attributeId, forKey: .attributeId)
        try container.encodeIfPresent(self.attempId, forKey: .attempId)
        try container.encodeIfPresent(self.attmpatId, forKey: .attmpatId)
        try container.encodeIfPresent(self.displayOrder, forKey: .displayOrder)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .cost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .weight)
        try container.encodeIfPresent(self.image, forKey: .image)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for id.
     
     - Returns:  Int
     */
    public func getId() -> Int {
        return self.id
    }
    
    /**
     Getter for product_id.
     
     - Returns:  Int
     */
    public func getProductId() -> Int {
        return self.productId
    }
    
    /**
     Getter for attr_id.
     
     - Returns:  Int
     */
    public func getAttributeId() -> Int {
        return self.attributeId
    }
    
    /**
     Getter for attemp_id.
     
     - Returns:  Int
     */
    public func getAttempId() -> Int {
        return self.attempId
    }
    
    /**
     Getter for attmpat_id.
     
     - Returns:  Int
     */
    public func getAttmpatId() -> Int {
        return self.attmpatId
    }
    
    /**
     Getter for disp_order.
     
     - Returns:  Int
     */
    public func getDisplayOrder() -> Int {
        return self.displayOrder
    }
    
    /**
     Getter for code.

     - Returns:  String
     */
    public func getCode() -> String {
        return self.code
    }
    
    /**
     Getter for prompt.

     - Returns:  String
     */
    public func getPrompt() -> String {
        return self.prompt
    }
    
    /**
     Getter for price.
     
     - Returns:  Decimal
     */
    public func getPrice() -> Decimal {
        return self.price
    }
    
    /**
     Getter for cost.
     
     - Returns:  Decimal
     */
    public func getCost() -> Decimal {
        return self.cost
    }
    
    /**
     Getter for weight.
     
     - Returns:  Decimal
     */
    public func getWeight() -> Decimal {
        return self.weight
    }
    
    /**
     Getter for image.

     - Returns:  String
     */
    public func getImage() -> String {
        return self.image
    }
}
