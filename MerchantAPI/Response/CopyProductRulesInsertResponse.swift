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
 API Response for CopyProductRules_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/copyproductrules_insert
 */
public class CopyProductRulesInsertResponse : Response {

    /// The response model
    public var copyProductRule : Optional<CopyProductRule> = nil

    /**
     Getter for copyProductRule.

     - Returns: CopyProductRule
     */
    public func getCopyProductRule() -> Optional<CopyProductRule> {
        return self.copyProductRule
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case copyProductRule = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.copyProductRule = try container.decodeIfPresent(CopyProductRule.self, forKey: .copyProductRule)
        try super.init(from : decoder)
    }
}