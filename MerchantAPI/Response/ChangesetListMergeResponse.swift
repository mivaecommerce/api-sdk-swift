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
 API Response for ChangesetList_Merge.

 - SeeAlso: https://docs.miva.com/json-api/functions/changesetlist_merge
 */
public class ChangesetListMergeResponse : Response {
    /// Response field completed.
    var completed : Optional<Bool> = nil

    /// Response field changesetlist_merge_session_id.
    var changesetlistMergeSessionId : Optional<String> = nil

    /// The response model
    public var changeset : Optional<Changeset> = nil

    /**
     Getter for changeset.

     - Returns: Changeset
     */
    public func getChangeset() -> Optional<Changeset> {
        return self.changeset
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case completed
        case changesetlistMergeSessionId = "changesetlist_merge_session_id"
        case changeset = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.completed = try container.decodeIfPresent(Bool.self, forKey: .completed)
        self.changesetlistMergeSessionId = try container.decodeIfPresent(String.self, forKey: .changesetlistMergeSessionId)
        self.changeset = try container.decodeIfPresent(Changeset.self, forKey: .changeset)
        try super.init(from : decoder)
    }

    /**
     Get completed.

     - Returns: Bool
    */
    func getCompleted() -> Bool {
        return self.completed ?? false
    }

    /**
     Get changesetlist_merge_session_id.

     - Returns: string
    */
    func getChangesetlistMergeSessionId() -> String {
        return self.changesetlistMergeSessionId ?? ""
    }
}