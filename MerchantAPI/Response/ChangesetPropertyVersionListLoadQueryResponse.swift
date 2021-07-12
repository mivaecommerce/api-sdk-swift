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
 API Response for ChangesetPropertyVersionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/changesetpropertyversionlist_load_query
 */
public class ChangesetPropertyVersionListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<ChangesetPropertyVersion>

    /// Named computed property for data
    public var changesetPropertyVersions : [ChangesetPropertyVersion] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for changesetPropertyVersions.

     - Returns: [ChangesetPropertyVersion]
     */
    public func getChangesetPropertyVersions() -> [ChangesetPropertyVersion] {
        return self.changesetPropertyVersions
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

        self.data = try container.decodeIfPresent(ListQueryResult<ChangesetPropertyVersion>.self, forKey: .data) ?? ListQueryResult<ChangesetPropertyVersion>()
        try super.init(from : decoder)
    }
}