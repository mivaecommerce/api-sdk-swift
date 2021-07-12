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
 API Response for Attribute_Load_Code.

 - SeeAlso: https://docs.miva.com/json-api/functions/attribute_load_code
 */
public class AttributeLoadCodeResponse : Response {

    /// The response model
    public var productAttribute : Optional<ProductAttribute> = nil

    /**
     Getter for productAttribute.

     - Returns: ProductAttribute
     */
    public func getProductAttribute() -> Optional<ProductAttribute> {
        return self.productAttribute
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case productAttribute = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.productAttribute = try container.decodeIfPresent(ProductAttribute.self, forKey: .productAttribute)
        try super.init(from : decoder)
    }
}