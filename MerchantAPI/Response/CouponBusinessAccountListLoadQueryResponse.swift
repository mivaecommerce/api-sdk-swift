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
 API Response for CouponBusinessAccountList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/couponbusinessaccountlist_load_query
 */
public class CouponBusinessAccountListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CouponBusinessAccount>

    /// Named computed property for data
    public var couponBusinessAccounts : [CouponBusinessAccount] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for couponBusinessAccounts.

     - Returns: [CouponBusinessAccount]
     */
    public func getCouponBusinessAccounts() -> [CouponBusinessAccount] {
        return self.couponBusinessAccounts
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

        self.data = try container.decodeIfPresent(ListQueryResult<CouponBusinessAccount>.self, forKey: .data) ?? ListQueryResult<CouponBusinessAccount>()
        try super.init(from : decoder)
    }
}