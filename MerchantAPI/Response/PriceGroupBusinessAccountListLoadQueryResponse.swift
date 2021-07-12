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
 API Response for PriceGroupBusinessAccountList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegroupbusinessaccountlist_load_query
 */
public class PriceGroupBusinessAccountListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<PriceGroupBusinessAccount>

    /// Named computed property for data
    public var priceGroupBusinessAccounts : [PriceGroupBusinessAccount] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for priceGroupBusinessAccounts.

     - Returns: [PriceGroupBusinessAccount]
     */
    public func getPriceGroupBusinessAccounts() -> [PriceGroupBusinessAccount] {
        return self.priceGroupBusinessAccounts
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

        self.data = try container.decodeIfPresent(ListQueryResult<PriceGroupBusinessAccount>.self, forKey: .data) ?? ListQueryResult<PriceGroupBusinessAccount>()
        try super.init(from : decoder)
    }
}