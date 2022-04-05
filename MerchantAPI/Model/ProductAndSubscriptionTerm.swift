/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductAndSubscriptionTerm data model.
public class ProductAndSubscriptionTerm : Product {

    /// Model field term_id.
    var termId : Int

    /// Model field term_frequency.
    var termFrequency : String

    /// Model field term_term.
    var termTerm : Int

    /// Model field term_descrip.
    var termDescrip : String

    /// Model field term_n.
    var termN : Int

    /// Model field term_fixed_dow.
    var termFixedDayOfWeek : Int

    /// Model field term_fixed_dom.
    var termFixedDayOfMonth : Int

    /// Model field term_sub_count.
    var termSubscriptionCount : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case termId = "term_id"
        case termFrequency = "term_frequency"
        case termTerm = "term_term"
        case termDescrip = "term_descrip"
        case termN = "term_n"
        case termFixedDayOfWeek = "term_fixed_dow"
        case termFixedDayOfMonth = "term_fixed_dom"
        case termSubscriptionCount = "term_sub_count"
    }

    /**
     ProductAndSubscriptionTerm Constructor.
     */
    public override init() {
        self.termId = 0
        self.termFrequency = ""
        self.termTerm = 0
        self.termDescrip = ""
        self.termN = 0
        self.termFixedDayOfWeek = 0
        self.termFixedDayOfMonth = 0
        self.termSubscriptionCount = 0

        super.init()
    }

    /**
     ProductAndSubscriptionTerm Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.termId = try container.decodeIfPresent(Int.self, forKey: .termId) ?? 0
        self.termFrequency = try container.decodeIfPresent(String.self, forKey: .termFrequency) ?? ""
        self.termTerm = try container.decodeIfPresent(Int.self, forKey: .termTerm) ?? 0
        self.termDescrip = try container.decodeIfPresent(String.self, forKey: .termDescrip) ?? ""
        self.termN = try container.decodeIfPresent(Int.self, forKey: .termN) ?? 0
        self.termFixedDayOfWeek = try container.decodeIfPresent(Int.self, forKey: .termFixedDayOfWeek) ?? 0
        self.termFixedDayOfMonth = try container.decodeIfPresent(Int.self, forKey: .termFixedDayOfMonth) ?? 0
        self.termSubscriptionCount = try container.decodeIfPresent(Int.self, forKey: .termSubscriptionCount) ?? 0

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

        try container.encodeIfPresent(self.termId, forKey: .termId)
        try container.encodeIfPresent(self.termFrequency, forKey: .termFrequency)
        try container.encodeIfPresent(self.termTerm, forKey: .termTerm)
        try container.encodeIfPresent(self.termDescrip, forKey: .termDescrip)
        try container.encodeIfPresent(self.termN, forKey: .termN)
        try container.encodeIfPresent(self.termFixedDayOfWeek, forKey: .termFixedDayOfWeek)
        try container.encodeIfPresent(self.termFixedDayOfMonth, forKey: .termFixedDayOfMonth)
        try container.encodeIfPresent(self.termSubscriptionCount, forKey: .termSubscriptionCount)

        try super.encode(to: encoder)
    }

    /**
     Getter for term_id.

     - Returns:  Int

     */
    public func getTermId() -> Int {
        return self.termId
    }

    /**
     Getter for term_frequency.

     - Returns:  String

     */
    public func getTermFrequency() -> String {
        return self.termFrequency
    }

    /**
     Getter for term_term.

     - Returns:  Int

     */
    public func getTermTerm() -> Int {
        return self.termTerm
    }

    /**
     Getter for term_descrip.

     - Returns:  String

     */
    public func getTermDescrip() -> String {
        return self.termDescrip
    }

    /**
     Getter for term_n.

     - Returns:  Int

     */
    public func getTermN() -> Int {
        return self.termN
    }

    /**
     Getter for term_fixed_dow.

     - Returns:  Int

     */
    public func getTermFixedDayOfWeek() -> Int {
        return self.termFixedDayOfWeek
    }

    /**
     Getter for term_fixed_dom.

     - Returns:  Int

     */
    public func getTermFixedDayOfMonth() -> Int {
        return self.termFixedDayOfMonth
    }

    /**
     Getter for term_sub_count.

     - Returns:  Int

     */
    public func getTermSubscriptionCount() -> Int {
        return self.termSubscriptionCount
    }
}
