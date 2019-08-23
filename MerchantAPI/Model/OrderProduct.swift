/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// OrderProduct data model.
public class OrderProduct : Model {

    /// Model field status.
    var status : Int

    /// Model field code.
    var code : String

    /// Model field sku.
    var sku : String

    /// Model field tracknum.
    var trackingNumber : String

    /// Model field tracktype.
    var trackingType : String

    /// Model field quantity.
    var quantity : Int

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
        case attributes
    }

    /**
     OrderProduct Constructor.
     */
    public override init() {
        self.status = 0
        self.code = ""
        self.sku = ""
        self.trackingNumber = ""
        self.trackingType = ""
        self.quantity = 0
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

        self.status = try container.decodeIfPresent(Int.self, forKey: .status) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.sku = try container.decodeIfPresent(String.self, forKey: .sku) ?? ""
        self.trackingNumber = try container.decodeIfPresent(String.self, forKey: .trackingNumber) ?? ""
        self.trackingType = try container.decodeIfPresent(String.self, forKey: .trackingType) ?? ""
        self.quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? 0
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
        try container.encodeIfPresent(self.attributes, forKey: .attributes)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for status.
     
     - Returns:  Int
     */
    public func getStatus() -> Int {
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

     - Returns:  String
     */
    public func getSku() -> String {
        return self.sku
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
     Getter for quantity.
     
     - Returns:  Int
     */
    public func getQuantity() -> Int {
        return self.quantity
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
