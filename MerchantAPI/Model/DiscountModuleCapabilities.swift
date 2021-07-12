/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// DiscountModuleCapabilities data model.
public class DiscountModuleCapabilities : Model {

    /// Model field preitems.
    var preitems : Bool
    /// Model field items.
    var items : Bool
    /// Model field eligibility.
    var eligibility : String
    /// Model field basket.
    var basket : Bool
    /// Model field shipping.
    var shipping : Bool
    /// Model field qualifying.
    var qualifying : Bool
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case preitems
        case items
        case eligibility
        case basket
        case shipping
        case qualifying
    }

    /**
     DiscountModuleCapabilities Constructor.
     */
    public override init() {
        self.preitems = false
        self.items = false
        self.eligibility = ""
        self.basket = false
        self.shipping = false
        self.qualifying = false

        super.init()
    }

    /**
     DiscountModuleCapabilities Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.preitems = try container.decodeIfPresent(Bool.self, forKey: .preitems) ?? false
        self.items = try container.decodeIfPresent(Bool.self, forKey: .items) ?? false
        self.eligibility = try container.decodeIfPresent(String.self, forKey: .eligibility) ?? ""
        self.basket = try container.decodeIfPresent(Bool.self, forKey: .basket) ?? false
        self.shipping = try container.decodeIfPresent(Bool.self, forKey: .shipping) ?? false
        self.qualifying = try container.decodeIfPresent(Bool.self, forKey: .qualifying) ?? false

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

        try container.encodeIfPresent(self.preitems, forKey: .preitems)
        try container.encodeIfPresent(self.items, forKey: .items)
        try container.encodeIfPresent(self.eligibility, forKey: .eligibility)
        try container.encodeIfPresent(self.basket, forKey: .basket)
        try container.encodeIfPresent(self.shipping, forKey: .shipping)
        try container.encodeIfPresent(self.qualifying, forKey: .qualifying)

        try super.encode(to: encoder)
    }

    /**
     Getter for preitems.

     - Returns:  Bool     */
    public func getPreitems() -> Bool {
        return self.preitems
    }

    /**
     Getter for items.

     - Returns:  Bool     */
    public func getItems() -> Bool {
        return self.items
    }

    /**
     Getter for eligibility.

     - Returns:  String

     */
    public func getEligibility() -> String {
        return self.eligibility
    }

    /**
     Getter for basket.

     - Returns:  Bool     */
    public func getBasket() -> Bool {
        return self.basket
    }

    /**
     Getter for shipping.

     - Returns:  Bool     */
    public func getShipping() -> Bool {
        return self.shipping
    }

    /**
     Getter for qualifying.

     - Returns:  Bool     */
    public func getQualifying() -> Bool {
        return self.qualifying
    }
}
