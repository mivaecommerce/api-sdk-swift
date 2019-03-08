/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: OrderPaymentCaptureRequest.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 Handles API Request OrderPayment_Capture.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderpayment_capture
 */
public class OrderPaymentCaptureRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderPayment_Capture"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field OrderPayment_ID.
    var orderPaymentId : Optional<Int>

    /// Request field Amount.
    var amount : Optional<Decimal>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderPaymentId = "OrderPayment_ID"
        case amount = "Amount"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - orderPayment: An optional OrderPayment instance.
     */
    public init(client: Optional<Client> = nil, orderPayment: Optional<OrderPayment> = nil) {
        super.init(client: client)
        if let orderPayment = orderPayment {
            self.orderPaymentId = orderPayment.id
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

        try container.encodeIfPresent(self.orderPaymentId, forKey: .orderPaymentId)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.amount, precision: MERCHANTAPI_FLOAT_ENCODE_PRECISION), forKey: .amount)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderPaymentCaptureResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (OrderPaymentCaptureResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? OrderPaymentCaptureResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? OrderPaymentCaptureResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(data : Data) throws -> OrderPaymentCaptureResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(OrderPaymentCaptureResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderPaymentCaptureResponse.self
    }
    
    /**
     Getter for OrderPayment_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getOrderPaymentId() -> Optional<Int> {
        return self.orderPaymentId
    }
    
    /**
     Getter for Amount.
     
     - Returns:  Optional<Decimal> 
     */
    public func getAmount() -> Optional<Decimal> {
        return self.amount
    }
    
    /**
     Setter for OrderPayment_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOrderPaymentId(_ value: Optional<Int>) -> Self {
        self.orderPaymentId = value
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
}
