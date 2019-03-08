/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: OrderItemListCancelRequest.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 Handles API Request OrderItemList_Cancel.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderitemlist_cancel
 */
public class OrderItemListCancelRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderItemList_Cancel"
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
    var orderId : Optional<Int>

    /// Request field Line_IDs.
    var lineIds : [Int] = []

    /// Request field Reason.
    var reason : Optional<String>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderId = "Order_ID"
        case lineIds = "Line_IDs"
        case reason = "Reason"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - order: An optional Order instance.
     */
    public init(client: Optional<Client> = nil, order: Optional<Order> = nil) {
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
        try container.encodeIfPresent(self.lineIds, forKey: .lineIds)
        try container.encodeIfPresent(self.reason, forKey: .reason)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderItemListCancelResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (OrderItemListCancelResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? OrderItemListCancelResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? OrderItemListCancelResponse, error)
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
    public override func createResponse(data : Data) throws -> OrderItemListCancelResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(OrderItemListCancelResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderItemListCancelResponse.self
    }
    
    /**
     Getter for Order_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
    }
    
    /**
     Getter for Reason.

     - Returns:  Optional<String> 
     */
    public func getReason() -> Optional<String> {
        return self.reason
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
     Setter for Reason.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setReason(_ value: Optional<String>) -> Self {
        self.reason = value
        return self
    }
    
    /**
     Add Line_IDs.

     - Parameters:
        - lineId: Int
     - Returns: Self
     */
    @discardableResult
    public func addLineId(_ lineId : Int) -> Self {
        self.lineIds.append(lineId);
        return self
    }
    
    /**
     Add OrderItem model.

     - Parameters:
        - orderItem: OrderItem
     - Returns: Self 
     */
    @discardableResult
    public func addOrderItem(_ orderItem: OrderItem) -> Self {
        if orderItem.lineId > 0 {
            self.lineIds.append(orderItem.lineId)
        }

        return self
    }
}
