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
 Handles API Request OrderCoupon_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/ordercoupon_update_assigned
 */
public class OrderCouponUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderCoupon_Update_Assigned"
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

    /// Request field Coupon_ID.
    var couponId : Optional<Int> = nil

    /// Request field Edit_Coupon.
    var editCoupon : Optional<String> = nil

    /// Request field Coupon_Code.
    var couponCode : Optional<String> = nil

    /// Request field Assigned.
    var assigned : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case orderId = "Order_ID"
        case couponId = "Coupon_ID"
        case editCoupon = "Edit_Coupon"
        case couponCode = "Coupon_Code"
        case assigned = "Assigned"
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

        if self.couponId != nil {
            try container.encodeIfPresent(self.couponId, forKey: .couponId)
        } else if self.editCoupon != nil {
            try container.encode(self.editCoupon, forKey: .editCoupon)
        } else if self.couponCode != nil {
            try container.encode(self.couponCode, forKey: .couponCode)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderCouponUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderCouponUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderCouponUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderCouponUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderCouponUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderCouponUpdateAssignedResponse.self
    }

    /**
     Getter for Order_ID.

     - Returns:  Optional<Int>
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
    }

    /**
     Getter for Coupon_ID.

     - Returns:  Optional<Int>
     */
    public func getCouponId() -> Optional<Int> {
        return self.couponId
    }

    /**
     Getter for Edit_Coupon.

     - Returns:  Optional<String>
     */
    public func getEditCoupon() -> Optional<String> {
        return self.editCoupon
    }

    /**
     Getter for Coupon_Code.

     - Returns:  Optional<String>
     */
    public func getCouponCode() -> Optional<String> {
        return self.couponCode
    }

    /**
     Getter for Assigned.

     - Returns:  Optional<Bool>
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
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
     Setter for Coupon_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCouponId(_ value: Optional<Int>) -> Self {
        self.couponId = value
        return self
    }

    /**
     Setter for Edit_Coupon.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditCoupon(_ value: Optional<String>) -> Self {
        self.editCoupon = value
        return self
    }

    /**
     Setter for Coupon_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCouponCode(_ value: Optional<String>) -> Self {
        self.couponCode = value
        return self
    }

    /**
     Setter for Assigned.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setAssigned(_ value: Optional<Bool>) -> Self {
        self.assigned = value
        return self
    }
}
