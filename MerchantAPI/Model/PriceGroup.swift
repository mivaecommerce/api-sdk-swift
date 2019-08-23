/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// PriceGroup data model.
public class PriceGroup : Model {

    /// Enumeration Eligibility
    public enum Eligibility : String {
        case Coupon = "C"
        case All = "A"
        case Customer = "X"
        case LoggedIn = "L"
    }

    /// Model field id.
    var id : Int

    /// Model field name.
    var name : String

    /// Model field custscope.
    var customerScope : String

    /// Model field discount.
    var discount : Decimal

    /// Model field markup.
    var markup : Decimal

    /// Model field dt_start.
    var dateTimeStart : Int

    /// Model field dt_end.
    var dateTimeEnd : Int

    /// Model field qmn_subtot.
    var minimumSubtotal : Decimal

    /// Model field qmx_subtot.
    var maximumSubtotal : Decimal

    /// Model field qmn_quan.
    var minimumQuantity : Int

    /// Model field qmx_quan.
    var maximumQuantity : Int

    /// Model field qmn_weight.
    var minimumWeight : Decimal

    /// Model field qmx_weight.
    var maximumWeight : Decimal

    /// Model field bmn_subtot.
    var basketMinimumSubtotal : Decimal

    /// Model field bmx_subtot.
    var basketMaximumSubtotal : Decimal

    /// Model field bmn_quan.
    var basketMinimumQuantity : Int

    /// Model field bmx_quan.
    var basketMaximumQuantity : Int

    /// Model field bmn_weight.
    var basketMinimumWeight : Decimal

    /// Model field bmx_weight.
    var basketMaximumWeight : Decimal

    /// Model field priority.
    var priority : Int

    /// Model field module
    var module : Module

    /// Model field capabilities
    var capabilities : DiscountModuleCapabilities

    /// Model field exclusion.
    var exclusion : Bool

    /// Model field descrip.
    var description : String

    /// Model field display.
    var display : Bool

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case customerScope = "custscope"
        case discount
        case markup
        case dateTimeStart = "dt_start"
        case dateTimeEnd = "dt_end"
        case minimumSubtotal = "qmn_subtot"
        case maximumSubtotal = "qmx_subtot"
        case minimumQuantity = "qmn_quan"
        case maximumQuantity = "qmx_quan"
        case minimumWeight = "qmn_weight"
        case maximumWeight = "qmx_weight"
        case basketMinimumSubtotal = "bmn_subtot"
        case basketMaximumSubtotal = "bmx_subtot"
        case basketMinimumQuantity = "bmn_quan"
        case basketMaximumQuantity = "bmx_quan"
        case basketMinimumWeight = "bmn_weight"
        case basketMaximumWeight = "bmx_weight"
        case priority
        case module
        case capabilities
        case exclusion
        case description = "descrip"
        case display
    }

    /**
     PriceGroup Constructor.
     */
    public override init() {
        self.id = 0
        self.name = ""
        self.customerScope = ""
        self.discount = Decimal(0.00)
        self.markup = Decimal(0.00)
        self.dateTimeStart = 0
        self.dateTimeEnd = 0
        self.minimumSubtotal = Decimal(0.00)
        self.maximumSubtotal = Decimal(0.00)
        self.minimumQuantity = 0
        self.maximumQuantity = 0
        self.minimumWeight = Decimal(0.00)
        self.maximumWeight = Decimal(0.00)
        self.basketMinimumSubtotal = Decimal(0.00)
        self.basketMaximumSubtotal = Decimal(0.00)
        self.basketMinimumQuantity = 0
        self.basketMaximumQuantity = 0
        self.basketMinimumWeight = Decimal(0.00)
        self.basketMaximumWeight = Decimal(0.00)
        self.priority = 0
        self.module = Module()
        self.capabilities = DiscountModuleCapabilities()
        self.exclusion = false
        self.description = ""
        self.display = false

        super.init()
    }

    /**
     PriceGroup Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.customerScope = try container.decodeIfPresent(String.self, forKey: .customerScope) ?? ""
        self.discount = try container.decodeIfPresent(Decimal.self, forKey: .discount) ?? Decimal(0.00)
        self.markup = try container.decodeIfPresent(Decimal.self, forKey: .markup) ?? Decimal(0.00)
        self.dateTimeStart = try container.decodeIfPresent(Int.self, forKey: .dateTimeStart) ?? 0
        self.dateTimeEnd = try container.decodeIfPresent(Int.self, forKey: .dateTimeEnd) ?? 0
        self.minimumSubtotal = try container.decodeIfPresent(Decimal.self, forKey: .minimumSubtotal) ?? Decimal(0.00)
        self.maximumSubtotal = try container.decodeIfPresent(Decimal.self, forKey: .maximumSubtotal) ?? Decimal(0.00)
        self.minimumQuantity = try container.decodeIfPresent(Int.self, forKey: .minimumQuantity) ?? 0
        self.maximumQuantity = try container.decodeIfPresent(Int.self, forKey: .maximumQuantity) ?? 0
        self.minimumWeight = try container.decodeIfPresent(Decimal.self, forKey: .minimumWeight) ?? Decimal(0.00)
        self.maximumWeight = try container.decodeIfPresent(Decimal.self, forKey: .maximumWeight) ?? Decimal(0.00)
        self.basketMinimumSubtotal = try container.decodeIfPresent(Decimal.self, forKey: .basketMinimumSubtotal) ?? Decimal(0.00)
        self.basketMaximumSubtotal = try container.decodeIfPresent(Decimal.self, forKey: .basketMaximumSubtotal) ?? Decimal(0.00)
        self.basketMinimumQuantity = try container.decodeIfPresent(Int.self, forKey: .basketMinimumQuantity) ?? 0
        self.basketMaximumQuantity = try container.decodeIfPresent(Int.self, forKey: .basketMaximumQuantity) ?? 0
        self.basketMinimumWeight = try container.decodeIfPresent(Decimal.self, forKey: .basketMinimumWeight) ?? Decimal(0.00)
        self.basketMaximumWeight = try container.decodeIfPresent(Decimal.self, forKey: .basketMaximumWeight) ?? Decimal(0.00)
        self.priority = try container.decodeIfPresent(Int.self, forKey: .priority) ?? 0
        self.module = try container.decodeIfPresent(Module.self, forKey: .module) ?? Module()
        self.capabilities = try container.decodeIfPresent(DiscountModuleCapabilities.self, forKey: .capabilities) ?? DiscountModuleCapabilities()
        self.exclusion = try container.decodeIfPresent(Bool.self, forKey: .exclusion) ?? false
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.display = try container.decodeIfPresent(Bool.self, forKey: .display) ?? false

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
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.customerScope, forKey: .customerScope)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.discount, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .discount)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.markup, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .markup)
        try container.encodeIfPresent(self.dateTimeStart, forKey: .dateTimeStart)
        try container.encodeIfPresent(self.dateTimeEnd, forKey: .dateTimeEnd)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.minimumSubtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .minimumSubtotal)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.maximumSubtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .maximumSubtotal)
        try container.encodeIfPresent(self.minimumQuantity, forKey: .minimumQuantity)
        try container.encodeIfPresent(self.maximumQuantity, forKey: .maximumQuantity)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.minimumWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .minimumWeight)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.maximumWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .maximumWeight)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basketMinimumSubtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basketMinimumSubtotal)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basketMaximumSubtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basketMaximumSubtotal)
        try container.encodeIfPresent(self.basketMinimumQuantity, forKey: .basketMinimumQuantity)
        try container.encodeIfPresent(self.basketMaximumQuantity, forKey: .basketMaximumQuantity)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basketMinimumWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basketMinimumWeight)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basketMaximumWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basketMaximumWeight)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encodeIfPresent(self.module, forKey: .module)
        try container.encodeIfPresent(self.capabilities, forKey: .capabilities)
        try container.encodeIfPresent(self.exclusion, forKey: .exclusion)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.display, forKey: .display)

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
     Getter for name.

     - Returns:  String
     */
    public func getName() -> String {
        return self.name
    }
    
    /**
     Getter for custscope.

     - Returns:  String
     */
    public func getCustomerScope() -> String {
        return self.customerScope
    }
    
    /**
     Getter for discount.
     
     - Returns:  Decimal
     */
    public func getDiscount() -> Decimal {
        return self.discount
    }
    
    /**
     Getter for markup.
     
     - Returns:  Decimal
     */
    public func getMarkup() -> Decimal {
        return self.markup
    }
    
    /**
     Getter for dt_start.
     
     - Returns:  Int
     */
    public func getDateTimeStart() -> Int {
        return self.dateTimeStart
    }
    
    /**
     Getter for dt_end.
     
     - Returns:  Int
     */
    public func getDateTimeEnd() -> Int {
        return self.dateTimeEnd
    }
    
    /**
     Getter for qmn_subtot.
     
     - Returns:  Decimal
     */
    public func getMinimumSubtotal() -> Decimal {
        return self.minimumSubtotal
    }
    
    /**
     Getter for qmx_subtot.
     
     - Returns:  Decimal
     */
    public func getMaximumSubtotal() -> Decimal {
        return self.maximumSubtotal
    }
    
    /**
     Getter for qmn_quan.
     
     - Returns:  Int
     */
    public func getMinimumQuantity() -> Int {
        return self.minimumQuantity
    }
    
    /**
     Getter for qmx_quan.
     
     - Returns:  Int
     */
    public func getMaximumQuantity() -> Int {
        return self.maximumQuantity
    }
    
    /**
     Getter for qmn_weight.
     
     - Returns:  Decimal
     */
    public func getMinimumWeight() -> Decimal {
        return self.minimumWeight
    }
    
    /**
     Getter for qmx_weight.
     
     - Returns:  Decimal
     */
    public func getMaximumWeight() -> Decimal {
        return self.maximumWeight
    }
    
    /**
     Getter for bmn_subtot.
     
     - Returns:  Decimal
     */
    public func getBasketMinimumSubtotal() -> Decimal {
        return self.basketMinimumSubtotal
    }
    
    /**
     Getter for bmx_subtot.
     
     - Returns:  Decimal
     */
    public func getBasketMaximumSubtotal() -> Decimal {
        return self.basketMaximumSubtotal
    }
    
    /**
     Getter for bmn_quan.
     
     - Returns:  Int
     */
    public func getBasketMinimumQuantity() -> Int {
        return self.basketMinimumQuantity
    }
    
    /**
     Getter for bmx_quan.
     
     - Returns:  Int
     */
    public func getBasketMaximumQuantity() -> Int {
        return self.basketMaximumQuantity
    }
    
    /**
     Getter for bmn_weight.
     
     - Returns:  Decimal
     */
    public func getBasketMinimumWeight() -> Decimal {
        return self.basketMinimumWeight
    }
    
    /**
     Getter for bmx_weight.
     
     - Returns:  Decimal
     */
    public func getBasketMaximumWeight() -> Decimal {
        return self.basketMaximumWeight
    }
    
    /**
     Getter for priority.
     
     - Returns:  Int
     */
    public func getPriority() -> Int {
        return self.priority
    }

    /**
     Getter for module.
     
     - Returns:  Module
     */
    public func getModule() -> Module {
        return self.module
    }

    /**
     Getter for capabilities.
     
     - Returns:  DiscountModuleCapabilities
     */
    public func getCapabilities() -> DiscountModuleCapabilities {
        return self.capabilities
    }
    
    /**
     Getter for exclusion.
     
     - Returns:  Bool
     */
    public func getExclusion() -> Bool {
        return self.exclusion
    }
    
    /**
     Getter for descrip.

     - Returns:  String
     */
    public func getDescription() -> String {
        return self.description
    }
    
    /**
     Getter for display.
     
     - Returns:  Bool
     */
    public func getDisplay() -> Bool {
        return self.display
    }

    /**
     Setter for custscope.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerScope(_ value: String) -> Self {
        self.customerScope = value
        return self
    }

    /**
     Setter for discount.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setDiscount(_ value: Decimal) -> Self {
        self.discount = value
        return self
    }
    
    /**
     Setter for dt_start.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeStart(_ value: Int) -> Self {
        self.dateTimeStart = value
        return self
    }
    
    /**
     Setter for dt_end.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeEnd(_ value: Int) -> Self {
        self.dateTimeEnd = value
        return self
    }

    /**
     Setter for qmn_subtot.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setMinimumSubtotal(_ value: Decimal) -> Self {
        self.minimumSubtotal = value
        return self
    }

    /**
     Setter for qmx_subtot.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setMaximumSubtotal(_ value: Decimal) -> Self {
        self.maximumSubtotal = value
        return self
    }
    
    /**
     Setter for qmn_quan.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setMinimumQuantity(_ value: Int) -> Self {
        self.minimumQuantity = value
        return self
    }
    
    /**
     Setter for qmx_quan.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setMaximumQuantity(_ value: Int) -> Self {
        self.maximumQuantity = value
        return self
    }

    /**
     Setter for qmn_weight.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setMinimumWeight(_ value: Decimal) -> Self {
        self.minimumWeight = value
        return self
    }

    /**
     Setter for qmx_weight.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setMaximumWeight(_ value: Decimal) -> Self {
        self.maximumWeight = value
        return self
    }

    /**
     Setter for bmn_subtot.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMinimumSubtotal(_ value: Decimal) -> Self {
        self.basketMinimumSubtotal = value
        return self
    }

    /**
     Setter for bmx_subtot.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMaximumSubtotal(_ value: Decimal) -> Self {
        self.basketMaximumSubtotal = value
        return self
    }
    
    /**
     Setter for bmn_quan.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMinimumQuantity(_ value: Int) -> Self {
        self.basketMinimumQuantity = value
        return self
    }
    
    /**
     Setter for bmx_quan.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMaximumQuantity(_ value: Int) -> Self {
        self.basketMaximumQuantity = value
        return self
    }

    /**
     Setter for bmn_weight.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMinimumWeight(_ value: Decimal) -> Self {
        self.basketMinimumWeight = value
        return self
    }

    /**
     Setter for bmx_weight.
     
     - Parameters:
        - value: Decimal
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMaximumWeight(_ value: Decimal) -> Self {
        self.basketMaximumWeight = value
        return self
    }
    
    /**
     Setter for priority.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPriority(_ value: Int) -> Self {
        self.priority = value
        return self
    }

    /**
     Setter for exclusion.
     
     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setExclusion(_ value: Bool) -> Self {
        self.exclusion = value
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
     Setter for display.
     
     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setDisplay(_ value: Bool) -> Self {
        self.display = value
        return self
    }
}
