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
 Handles API Request Coupon_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/coupon_update
 */
public class CouponUpdateRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Coupon_Update"
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

    /// Request field Coupon_Code.
    var couponCode : Optional<String>

    /// Request field Edit_Coupon.
    var editCoupon : Optional<String>

    /// Request field Code.
    var code : Optional<String>

    /// Request field Description.
    var description : Optional<String>

    /// Request field CustomerScope.
    var customerScope : Optional<String>

    /// Request field DateTime_Start.
    var dateTimeStart : Optional<Int>

    /// Request field DateTime_End.
    var dateTimeEnd : Optional<Int>

    /// Request field Max_Use.
    var maxUse : Optional<Int>

    /// Request field Max_Per.
    var maxPer : Optional<Int>

    /// Request field Active.
    var active : Optional<Bool>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case couponId = "Coupon_ID"
        case couponCode = "Coupon_Code"
        case editCoupon = "Edit_Coupon"
        case code = "Code"
        case description = "Description"
        case customerScope = "CustomerScope"
        case dateTimeStart = "DateTime_Start"
        case dateTimeEnd = "DateTime_End"
        case maxUse = "Max_Use"
        case maxPer = "Max_Per"
        case active = "Active"
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

            self.couponCode = coupon.code
            self.code = coupon.code
            self.description = coupon.description
            self.customerScope = coupon.customerScope
            self.dateTimeStart = coupon.dateTimeStart
            self.dateTimeEnd = coupon.dateTimeEnd
            self.maxUse = coupon.maxUse
            self.maxPer = coupon.maxPer
            self.active = coupon.active
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
        }

        try container.encodeIfPresent(self.couponCode, forKey: .couponCode)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.customerScope, forKey: .customerScope)
        try container.encodeIfPresent(self.dateTimeStart, forKey: .dateTimeStart)
        try container.encodeIfPresent(self.dateTimeEnd, forKey: .dateTimeEnd)
        try container.encodeIfPresent(self.maxUse, forKey: .maxUse)
        try container.encodeIfPresent(self.maxPer, forKey: .maxPer)
        try container.encodeIfPresent(self.active, forKey: .active)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CouponUpdateResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CouponUpdateResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CouponUpdateResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CouponUpdateResponse, error)
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
    public override func createResponse(data : Data) throws -> CouponUpdateResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CouponUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CouponUpdateResponse.self
    }
    
    /**
     Getter for Coupon_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getCouponId() -> Optional<Int> {
        return self.couponId
    }
    
    /**
     Getter for Coupon_Code.

     - Returns:  Optional<String> 
     */
    public func getCouponCode() -> Optional<String> {
        return self.couponCode
    }
    
    /**
     Getter for Edit_Coupon.

     - Returns:  Optional<String> 
     */
    public func getEditCoupon() -> Optional<String> {
        return self.editCoupon
    }
    
    /**
     Getter for Code.

     - Returns:  Optional<String> 
     */
    public func getCode() -> Optional<String> {
        return self.code
    }
    
    /**
     Getter for Description.

     - Returns:  Optional<String> 
     */
    public func getDescription() -> Optional<String> {
        return self.description
    }
    
    /**
     Getter for CustomerScope.

     - Returns:  Optional<String> 
     */
    public func getCustomerScope() -> Optional<String> {
        return self.customerScope
    }
    
    /**
     Getter for DateTime_Start.
     
     - Returns:  Optional<Int> 
     */
    public func getDateTimeStart() -> Optional<Int> {
        return self.dateTimeStart
    }
    
    /**
     Getter for DateTime_End.
     
     - Returns:  Optional<Int> 
     */
    public func getDateTimeEnd() -> Optional<Int> {
        return self.dateTimeEnd
    }
    
    /**
     Getter for Max_Use.
     
     - Returns:  Optional<Int> 
     */
    public func getMaxUse() -> Optional<Int> {
        return self.maxUse
    }
    
    /**
     Getter for Max_Per.
     
     - Returns:  Optional<Int> 
     */
    public func getMaxPer() -> Optional<Int> {
        return self.maxPer
    }
    
    /**
     Getter for Active.
     
     - Returns:  Optional<Bool> 
     */
    public func getActive() -> Optional<Bool> {
        return self.active
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
     Setter for DateTime_Start.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeStart(_ value: Optional<Int>) -> Self {
        self.dateTimeStart = value
        return self
    }
    
    /**
     Setter for DateTime_End.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeEnd(_ value: Optional<Int>) -> Self {
        self.dateTimeEnd = value
        return self
    }
    
    /**
     Setter for Max_Use.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setMaxUse(_ value: Optional<Int>) -> Self {
        self.maxUse = value
        return self
    }
    
    /**
     Setter for Max_Per.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setMaxPer(_ value: Optional<Int>) -> Self {
        self.maxPer = value
        return self
    }
    
    /**
     Setter for Active.
     
     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setActive(_ value: Optional<Bool>) -> Self {
        self.active = value
        return self
    }
}
