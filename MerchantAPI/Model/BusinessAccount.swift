/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// BusinessAccount data model.
public class BusinessAccount : Model {

    /// Model field id.
    var id : Int

    /// Model field title.
    var title : String

    /// Model field tax_exempt.
    var taxExempt : Bool

    /// Model field order_cnt.
    var orderCount : Int

    /// Model field order_avg.
    var orderAverage : Decimal

    /// Model field formatted_order_avg.
    var formattedOrderAverage : String

    /// Model field order_tot.
    var orderTotal : Decimal

    /// Model field formatted_order_tot.
    var formattedOrderTotal : String

    /// Model field note_count.
    var noteCount : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case taxExempt = "tax_exempt"
        case orderCount = "order_cnt"
        case orderAverage = "order_avg"
        case formattedOrderAverage = "formatted_order_avg"
        case orderTotal = "order_tot"
        case formattedOrderTotal = "formatted_order_tot"
        case noteCount = "note_count"
    }

    /**
     BusinessAccount Constructor.
     */
    public override init() {
        self.id = 0
        self.title = ""
        self.taxExempt = false
        self.orderCount = 0
        self.orderAverage = Decimal(0.00)
        self.formattedOrderAverage = ""
        self.orderTotal = Decimal(0.00)
        self.formattedOrderTotal = ""
        self.noteCount = 0

        super.init()
    }

    /**
     BusinessAccount Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.taxExempt = try container.decodeIfPresent(Bool.self, forKey: .taxExempt) ?? false
        self.orderCount = try container.decodeIfPresent(Int.self, forKey: .orderCount) ?? 0
        self.orderAverage = try container.decodeIfPresent(Decimal.self, forKey: .orderAverage) ?? Decimal(0.00)
        self.formattedOrderAverage = try container.decodeIfPresent(String.self, forKey: .formattedOrderAverage) ?? ""
        self.orderTotal = try container.decodeIfPresent(Decimal.self, forKey: .orderTotal) ?? Decimal(0.00)
        self.formattedOrderTotal = try container.decodeIfPresent(String.self, forKey: .formattedOrderTotal) ?? ""
        self.noteCount = try container.decodeIfPresent(Int.self, forKey: .noteCount) ?? 0

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
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.taxExempt, forKey: .taxExempt)
        try container.encodeIfPresent(self.orderCount, forKey: .orderCount)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.orderAverage, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .orderAverage)
        try container.encodeIfPresent(self.formattedOrderAverage, forKey: .formattedOrderAverage)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.orderTotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .orderTotal)
        try container.encodeIfPresent(self.formattedOrderTotal, forKey: .formattedOrderTotal)
        try container.encodeIfPresent(self.noteCount, forKey: .noteCount)

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
     Getter for title.

     - Returns:  String

     */
    public func getTitle() -> String {
        return self.title
    }

    /**
     Getter for tax_exempt.

     - Returns:  Bool     */
    public func getTaxExempt() -> Bool {
        return self.taxExempt
    }

    /**
     Getter for order_cnt.

     - Returns:  Int

     */
    public func getOrderCount() -> Int {
        return self.orderCount
    }

    /**
     Getter for order_avg.

     - Returns:  Decimal     */
    public func getOrderAverage() -> Decimal {
        return self.orderAverage
    }

    /**
     Getter for formatted_order_avg.

     - Returns:  String

     */
    public func getFormattedOrderAverage() -> String {
        return self.formattedOrderAverage
    }

    /**
     Getter for order_tot.

     - Returns:  Decimal     */
    public func getOrderTotal() -> Decimal {
        return self.orderTotal
    }

    /**
     Getter for formatted_order_tot.

     - Returns:  String

     */
    public func getFormattedOrderTotal() -> String {
        return self.formattedOrderTotal
    }

    /**
     Getter for note_count.

     - Returns:  Int

     */
    public func getNoteCount() -> Int {
        return self.noteCount
    }
}
