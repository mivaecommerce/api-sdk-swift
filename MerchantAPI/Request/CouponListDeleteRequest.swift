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
 Handles API Request CouponList_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/couponlist_delete
 */
public class CouponListDeleteRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CouponList_Delete"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field Coupon_IDs.
    var couponIds : [Int] = []
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case couponIds = "Coupon_IDs"
    }
    
    /**
     Request constructor.
     
     - Parameters:
        - client: A Client instance.
     */
    public override init(client: Optional<Client> = nil) {
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

        try container.encodeIfPresent(self.couponIds, forKey: .couponIds)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CouponListDeleteResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CouponListDeleteResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CouponListDeleteResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CouponListDeleteResponse, error)
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
    public override func createResponse(data : Data) throws -> CouponListDeleteResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CouponListDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CouponListDeleteResponse.self
    }
    
    /**
     Add Coupon_IDs.

     - Parameters:
        - couponId: Int
     - Returns: Self
     */
    @discardableResult
    public func addCouponId(_ couponId : Int) -> Self {
        self.couponIds.append(couponId);
        return self
    }
    
    /**
     Add Coupon model.

     - Parameters:
        - coupon: Coupon
     - Returns: Self 
     */
    @discardableResult
    public func addCoupon(_ coupon: Coupon) -> Self {
        if coupon.id > 0 {
            self.couponIds.append(coupon.id)
        }

        return self
    }
}
