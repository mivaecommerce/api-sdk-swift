/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductSubscriptionTermDate data model.
public class ProductSubscriptionTermDate : Model {

    /// Model field subterm_id.
    var subscriptionTermId : Int

    /// Model field term_dom.
    var termDayOfMonth : Int

    /// Model field term_mon.
    var termMonth : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case subscriptionTermId = "subterm_id"
        case termDayOfMonth = "term_dom"
        case termMonth = "term_mon"
    }

    /**
     ProductSubscriptionTermDate Constructor.
     */
    public override init() {
        self.subscriptionTermId = 0
        self.termDayOfMonth = 0
        self.termMonth = 0

        super.init()
    }

    /**
     ProductSubscriptionTermDate Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.subscriptionTermId = try container.decodeIfPresent(Int.self, forKey: .subscriptionTermId) ?? 0
        self.termDayOfMonth = try container.decodeIfPresent(Int.self, forKey: .termDayOfMonth) ?? 0
        self.termMonth = try container.decodeIfPresent(Int.self, forKey: .termMonth) ?? 0

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

        try container.encodeIfPresent(self.subscriptionTermId, forKey: .subscriptionTermId)
        try container.encodeIfPresent(self.termDayOfMonth, forKey: .termDayOfMonth)
        try container.encodeIfPresent(self.termMonth, forKey: .termMonth)

        try super.encode(to: encoder)
    }

    /**
     Getter for subterm_id.

     - Returns:  Int

     */
    public func getSubscriptionTermId() -> Int {
        return self.subscriptionTermId
    }

    /**
     Getter for term_dom.

     - Returns:  Int

     */
    public func getTermDayOfMonth() -> Int {
        return self.termDayOfMonth
    }

    /**
     Getter for term_mon.

     - Returns:  Int

     */
    public func getTermMonth() -> Int {
        return self.termMonth
    }
}
