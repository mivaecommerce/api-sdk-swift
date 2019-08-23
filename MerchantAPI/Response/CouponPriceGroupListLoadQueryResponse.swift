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
 API Response for CouponPriceGroupList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/couponpricegrouplist_load_query
 */
public class CouponPriceGroupListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CouponPriceGroup>

    /// Named computed property for data
    public var couponPriceGroups : [CouponPriceGroup] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for couponPriceGroups.

     - Returns: [CouponPriceGroup]
     */
    public func getCouponPriceGroups() -> [CouponPriceGroup] {
        return self.couponPriceGroups
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

        self.data = try container.decodeIfPresent(ListQueryResult<CouponPriceGroup>.self, forKey: .data) ?? ListQueryResult<CouponPriceGroup>()
        try super.init(from : decoder)
    }
}