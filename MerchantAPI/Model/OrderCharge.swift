/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderCharge data model.
public class OrderCharge : Model {

    /// Model field order_id.
    var orderId : Int
    /// Model field charge_id.
    var chargeId : Int
    /// Model field module_id.
    var moduleId : Int
    /// Model field type.
    var type : Optional<String>
    /// Model field descrip.
    var description : Optional<String>
    /// Model field amount.
    var amount : Optional<Decimal>
    /// Model field disp_amt.
    var displayAmount : Optional<Decimal>
    /// Model field tax_exempt.
    var taxExempt : Optional<Bool>
    /// Model field tax.
    var tax : Decimal
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case chargeId = "charge_id"
        case moduleId = "module_id"
        case type
        case description = "descrip"
        case amount
        case displayAmount = "disp_amt"
        case taxExempt = "tax_exempt"
        case tax
    }

    /**
     OrderCharge Constructor.
     */
    public override init() {
        self.orderId = 0
        self.chargeId = 0
        self.moduleId = 0
        self.type = nil
        self.description = nil
        self.amount = nil
        self.displayAmount = nil
        self.taxExempt = nil
        self.tax = Decimal(0.00)

        super.init()
    }

    /**
     OrderCharge Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.chargeId = try container.decodeIfPresent(Int.self, forKey: .chargeId) ?? 0
        self.moduleId = try container.decodeIfPresent(Int.self, forKey: .moduleId) ?? 0
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? nil
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? nil
        self.amount = try container.decodeIfPresent(Decimal.self, forKey: .amount) ?? nil
        self.displayAmount = try container.decodeIfPresent(Decimal.self, forKey: .displayAmount) ?? nil
        self.taxExempt = try container.decodeIfPresent(Bool.self, forKey: .taxExempt) ?? nil
        self.tax = try container.decodeIfPresent(Decimal.self, forKey: .tax) ?? Decimal(0.00)

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

        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.chargeId, forKey: .chargeId)
        try container.encodeIfPresent(self.moduleId, forKey: .moduleId)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.amount, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .amount)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.displayAmount, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .displayAmount)
        try container.encodeIfPresent(self.taxExempt, forKey: .taxExempt)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.tax, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .tax)

        try super.encode(to: encoder)
    }

    /**
     Getter for order_id.

     - Returns:  Int

     */
    public func getOrderId() -> Int {
        return self.orderId
    }

    /**
     Getter for charge_id.

     - Returns:  Int

     */
    public func getChargeId() -> Int {
        return self.chargeId
    }

    /**
     Getter for module_id.

     - Returns:  Int

     */
    public func getModuleId() -> Int {
        return self.moduleId
    }

    /**
     Getter for type.

     - Returns:  Optional<String>

     */
    public func getType() -> Optional<String> {
        return self.type
    }

    /**
     Getter for descrip.

     - Returns:  Optional<String>

     */
    public func getDescription() -> Optional<String> {
        return self.description
    }

    /**
     Getter for amount.

     - Returns:  Optional<Decimal>     */
    public func getAmount() -> Optional<Decimal> {
        return self.amount
    }

    /**
     Getter for disp_amt.

     - Returns:  Optional<Decimal>     */
    public func getDisplayAmount() -> Optional<Decimal> {
        return self.displayAmount
    }

    /**
     Getter for tax_exempt.

     - Returns:  Optional<Bool>     */
    public func getTaxExempt() -> Optional<Bool> {
        return self.taxExempt
    }

    /**
     Getter for tax.

     - Returns:  Decimal     */
    public func getTax() -> Decimal {
        return self.tax
    }

    /**
     Setter for type.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setType(_ value: String) -> Self {
        self.type = value
        return self
    }

    /**
     Setter for descrip.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setDescription(_ value: String) -> Self {
        self.description = value
        return self
    }

    /**
     Setter for amount.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setAmount(_ value: Decimal) -> Self {
        self.amount = value
        return self
    }

    /**
     Setter for disp_amt.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setDisplayAmount(_ value: Decimal) -> Self {
        self.displayAmount = value
        return self
    }

    /**
     Setter for tax_exempt.

     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setTaxExempt(_ value: Bool) -> Self {
        self.taxExempt = value
        return self
    }
}
