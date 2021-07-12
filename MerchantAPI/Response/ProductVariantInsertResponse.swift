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
 API Response for ProductVariant_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/productvariant_insert
 */
public class ProductVariantInsertResponse : Response {
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
        case data
        case variantId = "variant_id"
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
            self.productId = try datacontainer.decodeIfPresent(Int.self, forKey: .productId)
            self.variantId = try datacontainer.decodeIfPresent(Int.self, forKey: .variantId)
        }

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