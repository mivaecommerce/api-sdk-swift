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
 API Response for Product_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/product_insert
 */
public class ProductInsertResponse : Response {

    /// The response model
    public var product : Optional<Product> = nil

    /**
     Getter for product.

     - Returns: Product
     */
    public func getProduct() -> Optional<Product> {
        return self.product
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case product = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.product = try container.decodeIfPresent(Product.self, forKey: .product)
        try super.init(from : decoder)
    }
}