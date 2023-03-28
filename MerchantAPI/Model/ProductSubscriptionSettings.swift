/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductSubscriptionSettings data model.
public class ProductSubscriptionSettings : Model {

    /// Model field product_id.
    var productId : Int

    /// Model field enabled.
    var enabled : Bool

    /// Model field mandatory.
    var mandatory : Bool

    /// Model field can_cancel.
    var canCancel : Bool

    /// Model field cncl_min.
    var cancelMinimumRequiredOrders : Int

    /// Model field can_qty.
    var canChangeQuantities : Bool

    /// Model field qty_min.
    var quantitiesMinimumRequiredOrders : Int

    /// Model field can_term.
    var canChangeTerm : Bool

    /// Model field term_min.
    var termMinimumRequiredOrders : Int

    /// Model field can_date.
    var canChangeNextDeliveryDate : Bool

    /// Model field date_min.
    var nextDeliveryDateMinimumRequiredOrders : Int

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case enabled
        case mandatory
        case canCancel = "can_cancel"
        case cancelMinimumRequiredOrders = "cncl_min"
        case canChangeQuantities = "can_qty"
        case quantitiesMinimumRequiredOrders = "qty_min"
        case canChangeTerm = "can_term"
        case termMinimumRequiredOrders = "term_min"
        case canChangeNextDeliveryDate = "can_date"
        case nextDeliveryDateMinimumRequiredOrders = "date_min"
    }

    /**
     ProductSubscriptionSettings Constructor.
     */
    public override init() {
        self.productId = 0
        self.enabled = false
        self.mandatory = false
        self.canCancel = false
        self.cancelMinimumRequiredOrders = 0
        self.canChangeQuantities = false
        self.quantitiesMinimumRequiredOrders = 0
        self.canChangeTerm = false
        self.termMinimumRequiredOrders = 0
        self.canChangeNextDeliveryDate = false
        self.nextDeliveryDateMinimumRequiredOrders = 0

        super.init()
    }

    /**
     ProductSubscriptionSettings Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled) ?? false
        self.mandatory = try container.decodeIfPresent(Bool.self, forKey: .mandatory) ?? false
        self.canCancel = try container.decodeIfPresent(Bool.self, forKey: .canCancel) ?? false
        self.cancelMinimumRequiredOrders = try container.decodeIfPresent(Int.self, forKey: .cancelMinimumRequiredOrders) ?? 0
        self.canChangeQuantities = try container.decodeIfPresent(Bool.self, forKey: .canChangeQuantities) ?? false
        self.quantitiesMinimumRequiredOrders = try container.decodeIfPresent(Int.self, forKey: .quantitiesMinimumRequiredOrders) ?? 0
        self.canChangeTerm = try container.decodeIfPresent(Bool.self, forKey: .canChangeTerm) ?? false
        self.termMinimumRequiredOrders = try container.decodeIfPresent(Int.self, forKey: .termMinimumRequiredOrders) ?? 0
        self.canChangeNextDeliveryDate = try container.decodeIfPresent(Bool.self, forKey: .canChangeNextDeliveryDate) ?? false
        self.nextDeliveryDateMinimumRequiredOrders = try container.decodeIfPresent(Int.self, forKey: .nextDeliveryDateMinimumRequiredOrders) ?? 0

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
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.mandatory, forKey: .mandatory)
        try container.encodeIfPresent(self.canCancel, forKey: .canCancel)
        try container.encodeIfPresent(self.cancelMinimumRequiredOrders, forKey: .cancelMinimumRequiredOrders)
        try container.encodeIfPresent(self.canChangeQuantities, forKey: .canChangeQuantities)
        try container.encodeIfPresent(self.quantitiesMinimumRequiredOrders, forKey: .quantitiesMinimumRequiredOrders)
        try container.encodeIfPresent(self.canChangeTerm, forKey: .canChangeTerm)
        try container.encodeIfPresent(self.termMinimumRequiredOrders, forKey: .termMinimumRequiredOrders)
        try container.encodeIfPresent(self.canChangeNextDeliveryDate, forKey: .canChangeNextDeliveryDate)
        try container.encodeIfPresent(self.nextDeliveryDateMinimumRequiredOrders, forKey: .nextDeliveryDateMinimumRequiredOrders)

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
     Getter for enabled.

     - Returns:  Bool     */
    public func getEnabled() -> Bool {
        return self.enabled
    }

    /**
     Getter for mandatory.

     - Returns:  Bool     */
    public func getMandatory() -> Bool {
        return self.mandatory
    }

    /**
     Getter for can_cancel.

     - Returns:  Bool     */
    public func getCanCancel() -> Bool {
        return self.canCancel
    }

    /**
     Getter for cncl_min.

     - Returns:  Int

     */
    public func getCancelMinimumRequiredOrders() -> Int {
        return self.cancelMinimumRequiredOrders
    }

    /**
     Getter for can_qty.

     - Returns:  Bool     */
    public func getCanChangeQuantities() -> Bool {
        return self.canChangeQuantities
    }

    /**
     Getter for qty_min.

     - Returns:  Int

     */
    public func getQuantitiesMinimumRequiredOrders() -> Int {
        return self.quantitiesMinimumRequiredOrders
    }

    /**
     Getter for can_term.

     - Returns:  Bool     */
    public func getCanChangeTerm() -> Bool {
        return self.canChangeTerm
    }

    /**
     Getter for term_min.

     - Returns:  Int

     */
    public func getTermMinimumRequiredOrders() -> Int {
        return self.termMinimumRequiredOrders
    }

    /**
     Getter for can_date.

     - Returns:  Bool     */
    public func getCanChangeNextDeliveryDate() -> Bool {
        return self.canChangeNextDeliveryDate
    }

    /**
     Getter for date_min.

     - Returns:  Int

     */
    public func getNextDeliveryDateMinimumRequiredOrders() -> Int {
        return self.nextDeliveryDateMinimumRequiredOrders
    }
}
