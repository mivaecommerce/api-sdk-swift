/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CouponListLoadQueryResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for CouponList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/couponlist_load_query
 */
public class CouponListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<Coupon>

    /// Named computed property for data
    public var coupons : [Coupon] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for coupons.

     - Returns: [Coupon]
     */
    public func getCoupons() -> [Coupon] {
        return self.coupons
    }

    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.data = try container.decodeIfPresent(ListQueryResult<Coupon>.self, forKey: .data) ?? ListQueryResult<Coupon>()
        try super.init(from : decoder)
    }
}