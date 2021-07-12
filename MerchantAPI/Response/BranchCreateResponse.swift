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
        case branch = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.branch = try container.decodeIfPresent(Branch.self, forKey: .branch)
        try super.init(from : decoder)
    }
}