/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderProduct data model.
public class OrderProduct : Model {

    /// Model field status.
    var status : Optional<Int>

    /// Model field code.
    var code : String

    /// Model field sku.
    var sku : Optional<String>

    /// Model field tracknum.
    var trackingNumber : Optional<String>

    /// Model field tracktype.
    var trackingType : Optional<String>

    /// Model field quantity.
    var quantity : Int

    /// Model field tax.
    var tax : Decimal

    /// Model field attributes.
    var attributes : [OrderProductAttribute]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case status
        case code
        case sku
        case trackingNumber = "tracknum"
        case trackingType = "tracktype"
        case quantity
        case tax
        case attributes
    }

    /**
     OrderProduct Constructor.
     */
    public override init() {
        self.status = nil
        self.code = ""
        self.sku = nil
        self.trackingNumber = nil
        self.trackingType = nil
        self.quantity = 0
        self.tax = Decimal(0.00)
        self.attributes = []

        super.init()
    }

    /**
     OrderProduct Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.status = try container.decodeIfPresent(Int.self, forKey: .status) ?? nil
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.sku = try container.decodeIfPresent(String.self, forKey: .sku) ?? nil
        self.trackingNumber = try container.decodeIfPresent(String.self, forKey: .trackingNumber) ?? nil
        self.trackingType = try container.decodeIfPresent(String.self, forKey: .trackingType) ?? nil
        self.quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? 0
        self.tax = try container.decodeIfPresent(Decimal.self, forKey: .tax) ?? Decimal(0.00)
        self.attributes = try container.decodeIfPresent([OrderProductAttribute].self, forKey: .attributes) ?? []

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

        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.sku, forKey: .sku)
        try container.encodeIfPresent(self.trackingNumber, forKey: .trackingNumber)
        try container.encodeIfPresent(self.trackingType, forKey: .trackingType)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.tax, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .tax)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)

        try super.encode(to: encoder)
    }

    /**
     Getter for status.

     - Returns:  Optional<Int>

     */
    public func getStatus() -> Optional<Int> {
        return self.status
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

     - Returns:  Optional<String>

     */
    public func getSku() -> Optional<String> {
        return self.sku
    }

    /**
     Getter for tracknum.

     - Returns:  Optional<String>

     */
    public func getTrackingNumber() -> Optional<String> {
        return self.trackingNumber
    }

    /**
     Getter for tracktype.

     - Returns:  Optional<String>

     */
    public func getTrackingType() -> Optional<String> {
        return self.trackingType
    }

    /**
     Getter for quantity.

     - Returns:  Int

     */
    public func getQuantity() -> Int {
        return self.quantity
    }

    /**
     Getter for tax.

     - Returns:  Decimal     */
    public func getTax() -> Decimal {
        return self.tax
    }

    /**
     Getter for attributes.

     - Returns:  [OrderProductAttribute]
     */
    public func getAttributes() -> [OrderProductAttribute] {
        return self.attributes
    }

    /**
     Setter for status.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setStatus(_ value: Int) -> Self {
        self.status = value
        return self
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
     Setter for tracknum.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setTrackingNumber(_ value: String) -> Self {
        self.trackingNumber = value
        return self
    }

    /**
     Setter for tracktype.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setTrackingType(_ value: String) -> Self {
        self.trackingType = value
        return self
    }

    /**
     Setter for quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setQuantity(_ value: Int) -> Self {
        self.quantity = value
        return self
    }

    /**
     Setter for tax.

     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setTax(_ value: Decimal) -> Self {
        self.tax = value
        return self
    }

    /**
     Add a OrderProductAttribute.

     - Parameters:
        - attribute: OrderProductAttribute
     - Returns:  Self
     */
    @discardableResult
    public func addAttribute(_ attribute: OrderProductAttribute) -> Self {
        self.attributes.append(attribute)
        return self
    }
}
