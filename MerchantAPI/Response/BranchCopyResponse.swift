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
 API Response for Branch_Copy.

 - SeeAlso: https://docs.miva.com/json-api/functions/branch_copy
 */
public class BranchCopyResponse : Response {
    /// Response field completed.
    var completed : Optional<Bool> = nil

    /// Response field branch_copy_session_id.
    var branchCopySessionId : Optional<String> = nil

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
        case branchCopySessionId = "branch_copy_session_id"
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
        self.branchCopySessionId = try container.decodeIfPresent(String.self, forKey: .branchCopySessionId)
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
     Get branch_copy_session_id.

     - Returns: string
    */
    func getBranchCopySessionId() -> String {
        return self.branchCopySessionId ?? ""
    }
}