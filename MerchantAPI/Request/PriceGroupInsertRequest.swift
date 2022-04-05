/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/**
 Handles API Request PriceGroup_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegroup_insert
 */
public class PriceGroupInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PriceGroup_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Name.
    var name : Optional<String> = nil

    /// Request field CustomerScope.
    var customerScope : Optional<String> = nil

    /// Request field Rate.
    var rate : Optional<String> = nil

    /// Request field Discount.
    var discount : Optional<Decimal> = nil

    /// Request field Markup.
    var markup : Optional<Decimal> = nil

    /// Request field Module_ID.
    var moduleId : Optional<Int> = nil

    /// Request field Edit_Module.
    var editModule : Optional<String> = nil

    /// Request field Module_Code.
    var moduleCode : Optional<String> = nil

    /// Request field Exclusion.
    var exclusion : Optional<Bool> = nil

    /// Request field Description.
    var description : Optional<String> = nil

    /// Request field Display.
    var display : Optional<Bool> = nil

    /// Request field DateTime_Start.
    var dateTimeStart : Optional<Date> = nil

    /// Request field DateTime_End.
    var dateTimeEnd : Optional<Date> = nil

    /// Request field Qualifying_Min_Subtotal.
    var qualifyingMinSubtotal : Optional<Decimal> = nil

    /// Request field Qualifying_Max_Subtotal.
    var qualifyingMaxSubtotal : Optional<Decimal> = nil

    /// Request field Qualifying_Min_Quantity.
    var qualifyingMinQuantity : Optional<Int> = nil

    /// Request field Qualifying_Max_Quantity.
    var qualifyingMaxQuantity : Optional<Int> = nil

    /// Request field Qualifying_Min_Weight.
    var qualifyingMinWeight : Optional<Decimal> = nil

    /// Request field Qualifying_Max_Weight.
    var qualifyingMaxWeight : Optional<Decimal> = nil

    /// Request field Basket_Min_Subtotal.
    var basketMinSubtotal : Optional<Decimal> = nil

    /// Request field Basket_Max_Subtotal.
    var basketMaxSubtotal : Optional<Decimal> = nil

    /// Request field Basket_Min_Quantity.
    var basketMinQuantity : Optional<Int> = nil

    /// Request field Basket_Max_Quantity.
    var basketMaxQuantity : Optional<Int> = nil

    /// Request field Basket_Min_Weight.
    var basketMinWeight : Optional<Decimal> = nil

    /// Request field Basket_Max_Weight.
    var basketMaxWeight : Optional<Decimal> = nil

    /// Request field Priority.
    var priority : Optional<Int> = nil

    /// User set request fields
    var moduleFields : [String:AnyEncodable] = [:]

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case name = "Name"
        case customerScope = "CustomerScope"
        case rate = "Rate"
        case discount = "Discount"
        case markup = "Markup"
        case moduleId = "Module_ID"
        case editModule = "Edit_Module"
        case moduleCode = "Module_Code"
        case exclusion = "Exclusion"
        case description = "Description"
        case display = "Display"
        case dateTimeStart = "DateTime_Start"
        case dateTimeEnd = "DateTime_End"
        case qualifyingMinSubtotal = "Qualifying_Min_Subtotal"
        case qualifyingMaxSubtotal = "Qualifying_Max_Subtotal"
        case qualifyingMinQuantity = "Qualifying_Min_Quantity"
        case qualifyingMaxQuantity = "Qualifying_Max_Quantity"
        case qualifyingMinWeight = "Qualifying_Min_Weight"
        case qualifyingMaxWeight = "Qualifying_Max_Weight"
        case basketMinSubtotal = "Basket_Min_Subtotal"
        case basketMaxSubtotal = "Basket_Max_Subtotal"
        case basketMinQuantity = "Basket_Min_Quantity"
        case basketMaxQuantity = "Basket_Max_Quantity"
        case basketMinWeight = "Basket_Min_Weight"
        case basketMaxWeight = "Basket_Max_Weight"
        case priority = "Priority"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
     */
    public override init(client: Optional<BaseClient> = nil) {
        super.init(client: client)
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encode: A Encoder instance to encode to.
     - Throws: Error when unable to encode the request data.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if self.moduleId != nil {
            try container.encodeIfPresent(self.moduleId, forKey: .moduleId)
        } else if self.editModule != nil {
            try container.encode(self.editModule, forKey: .editModule)
        } else if self.moduleCode != nil {
            try container.encode(self.moduleCode, forKey: .moduleCode)
        }

        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.customerScope, forKey: .customerScope)
        try container.encodeIfPresent(self.rate, forKey: .rate)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.discount, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .discount)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.markup, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .markup)
        try container.encodeIfPresent(self.exclusion, forKey: .exclusion)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.display, forKey: .display)
        if let dateTimeStart = self.dateTimeStart {
            try container.encodeIfPresent(Int64(dateTimeStart.timeIntervalSince1970), forKey: .dateTimeStart)
        }
        if let dateTimeEnd = self.dateTimeEnd {
            try container.encodeIfPresent(Int64(dateTimeEnd.timeIntervalSince1970), forKey: .dateTimeEnd)
        }
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.qualifyingMinSubtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .qualifyingMinSubtotal)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.qualifyingMaxSubtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .qualifyingMaxSubtotal)
        try container.encodeIfPresent(self.qualifyingMinQuantity, forKey: .qualifyingMinQuantity)
        try container.encodeIfPresent(self.qualifyingMaxQuantity, forKey: .qualifyingMaxQuantity)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.qualifyingMinWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .qualifyingMinWeight)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.qualifyingMaxWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .qualifyingMaxWeight)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basketMinSubtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basketMinSubtotal)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basketMaxSubtotal, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basketMaxSubtotal)
        try container.encodeIfPresent(self.basketMinQuantity, forKey: .basketMinQuantity)
        try container.encodeIfPresent(self.basketMaxQuantity, forKey: .basketMaxQuantity)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basketMinWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basketMinWeight)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.basketMaxWeight, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .basketMaxWeight)
        try container.encodeIfPresent(self.priority, forKey: .priority)

        var moduleFieldsContainer = encoder.container(keyedBy: RuntimeCodingKey.self)

        for (key,value) in self.moduleFields {
            try moduleFieldsContainer.encode(value, forKey: RuntimeCodingKey(stringValue: key)!)
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PriceGroupInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PriceGroupInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PriceGroupInsertResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - httpResponse: The underlying HTTP response object
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PriceGroupInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PriceGroupInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PriceGroupInsertResponse.self
    }

    /**
     Getter for Name.

     - Returns:  Optional<String>
     */
    public func getName() -> Optional<String> {
        return self.name
    }

    /**
     Getter for CustomerScope.

     - Returns:  Optional<String>
     */
    public func getCustomerScope() -> Optional<String> {
        return self.customerScope
    }

    /**
     Getter for Rate.

     - Returns:  Optional<String>
     */
    public func getRate() -> Optional<String> {
        return self.rate
    }

    /**
     Getter for Discount.

     - Returns:  Optional<Decimal>
     */
    public func getDiscount() -> Optional<Decimal> {
        return self.discount
    }

    /**
     Getter for Markup.

     - Returns:  Optional<Decimal>
     */
    public func getMarkup() -> Optional<Decimal> {
        return self.markup
    }

    /**
     Getter for Module_ID.

     - Returns:  Optional<Int>
     */
    public func getModuleId() -> Optional<Int> {
        return self.moduleId
    }

    /**
     Getter for Edit_Module.

     - Returns:  Optional<String>
     */
    public func getEditModule() -> Optional<String> {
        return self.editModule
    }

    /**
     Getter for Module_Code.

     - Returns:  Optional<String>
     */
    public func getModuleCode() -> Optional<String> {
        return self.moduleCode
    }

    /**
     Getter for Exclusion.

     - Returns:  Optional<Bool>
     */
    public func getExclusion() -> Optional<Bool> {
        return self.exclusion
    }

    /**
     Getter for Description.

     - Returns:  Optional<String>
     */
    public func getDescription() -> Optional<String> {
        return self.description
    }

    /**
     Getter for Display.

     - Returns:  Optional<Bool>
     */
    public func getDisplay() -> Optional<Bool> {
        return self.display
    }

    /**
     Getter for DateTime_Start.

     - Returns:  Optional<Date>
     */
    public func getDateTimeStart() -> Optional<Date> {
        return self.dateTimeStart
    }

    /**
     Getter for DateTime_End.

     - Returns:  Optional<Date>
     */
    public func getDateTimeEnd() -> Optional<Date> {
        return self.dateTimeEnd
    }

    /**
     Getter for Qualifying_Min_Subtotal.

     - Returns:  Optional<Decimal>
     */
    public func getQualifyingMinSubtotal() -> Optional<Decimal> {
        return self.qualifyingMinSubtotal
    }

    /**
     Getter for Qualifying_Max_Subtotal.

     - Returns:  Optional<Decimal>
     */
    public func getQualifyingMaxSubtotal() -> Optional<Decimal> {
        return self.qualifyingMaxSubtotal
    }

    /**
     Getter for Qualifying_Min_Quantity.

     - Returns:  Optional<Int>
     */
    public func getQualifyingMinQuantity() -> Optional<Int> {
        return self.qualifyingMinQuantity
    }

    /**
     Getter for Qualifying_Max_Quantity.

     - Returns:  Optional<Int>
     */
    public func getQualifyingMaxQuantity() -> Optional<Int> {
        return self.qualifyingMaxQuantity
    }

    /**
     Getter for Qualifying_Min_Weight.

     - Returns:  Optional<Decimal>
     */
    public func getQualifyingMinWeight() -> Optional<Decimal> {
        return self.qualifyingMinWeight
    }

    /**
     Getter for Qualifying_Max_Weight.

     - Returns:  Optional<Decimal>
     */
    public func getQualifyingMaxWeight() -> Optional<Decimal> {
        return self.qualifyingMaxWeight
    }

    /**
     Getter for Basket_Min_Subtotal.

     - Returns:  Optional<Decimal>
     */
    public func getBasketMinSubtotal() -> Optional<Decimal> {
        return self.basketMinSubtotal
    }

    /**
     Getter for Basket_Max_Subtotal.

     - Returns:  Optional<Decimal>
     */
    public func getBasketMaxSubtotal() -> Optional<Decimal> {
        return self.basketMaxSubtotal
    }

    /**
     Getter for Basket_Min_Quantity.

     - Returns:  Optional<Int>
     */
    public func getBasketMinQuantity() -> Optional<Int> {
        return self.basketMinQuantity
    }

    /**
     Getter for Basket_Max_Quantity.

     - Returns:  Optional<Int>
     */
    public func getBasketMaxQuantity() -> Optional<Int> {
        return self.basketMaxQuantity
    }

    /**
     Getter for Basket_Min_Weight.

     - Returns:  Optional<Decimal>
     */
    public func getBasketMinWeight() -> Optional<Decimal> {
        return self.basketMinWeight
    }

    /**
     Getter for Basket_Max_Weight.

     - Returns:  Optional<Decimal>
     */
    public func getBasketMaxWeight() -> Optional<Decimal> {
        return self.basketMaxWeight
    }

    /**
     Getter for Priority.

     - Returns:  Optional<Int>
     */
    public func getPriority() -> Optional<Int> {
        return self.priority
    }

    /**
     Get user set request fields.

     - Returns:  [String:AnyEncodable]
     */
    public func getModuleFields() -> [String:AnyEncodable] {
        return self.moduleFields
    }

    /**
     Setter for Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setName(_ value: Optional<String>) -> Self {
        self.name = value
        return self
    }

    /**
     Setter for CustomerScope.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerScope(_ value: Optional<String>) -> Self {
        self.customerScope = value
        return self
    }

    /**
     Setter for Rate.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setRate(_ value: Optional<String>) -> Self {
        self.rate = value
        return self
    }

    /**
     Setter for Discount.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setDiscount(_ value: Optional<Decimal>) -> Self {
        self.discount = value
        return self
    }

    /**
     Setter for Markup.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setMarkup(_ value: Optional<Decimal>) -> Self {
        self.markup = value
        return self
    }

    /**
     Setter for Module_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setModuleId(_ value: Optional<Int>) -> Self {
        self.moduleId = value
        return self
    }

    /**
     Setter for Edit_Module.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditModule(_ value: Optional<String>) -> Self {
        self.editModule = value
        return self
    }

    /**
     Setter for Module_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setModuleCode(_ value: Optional<String>) -> Self {
        self.moduleCode = value
        return self
    }

    /**
     Setter for Exclusion.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setExclusion(_ value: Optional<Bool>) -> Self {
        self.exclusion = value
        return self
    }

    /**
     Setter for Description.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDescription(_ value: Optional<String>) -> Self {
        self.description = value
        return self
    }

    /**
     Setter for Display.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setDisplay(_ value: Optional<Bool>) -> Self {
        self.display = value
        return self
    }

    /**
     Setter for DateTime_Start.

     - Parameters:
        - value: Optional<Date>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeStart(_ value: Optional<Date>) -> Self {
        self.dateTimeStart = value
        return self
    }

    /**
     Setter for DateTime_End.

     - Parameters:
        - value: Optional<Date>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeEnd(_ value: Optional<Date>) -> Self {
        self.dateTimeEnd = value
        return self
    }

    /**
     Setter for Qualifying_Min_Subtotal.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setQualifyingMinSubtotal(_ value: Optional<Decimal>) -> Self {
        self.qualifyingMinSubtotal = value
        return self
    }

    /**
     Setter for Qualifying_Max_Subtotal.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setQualifyingMaxSubtotal(_ value: Optional<Decimal>) -> Self {
        self.qualifyingMaxSubtotal = value
        return self
    }

    /**
     Setter for Qualifying_Min_Quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setQualifyingMinQuantity(_ value: Optional<Int>) -> Self {
        self.qualifyingMinQuantity = value
        return self
    }

    /**
     Setter for Qualifying_Max_Quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setQualifyingMaxQuantity(_ value: Optional<Int>) -> Self {
        self.qualifyingMaxQuantity = value
        return self
    }

    /**
     Setter for Qualifying_Min_Weight.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setQualifyingMinWeight(_ value: Optional<Decimal>) -> Self {
        self.qualifyingMinWeight = value
        return self
    }

    /**
     Setter for Qualifying_Max_Weight.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setQualifyingMaxWeight(_ value: Optional<Decimal>) -> Self {
        self.qualifyingMaxWeight = value
        return self
    }

    /**
     Setter for Basket_Min_Subtotal.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMinSubtotal(_ value: Optional<Decimal>) -> Self {
        self.basketMinSubtotal = value
        return self
    }

    /**
     Setter for Basket_Max_Subtotal.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMaxSubtotal(_ value: Optional<Decimal>) -> Self {
        self.basketMaxSubtotal = value
        return self
    }

    /**
     Setter for Basket_Min_Quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMinQuantity(_ value: Optional<Int>) -> Self {
        self.basketMinQuantity = value
        return self
    }

    /**
     Setter for Basket_Max_Quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMaxQuantity(_ value: Optional<Int>) -> Self {
        self.basketMaxQuantity = value
        return self
    }

    /**
     Setter for Basket_Min_Weight.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMinWeight(_ value: Optional<Decimal>) -> Self {
        self.basketMinWeight = value
        return self
    }

    /**
     Setter for Basket_Max_Weight.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setBasketMaxWeight(_ value: Optional<Decimal>) -> Self {
        self.basketMaxWeight = value
        return self
    }

    /**
     Setter for Priority.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPriority(_ value: Optional<Int>) -> Self {
        self.priority = value
        return self
    }

    /**
     Set user request data.

     - Parameters:
        - name: String
        - value: Encodable
     - Returns:  Self
     */
    @discardableResult
    public func setModuleField<T:Encodable>(_ name: String, _ value: T) -> Self {
        self.moduleFields[name] = AnyEncodable(value)
        return self
    }
}
