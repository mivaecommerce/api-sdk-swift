/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// ProductSubscriptionTerm data model.
public class ProductSubscriptionTerm : Model {

    /// Enumeration TermFrequency
    public enum TermFrequency : String {
        case NDays = "n"
        case NMonths = "n_months"
        case Daily = "daily"
        case Weekly = "weekly"
        case Biweekly = "biweekly"
        case Quarterly = "quarterly"
        case Semiannually = "semiannually"
        case Annually = "annually"
        case FixedWeekly = "fixedweekly"
        case FixedMonthly = "fixedmonthly"
        case Dates = "dates"
    }

    /// Model field id.
    var id : Int

    /// Model field product_id.
    var productId : Int

    /// Model field frequency.
    var frequency : String

    /// Model field term.
    var term : Int

    /// Model field descrip.
    var description : String

    /// Model field n.
    var n : Int

    /// Model field fixed_dow.
    var fixedDayOfWeek : Int

    /// Model field fixed_dom.
    var fixedDayOfMonth : Int

    /// Model field sub_count.
    var subscriptionCount : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case productId = "product_id"
        case frequency
        case term
        case description = "descrip"
        case n
        case fixedDayOfWeek = "fixed_dow"
        case fixedDayOfMonth = "fixed_dom"
        case subscriptionCount = "sub_count"
    }

    /**
     ProductSubscriptionTerm Constructor.
     */
    public override init() {
        self.id = 0
        self.productId = 0
        self.frequency = ""
        self.term = 0
        self.description = ""
        self.n = 0
        self.fixedDayOfWeek = 0
        self.fixedDayOfMonth = 0
        self.subscriptionCount = 0

        super.init()
    }

    /**
     ProductSubscriptionTerm Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.frequency = try container.decodeIfPresent(String.self, forKey: .frequency) ?? ""
        self.term = try container.decodeIfPresent(Int.self, forKey: .term) ?? 0
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.n = try container.decodeIfPresent(Int.self, forKey: .n) ?? 0
        self.fixedDayOfWeek = try container.decodeIfPresent(Int.self, forKey: .fixedDayOfWeek) ?? 0
        self.fixedDayOfMonth = try container.decodeIfPresent(Int.self, forKey: .fixedDayOfMonth) ?? 0
        self.subscriptionCount = try container.decodeIfPresent(Int.self, forKey: .subscriptionCount) ?? 0

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
        try container.encodeIfPresent(self.frequency, forKey: .frequency)
        try container.encodeIfPresent(self.term, forKey: .term)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.n, forKey: .n)
        try container.encodeIfPresent(self.fixedDayOfWeek, forKey: .fixedDayOfWeek)
        try container.encodeIfPresent(self.fixedDayOfMonth, forKey: .fixedDayOfMonth)
        try container.encodeIfPresent(self.subscriptionCount, forKey: .subscriptionCount)

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
     Getter for frequency.

     - Returns:  String
     */
    public func getFrequency() -> String {
        return self.frequency
    }
    
    /**
     Getter for term.
     
     - Returns:  Int
     */
    public func getTerm() -> Int {
        return self.term
    }
    
    /**
     Getter for descrip.

     - Returns:  String
     */
    public func getDescription() -> String {
        return self.description
    }
    
    /**
     Getter for n.
     
     - Returns:  Int
     */
    public func getN() -> Int {
        return self.n
    }
    
    /**
     Getter for fixed_dow.
     
     - Returns:  Int
     */
    public func getFixedDayOfWeek() -> Int {
        return self.fixedDayOfWeek
    }
    
    /**
     Getter for fixed_dom.
     
     - Returns:  Int
     */
    public func getFixedDayOfMonth() -> Int {
        return self.fixedDayOfMonth
    }
    
    /**
     Getter for sub_count.
     
     - Returns:  Int
     */
    public func getSubscriptionCount() -> Int {
        return self.subscriptionCount
    }
}
