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
 API Response for ProductKit_Variant_Count.

 - SeeAlso: https://docs.miva.com/json-api/functions/productkit_variant_count
 */
public class ProductKitVariantCountResponse : Response {
    /// Response field variants.
    var variants : Optional<Int> = nil

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case variants
        case data
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        if container.contains(.data) {
            let datacontainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
            self.variants = try datacontainer.decodeIfPresent(Int.self, forKey: .variants)
        }

        try super.init(from : decoder)
    }

    /**
     Get variants.

     - Returns: Int
    */
    func getVariants() -> Int {
        return self.variants ?? 0
    }
}