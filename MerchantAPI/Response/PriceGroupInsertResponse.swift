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
 API Response for PriceGroup_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegroup_insert
 */
public class PriceGroupInsertResponse : Response {

    /// The response model
    public var priceGroup : Optional<PriceGroup> = nil

    /**
     Getter for priceGroup.

     - Returns: PriceGroup
     */
    public func getPriceGroup() -> Optional<PriceGroup> {
        return self.priceGroup
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case priceGroup = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.priceGroup = try container.decodeIfPresent(PriceGroup.self, forKey: .priceGroup)
        try super.init(from : decoder)
    }
}