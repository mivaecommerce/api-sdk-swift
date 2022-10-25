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

    /// The response model
    public var productVariant : Optional<ProductVariant> = nil

    /**
     Getter for productVariant.

     - Returns: ProductVariant
     */
    public func getProductVariant() -> Optional<ProductVariant> {
        return self.productVariant
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case productVariant = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.productVariant = try container.decodeIfPresent(ProductVariant.self, forKey: .productVariant)
        try super.init(from : decoder)
    }
}