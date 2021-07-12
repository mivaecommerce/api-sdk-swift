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
 Handles API Request CouponCustomer_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/couponcustomer_update_assigned
 */
public class CouponCustomerUpdateAssignedRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CouponCustomer_Update_Assigned"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Customer_ID.
    var customerId : Optional<Int> = nil

    /// Request field Edit_Customer.
    var editCustomer : Optional<String> = nil

    /// Request field Customer_Login.
    var customerLogin : Optional<String> = nil

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
        case customerId = "Customer_ID"
        case editCustomer = "Edit_Customer"
        case customerLogin = "Customer_Login"
        case couponId = "Coupon_ID"
        case editCoupon = "Edit_Coupon"
        case couponCode = "Coupon_Code"
        case assigned = "Assigned"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - coupon: An optional Coupon instance.
     */
    public init(client: Optional<BaseClient> = nil, coupon: Optional<Coupon> = nil) {
        super.init(client: client)
        if let coupon = coupon {
            if coupon.id > 0 {
                self.couponId = coupon.id
            }

            self.couponCode = coupon.code
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

        if self.couponId != nil {
            try container.encodeIfPresent(self.couponId, forKey: .couponId)
        } else if self.editCoupon != nil {
            try container.encode(self.editCoupon, forKey: .editCoupon)
        } else if self.couponCode != nil {
            try container.encode(self.couponCode, forKey: .couponCode)
        }

        if self.customerId != nil {
            try container.encodeIfPresent(self.customerId, forKey: .customerId)
        } else if self.editCustomer != nil {
            try container.encode(self.editCustomer, forKey: .editCustomer)
        } else if self.customerLogin != nil {
            try container.encode(self.customerLogin, forKey: .customerLogin)
        }

        try container.encodeIfPresent(self.customerLogin, forKey: .customerLogin)
        try container.encodeIfPresent(self.couponCode, forKey: .couponCode)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CouponCustomerUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CouponCustomerUpdateAssignedResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CouponCustomerUpdateAssignedResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CouponCustomerUpdateAssignedResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CouponCustomerUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CouponCustomerUpdateAssignedResponse.self
    }

    /**
     Getter for Customer_ID.

     - Returns:  Optional<Int>
     */
    public func getCustomerId() -> Optional<Int> {
        return self.customerId
    }

    /**
     Getter for Edit_Customer.

     - Returns:  Optional<String>
     */
    public func getEditCustomer() -> Optional<String> {
        return self.editCustomer
    }

    /**
     Getter for Customer_Login.

     - Returns:  Optional<String>
     */
    public func getCustomerLogin() -> Optional<String> {
        return self.customerLogin
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
     Setter for Customer_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerId(_ value: Optional<Int>) -> Self {
        self.customerId = value
        return self
    }

    /**
     Setter for Edit_Customer.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditCustomer(_ value: Optional<String>) -> Self {
        self.editCustomer = value
        return self
    }

    /**
     Setter for Customer_Login.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerLogin(_ value: Optional<String>) -> Self {
        self.customerLogin = value
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
