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
 API Response for CopyPageRules_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/copypagerules_insert
 */
public class CopyPageRulesInsertResponse : Response {

    /// The response model
    public var copyPageRule : Optional<CopyPageRule> = nil

    /**
     Getter for copyPageRule.

     - Returns: CopyPageRule
     */
    public func getCopyPageRule() -> Optional<CopyPageRule> {
        return self.copyPageRule
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case copyPageRule = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.copyPageRule = try container.decodeIfPresent(CopyPageRule.self, forKey: .copyPageRule)
        try super.init(from : decoder)
    }
}