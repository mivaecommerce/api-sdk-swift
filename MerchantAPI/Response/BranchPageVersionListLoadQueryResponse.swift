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
 API Response for BranchPageVersionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/branchpageversionlist_load_query
 */
public class BranchPageVersionListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<BranchPageVersion>

    /// Named computed property for data
    public var branchPageVersions : [BranchPageVersion] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for branchPageVersions.

     - Returns: [BranchPageVersion]
     */
    public func getBranchPageVersions() -> [BranchPageVersion] {
        return self.branchPageVersions
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

        self.data = try container.decodeIfPresent(ListQueryResult<BranchPageVersion>.self, forKey: .data) ?? ListQueryResult<BranchPageVersion>()
        try super.init(from : decoder)
    }
}