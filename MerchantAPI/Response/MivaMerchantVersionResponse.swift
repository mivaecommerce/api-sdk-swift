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
 API Response for MivaMerchantVersion.

 - SeeAlso: https://docs.miva.com/json-api/functions/mivamerchantversion
 */
public class MivaMerchantVersionResponse : Response {

    /// The response model
    public var merchantVersion : Optional<MerchantVersion> = nil

    /**
     Getter for merchantVersion.

     - Returns: MerchantVersion
     */
    public func getMerchantVersion() -> Optional<MerchantVersion> {
        return self.merchantVersion
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case merchantVersion = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.merchantVersion = try container.decodeIfPresent(MerchantVersion.self, forKey: .merchantVersion)
        try super.init(from : decoder)
    }
}