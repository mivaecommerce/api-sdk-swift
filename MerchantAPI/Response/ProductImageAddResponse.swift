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
 API Response for ProductImage_Add.

 - SeeAlso: https://docs.miva.com/json-api/functions/productimage_add
 */
public class ProductImageAddResponse : Response {

    /// The response model
    public var productImageData : Optional<ProductImageData> = nil

    /**
     Getter for productImageData.

     - Returns: ProductImageData
     */
    public func getProductImageData() -> Optional<ProductImageData> {
        return self.productImageData
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case productImageData = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.productImageData = try container.decodeIfPresent(ProductImageData.self, forKey: .productImageData)
        try super.init(from : decoder)
    }
}