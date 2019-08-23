/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// RelatedProduct data model.
public class RelatedProduct : Model {

    /// Model field id.
    var id : Int

    /// Model field code.
    var code : String

    /// Model field sku.
    var sku : String

    /// Model field name.
    var name : String

    /// Model field thumbnail.
    var thumbnail : String

    /// Model field image.
    var image : String

    /// Model field price.
    var price : Decimal

    /// Model field formatted_price.
    var formattedPrice : String

    /// Model field cost.
    var cost : Decimal

    /// Model field formatted_cost.
    var formattedCost : String

    /// Model field weight.
    var weight : Decimal

    /// Model field active.
    var active : Bool

    /// Model field page_title.
    var pageTitle : String

    /// Model field taxable.
    var taxable : Bool

    /// Model field dt_created.
    var dateTimeCreated : Int

    /// Model field dt_updated.
    var dateTimeUpdated : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case code
        case sku
        case name
        case thumbnail
        case image
        case price
        case formattedPrice = "formatted_price"
        case cost
        case formattedCost = "formatted_cost"
        case weight
        case active
        case pageTitle = "page_title"
        case taxable
        case dateTimeCreated = "dt_created"
        case dateTimeUpdated = "dt_updated"
    }

    /**
     RelatedProduct Constructor.
     */
    public override init() {
        self.id = 0
        self.code = ""
        self.sku = ""
        self.name = ""
        self.thumbnail = ""
        self.image = ""
        self.price = Decimal(0.00)
        self.formattedPrice = ""
        self.cost = Decimal(0.00)
        self.formattedCost = ""
        self.weight = Decimal(0.00)
        self.active = false
        self.pageTitle = ""
        self.taxable = false
        self.dateTimeCreated = 0
        self.dateTimeUpdated = 0

        super.init()
    }

    /**
     RelatedProduct Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.sku = try container.decodeIfPresent(String.self, forKey: .sku) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.price = try container.decodeIfPresent(Decimal.self, forKey: .price) ?? Decimal(0.00)
        self.formattedPrice = try container.decodeIfPresent(String.self, forKey: .formattedPrice) ?? ""
        self.cost = try container.decodeIfPresent(Decimal.self, forKey: .cost) ?? Decimal(0.00)
        self.formattedCost = try container.decodeIfPresent(String.self, forKey: .formattedCost) ?? ""
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? Decimal(0.00)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false
        self.pageTitle = try container.decodeIfPresent(String.self, forKey: .pageTitle) ?? ""
        self.taxable = try container.decodeIfPresent(Bool.self, forKey: .taxable) ?? false
        self.dateTimeCreated = try container.decodeIfPresent(Int.self, forKey: .dateTimeCreated) ?? 0
        self.dateTimeUpdated = try container.decodeIfPresent(Int.self, forKey: .dateTimeUpdated) ?? 0

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
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.sku, forKey: .sku)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .price)
        try container.encodeIfPresent(self.formattedPrice, forKey: .formattedPrice)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .cost)
        try container.encodeIfPresent(self.formattedCost, forKey: .formattedCost)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .weight)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(self.pageTitle, forKey: .pageTitle)
        try container.encodeIfPresent(self.taxable, forKey: .taxable)
        try container.encodeIfPresent(self.dateTimeCreated, forKey: .dateTimeCreated)
        try container.encodeIfPresent(self.dateTimeUpdated, forKey: .dateTimeUpdated)

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
     Getter for code.

     - Returns:  String
     */
    public func getCode() -> String {
        return self.code
    }
    
    /**
     Getter for sku.

     - Returns:  String
     */
    public func getSku() -> String {
        return self.sku
    }
    
    /**
     Getter for name.

     - Returns:  String
     */
    public func getName() -> String {
        return self.name
    }
    
    /**
     Getter for thumbnail.

     - Returns:  String
     */
    public func getThumbnail() -> String {
        return self.thumbnail
    }
    
    /**
     Getter for image.

     - Returns:  String
     */
    public func getImage() -> String {
        return self.image
    }
    
    /**
     Getter for price.
     
     - Returns:  Decimal
     */
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
    
    /**
     Getter for cost.
     
     - Returns:  Decimal
     */
    public func getCost() -> Decimal {
        return self.cost
    }
    
    /**
     Getter for formatted_cost.

     - Returns:  String
     */
    public func getFormattedCost() -> String {
        return self.formattedCost
    }
    
    /**
     Getter for weight.
     
     - Returns:  Decimal
     */
    public func getWeight() -> Decimal {
        return self.weight
    }
    
    /**
     Getter for active.
     
     - Returns:  Bool
     */
    public func getActive() -> Bool {
        return self.active
    }
    
    /**
     Getter for page_title.

     - Returns:  String
     */
    public func getPageTitle() -> String {
        return self.pageTitle
    }
    
    /**
     Getter for taxable.
     
     - Returns:  Bool
     */
    public func getTaxable() -> Bool {
        return self.taxable
    }
    
    /**
     Getter for dt_created.
     
     - Returns:  Int
     */
    public func getDateTimeCreated() -> Int {
        return self.dateTimeCreated
    }
    
    /**
     Getter for dt_updated.
     
     - Returns:  Int
     */
    public func getDateTimeUpdated() -> Int {
        return self.dateTimeUpdated
    }

    /**
     Setter for code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setCode(_ value: String) -> Self {
        self.code = value
        return self
    }

    /**
     Setter for sku.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setSku(_ value: String) -> Self {
        self.sku = value
        return self
    }

    /**
     Setter for name.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setName(_ value: String) -> Self {
        self.name = value
        return self
    }

    /**
     Setter for thumbnail.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setThumbnail(_ value: String) -> Self {
        self.thumbnail = value
        return self
    }

    /**
     Setter for image.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setImage(_ value: String) -> Self {
        self.image = value
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
     Setter for cost.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setCost(_ value: Decimal) -> Self {
        self.cost = value
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
     Setter for active.
     
     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setActive(_ value: Bool) -> Self {
        self.active = value
        return self
    }

    /**
     Setter for page_title.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setPageTitle(_ value: String) -> Self {
        self.pageTitle = value
        return self
    }

    /**
     Setter for taxable.
     
     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setTaxable(_ value: Bool) -> Self {
        self.taxable = value
        return self
    }
}
