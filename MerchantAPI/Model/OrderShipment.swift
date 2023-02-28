/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderShipment data model.
public class OrderShipment : Model {

    /// Enumeration OrderShipmentStatus
    public enum OrderShipmentStatus : Int {
        case Pending = 0
        case Picking = 100
        case Shipped = 200
    }

    /// Model field id.
    var id : Int

    /// Model field code.
    var code : String

    /// Model field batch_id.
    var batchId : Int

    /// Model field order_id.
    var orderId : Int

    /// Model field status.
    var status : Int

    /// Model field labelcount.
    var labelCount : Int

    /// Model field ship_date.
    var shipDate : Int

    /// Model field tracknum.
    var trackingNumber : String

    /// Model field tracktype.
    var trackingType : String

    /// Model field tracklink.
    var trackingLink : String

    /// Model field weight.
    var weight : Decimal

    /// Model field cost.
    var cost : Decimal

    /// Model field formatted_cost.
    var formattedCost : String

    /// Model field order
    var order : Order

    /// Model field items.
    var items : [OrderItem]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case code
        case batchId = "batch_id"
        case orderId = "order_id"
        case status
        case labelCount = "labelcount"
        case shipDate = "ship_date"
        case trackingNumber = "tracknum"
        case trackingType = "tracktype"
        case trackingLink = "tracklink"
        case weight
        case cost
        case formattedCost = "formatted_cost"
        case order
        case items
    }

    /**
     OrderShipment Constructor.
     */
    public override init() {
        self.id = 0
        self.code = ""
        self.batchId = 0
        self.orderId = 0
        self.status = 0
        self.labelCount = 0
        self.shipDate = 0
        self.trackingNumber = ""
        self.trackingType = ""
        self.trackingLink = ""
        self.weight = Decimal(0.00)
        self.cost = Decimal(0.00)
        self.formattedCost = ""
        self.order = Order()
        self.items = []

        super.init()
    }

    /**
     OrderShipment Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.batchId = try container.decodeIfPresent(Int.self, forKey: .batchId) ?? 0
        self.orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        self.status = try container.decodeIfPresent(Int.self, forKey: .status) ?? 0
        self.labelCount = try container.decodeIfPresent(Int.self, forKey: .labelCount) ?? 0
        self.shipDate = try container.decodeIfPresent(Int.self, forKey: .shipDate) ?? 0
        self.trackingNumber = try container.decodeIfPresent(String.self, forKey: .trackingNumber) ?? ""
        self.trackingType = try container.decodeIfPresent(String.self, forKey: .trackingType) ?? ""
        self.trackingLink = try container.decodeIfPresent(String.self, forKey: .trackingLink) ?? ""
        self.weight = try container.decodeIfPresent(Decimal.self, forKey: .weight) ?? Decimal(0.00)
        self.cost = try container.decodeIfPresent(Decimal.self, forKey: .cost) ?? Decimal(0.00)
        self.formattedCost = try container.decodeIfPresent(String.self, forKey: .formattedCost) ?? ""
        self.order = try container.decodeIfPresent(Order.self, forKey: .order) ?? Order()
        self.items = try container.decodeIfPresent([OrderItem].self, forKey: .items) ?? []

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
        try container.encodeIfPresent(self.batchId, forKey: .batchId)
        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.labelCount, forKey: .labelCount)
        try container.encodeIfPresent(self.shipDate, forKey: .shipDate)
        try container.encodeIfPresent(self.trackingNumber, forKey: .trackingNumber)
        try container.encodeIfPresent(self.trackingType, forKey: .trackingType)
        try container.encodeIfPresent(self.trackingLink, forKey: .trackingLink)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .weight)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.cost, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .cost)
        try container.encodeIfPresent(self.formattedCost, forKey: .formattedCost)
        try container.encodeIfPresent(self.order, forKey: .order)
        try container.encodeIfPresent(self.items, forKey: .items)

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
     Getter for batch_id.

     - Returns:  Int

     */
    public func getBatchId() -> Int {
        return self.batchId
    }

    /**
     Getter for order_id.

     - Returns:  Int

     */
    public func getOrderId() -> Int {
        return self.orderId
    }

    /**
     Getter for status.

     - Returns:  Int

     */
    public func getStatus() -> Int {
        return self.status
    }

    /**
     Enum Getter for status.

     - Returns:  Optional<OrderShipmentStatus>
     */
    public func getStatus() -> Optional<OrderShipmentStatus> {
        return OrderShipmentStatus(rawValue: self.status) ?? nil
    }

    /**
     Getter for labelcount.

     - Returns:  Int

     */
    public func getLabelCount() -> Int {
        return self.labelCount
    }

    /**
     Getter for ship_date.

     - Returns:  Int

     */
    public func getShipDate() -> Int {
        return self.shipDate
    }

    /**
     Getter for tracknum.

     - Returns:  String

     */
    public func getTrackingNumber() -> String {
        return self.trackingNumber
    }

    /**
     Getter for tracktype.

     - Returns:  String

     */
    public func getTrackingType() -> String {
        return self.trackingType
    }

    /**
     Getter for tracklink.

     - Returns:  String

     */
    public func getTrackingLink() -> String {
        return self.trackingLink
    }

    /**
     Getter for weight.

     - Returns:  Decimal     */
    public func getWeight() -> Decimal {
        return self.weight
    }

    /**
     Getter for cost.

     - Returns:  Decimal     */
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
     Getter for order.

     - Returns:  Order
     */
    public func getOrder() -> Order {
        return self.order
    }

    /**
     Getter for items.

     - Returns:  [OrderItem]
     */
    public func getItems() -> [OrderItem] {
        return self.items
    }
}
