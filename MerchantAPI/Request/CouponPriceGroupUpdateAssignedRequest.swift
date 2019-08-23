/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/**
 Handles API Request CouponPriceGroup_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/couponpricegroup_update_assigned
 */
public class CouponPriceGroupUpdateAssignedRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CouponPriceGroup_Update_Assigned"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field Coupon_ID.
    var couponId : Optional<Int>

    /// Request field Edit_Coupon.
    var editCoupon : Optional<String>

    /// Request field Coupon_Code.
    var couponCode : Optional<String>

    /// Request field PriceGroup_ID.
    var priceGroupId : Optional<Int>

    /// Request field PriceGroup_Name.
    var priceGroupName : Optional<String>

    /// Request field Assigned.
    var assigned : Optional<Bool>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case couponId = "Coupon_ID"
        case editCoupon = "Edit_Coupon"
        case couponCode = "Coupon_Code"
        case priceGroupId = "PriceGroup_ID"
        case priceGroupName = "PriceGroup_Name"
        case assigned = "Assigned"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - coupon: An optional Coupon instance.
     */
    public init(client: Optional<Client> = nil, coupon: Optional<Coupon> = nil) {
        super.init(client: client)
        if let coupon = coupon {
            if coupon.id > 0 {
                self.couponId = coupon.id
            } else if coupon.code.count > 0 {
                self.editCoupon = coupon.code
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

        if self.couponId != nil {
            try container.encodeIfPresent(self.couponId, forKey: .couponId)
        } else if self.editCoupon != nil {
            try container.encode(self.editCoupon, forKey: .editCoupon)
        } else if self.couponCode != nil {
            try container.encode(self.couponCode, forKey: .couponCode)
        }

        if self.priceGroupId != nil {
            try container.encodeIfPresent(self.priceGroupId, forKey: .priceGroupId)
        } else if self.priceGroupName != nil {
            try container.encode(self.priceGroupName, forKey: .priceGroupName)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CouponPriceGroupUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CouponPriceGroupUpdateAssignedResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CouponPriceGroupUpdateAssignedResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CouponPriceGroupUpdateAssignedResponse, error)
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
    public override func createResponse(data : Data) throws -> CouponPriceGroupUpdateAssignedResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CouponPriceGroupUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CouponPriceGroupUpdateAssignedResponse.self
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
     Getter for PriceGroup_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getPriceGroupId() -> Optional<Int> {
        return self.priceGroupId
    }
    
    /**
     Getter for PriceGroup_Name.

     - Returns:  Optional<String> 
     */
    public func getPriceGroupName() -> Optional<String> {
        return self.priceGroupName
    }
    
    /**
     Getter for Assigned.
     
     - Returns:  Optional<Bool> 
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
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
     Setter for PriceGroup_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupId(_ value: Optional<Int>) -> Self {
        self.priceGroupId = value
        return self
    }
    
    /**
     Setter for PriceGroup_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupName(_ value: Optional<String>) -> Self {
        self.priceGroupName = value
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
