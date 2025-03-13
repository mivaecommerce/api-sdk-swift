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
 API Response for Branch_Create.

 - SeeAlso: https://docs.miva.com/json-api/functions/branch_create
 */
public class BranchCreateResponse : Response {
    /// Response field completed.
    var completed : Optional<Bool> = nil

    /// Response field branch_create_session_id.
    var branchCreateSessionId : Optional<String> = nil

    /// The response model
    public var branch : Optional<Branch> = nil

    /**
     Getter for branch.

     - Returns: Branch
     */
    public func getBranch() -> Optional<Branch> {
        return self.branch
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case completed
        case branchCreateSessionId = "branch_create_session_id"
        case branch = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.completed = try container.decodeIfPresent(Bool.self, forKey: .completed)
        self.branchCreateSessionId = try container.decodeIfPresent(String.self, forKey: .branchCreateSessionId)
        self.branch = try container.decodeIfPresent(Branch.self, forKey: .branch)
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
     Get branch_create_session_id.

     - Returns: string
    */
    func getBranchCreateSessionId() -> String {
        return self.branchCreateSessionId ?? ""
    }
}