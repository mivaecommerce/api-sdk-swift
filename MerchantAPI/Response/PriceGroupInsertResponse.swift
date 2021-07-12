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
    /// Response field id.
    var id : Optional<Int> = nil

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case id
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        try super.init(from : decoder)
    }

    /**
     Get id.

     - Returns: Int
    */
    func getId() -> Int {
        return self.id ?? 0
    }
}