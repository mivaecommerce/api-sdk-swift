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
 API Response for CSSResourceList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/cssresourcelist_load_query
 */
public class CSSResourceListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CSSResource>

    /// Named computed property for data
    public var CSSResources : [CSSResource] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for CSSResources.

     - Returns: [CSSResource]
     */
    public func getCSSResources() -> [CSSResource] {
        return self.CSSResources
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

        self.data = try container.decodeIfPresent(ListQueryResult<CSSResource>.self, forKey: .data) ?? ListQueryResult<CSSResource>()
        try super.init(from : decoder)
    }
}