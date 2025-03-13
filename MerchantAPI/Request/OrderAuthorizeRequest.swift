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
 Handles API Request Order_Authorize.

 - SeeAlso: https://docs.miva.com/json-api/functions/order_authorize
 */
public class OrderAuthorizeRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Order_Authorize"
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

    /// Request field Module_ID.
    var moduleId : Optional<Int> = nil

    /// Request field Module_Data.
    var moduleData : Optional<String> = nil

    /// Request field Amount.
    var amount : Optional<Decimal> = nil

    /// User set request fields
    var moduleFields : [String:AnyEncodable] = [:]

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderId = "Order_ID"
        case moduleId = "Module_ID"
        case moduleData = "Module_Data"
        case amount = "Amount"
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
            if order.id > 0 {
                self.orderId = order.id
            }
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

        if self.orderId != nil {
            try container.encodeIfPresent(self.orderId, forKey: .orderId)
        }

        try container.encodeIfPresent(self.moduleId, forKey: .moduleId)
        try container.encodeIfPresent(self.moduleData, forKey: .moduleData)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.amount, precision: 2), forKey: .amount)

        var moduleFieldsContainer = encoder.container(keyedBy: RuntimeCodingKey.self)

        for (key,value) in self.moduleFields {
            try moduleFieldsContainer.encode(value, forKey: RuntimeCodingKey(stringValue: key)!)
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderAuthorizeResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderAuthorizeResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderAuthorizeResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderAuthorizeResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderAuthorizeResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderAuthorizeResponse.self
    }

    /**
     Getter for Order_ID.

     - Returns:  Optional<Int>
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
    }

    /**
     Getter for Module_ID.

     - Returns:  Optional<Int>
     */
    public func getModuleId() -> Optional<Int> {
        return self.moduleId
    }

    /**
     Getter for Module_Data.

     - Returns:  Optional<String>
     */
    public func getModuleData() -> Optional<String> {
        return self.moduleData
    }

    /**
     Getter for Amount.

     - Returns:  Optional<Decimal>
     */
    public func getAmount() -> Optional<Decimal> {
        return self.amount
    }

    /**
     Get user set request fields.

     - Returns:  [String:AnyEncodable]
     */
    public func getModuleFields() -> [String:AnyEncodable] {
        return self.moduleFields
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
     Setter for Module_Data.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setModuleData(_ value: Optional<String>) -> Self {
        self.moduleData = value
        return self
    }

    /**
     Setter for Amount.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setAmount(_ value: Optional<Decimal>) -> Self {
        self.amount = value
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
