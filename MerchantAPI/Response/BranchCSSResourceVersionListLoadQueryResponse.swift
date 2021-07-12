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
 API Response for BranchCSSResourceVersionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/branchcssresourceversionlist_load_query
 */
public class BranchCSSResourceVersionListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<BranchCSSResourceVersion>

    /// Named computed property for data
    public var branchCSSResourceVersions : [BranchCSSResourceVersion] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for branchCSSResourceVersions.

     - Returns: [BranchCSSResourceVersion]
     */
    public func getBranchCSSResourceVersions() -> [BranchCSSResourceVersion] {
        return self.branchCSSResourceVersions
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

        self.data = try container.decodeIfPresent(ListQueryResult<BranchCSSResourceVersion>.self, forKey: .data) ?? ListQueryResult<BranchCSSResourceVersion>()
        try super.init(from : decoder)
    }
}