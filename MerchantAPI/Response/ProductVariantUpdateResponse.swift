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
 API Response for ProductVariant_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/productvariant_update
 */
public class ProductVariantUpdateResponse : Response {
    /// Response field product_id.
    var productId : Optional<Int> = nil

    /// Response field variant_id.
    var variantId : Optional<Int> = nil

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case variantId = "variant_id"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId)
        self.variantId = try container.decodeIfPresent(Int.self, forKey: .variantId)
        try super.init(from : decoder)
    }

    /**
     Get product_id.

     - Returns: Int
    */
    func getProductId() -> Int {
        return self.productId ?? 0
    }

    /**
     Get variant_id.

     - Returns: Int
    */
    func getVariantId() -> Int {
        return self.variantId ?? 0
    }
}