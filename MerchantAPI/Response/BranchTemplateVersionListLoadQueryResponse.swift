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
 API Response for BranchTemplateVersionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/branchtemplateversionlist_load_query
 */
public class BranchTemplateVersionListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<BranchTemplateVersion>

    /// Named computed property for data
    public var branchTemplateVersions : [BranchTemplateVersion] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for branchTemplateVersions.

     - Returns: [BranchTemplateVersion]
     */
    public func getBranchTemplateVersions() -> [BranchTemplateVersion] {
        return self.branchTemplateVersions
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

        self.data = try container.decodeIfPresent(ListQueryResult<BranchTemplateVersion>.self, forKey: .data) ?? ListQueryResult<BranchTemplateVersion>()
        try super.init(from : decoder)
    }
}