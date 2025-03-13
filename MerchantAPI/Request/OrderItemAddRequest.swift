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
 Handles API Request OrderItem_Add.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderitem_add
 */
public class OrderItemAddRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderItem_Add"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Order_ID.
    var orderId : Optional<Int> = nil

    /// Request field Code.
    var code : Optional<String> = nil

    /// Request field Name.
    var name : Optional<String> = nil

    /// Request field Sku.
    var sku : Optional<String> = nil

    /// Request field Quantity.
    var quantity : Optional<Int> = nil

    /// Request field Price.
    var price : Optional<Decimal> = nil

    /// Request field Weight.
    var weight : Optional<Decimal> = nil

    /// Request field Taxable.
    var taxable : Optional<Bool> = nil

    /// Request field Options.
    var options : [OrderItemOption] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderId = "Order_ID"
        case code = "Code"
        case name = "Name"
        case sku = "Sku"
        case quantity = "Quantity"
        case price = "Price"
        case weight = "Weight"
        case taxable = "Taxable"
        case options = "Options"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - order: An optional Order instance.
     */
    public init(client: Optional<BaseClient> = nil, order: Optional<Order> = nil) {
        super.init(client: client)
        if let order = order {
            self.orderId = order.id
        }
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

        try container.encodeIfPresent(self.orderId, forKey: .orderId)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.sku, forKey: .sku)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.price, precision: 8), forKey: .price)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.weight, precision: 8), forKey: .weight)
        try container.encodeIfPresent(self.taxable, forKey: .taxable)
        try container.encodeIfPresent(self.options, forKey: .options)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderItemAddResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderItemAddResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderItemAddResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderItemAddResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderItemAddResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderItemAddResponse.self
    }

    /**
     Getter for Order_ID.

     - Returns:  Optional<Int>
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
    }

    /**
     Getter for Code.

     - Returns:  Optional<String>
     */
    public func getCode() -> Optional<String> {
        return self.code
    }

    /**
     Getter for Name.

     - Returns:  Optional<String>
     */
    public func getName() -> Optional<String> {
        return self.name
    }

    /**
     Getter for Sku.

     - Returns:  Optional<String>
     */
    public func getSku() -> Optional<String> {
        return self.sku
    }

    /**
     Getter for Quantity.

     - Returns:  Optional<Int>
     */
    public func getQuantity() -> Optional<Int> {
        return self.quantity
    }

    /**
     Getter for Price.

     - Returns:  Optional<Decimal>
     */
    public func getPrice() -> Optional<Decimal> {
        return self.price
    }

    /**
     Getter for Weight.

     - Returns:  Optional<Decimal>
     */
    public func getWeight() -> Optional<Decimal> {
        return self.weight
    }

    /**
     Getter for Taxable.

     - Returns:  Optional<Bool>
     */
    public func getTaxable() -> Optional<Bool> {
        return self.taxable
    }

    /**
     Getter for Options.

     - Returns:  [OrderItemOption]
     */
    public func getOptions() -> [OrderItemOption] {
        return self.options
    }

    /**
     Setter for Order_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOrderId(_ value: Optional<Int>) -> Self {
        self.orderId = value
        return self
    }

    /**
     Setter for Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCode(_ value: Optional<String>) -> Self {
        self.code = value
        return self
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
     Setter for Sku.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setSku(_ value: Optional<String>) -> Self {
        self.sku = value
        return self
    }

    /**
     Setter for Quantity.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setQuantity(_ value: Optional<Int>) -> Self {
        self.quantity = value
        return self
    }

    /**
     Setter for Price.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setPrice(_ value: Optional<Decimal>) -> Self {
        self.price = value
        return self
    }

    /**
     Setter for Weight.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setWeight(_ value: Optional<Decimal>) -> Self {
        self.weight = value
        return self
    }

    /**
     Setter for Taxable.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setTaxable(_ value: Optional<Bool>) -> Self {
        self.taxable = value
        return self
    }

    /**
     Add a OrderItemOption.

     - Parameters:
        - option: OrderItemOption
     - Returns: Self
     */
    @discardableResult
    public func addOption(_ option : OrderItemOption) -> Self {
        self.options.append(option)
        return self
    }

    /**
     Add an array of OrderItemOption.

     - Parameters:
        - options: [OrderItemOption]
     - Returns: Self
     */
    @discardableResult
    public func addOptions(_ options: [OrderItemOption]) -> Self {
        for o in options {
            self.options.append(o);
        }

        return self
    }
}
