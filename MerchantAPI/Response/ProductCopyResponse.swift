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
 API Response for Product_Copy.

 - SeeAlso: https://docs.miva.com/json-api/functions/product_copy
 */
public class ProductCopyResponse : Response {
    /// Response field completed.
    var completed : Optional<Bool> = nil

    /// Response field product_copy_session_id.
    var productCopySessionId : Optional<String> = nil

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
        case completed
        case productCopySessionId = "product_copy_session_id"
        case product = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.completed = try container.decodeIfPresent(Bool.self, forKey: .completed)
        self.productCopySessionId = try container.decodeIfPresent(String.self, forKey: .productCopySessionId)
        self.product = try container.decodeIfPresent(Product.self, forKey: .product)
        try super.init(from : decoder)
    }

    /**
     Get completed.

     - Returns: Bool
    */
    func getCompleted() -> Bool {
        return self.completed ?? false
    }

    /**
     Get product_copy_session_id.

     - Returns: string
    */
    func getProductCopySessionId() -> String {
        return self.productCopySessionId ?? ""
    }
}