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
 API Response for CopyProductRulesList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/copyproductruleslist_load_query
 */
public class CopyProductRulesListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CopyProductRule>

    /// Named computed property for data
    public var copyProductRules : [CopyProductRule] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for copyProductRules.

     - Returns: [CopyProductRule]
     */
    public func getCopyProductRules() -> [CopyProductRule] {
        return self.copyProductRules
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

        self.data = try container.decodeIfPresent(ListQueryResult<CopyProductRule>.self, forKey: .data) ?? ListQueryResult<CopyProductRule>()
        try super.init(from : decoder)
    }
}