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
 API Response for Option_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/option_insert
 */
public class OptionInsertResponse : Response {

    /// The response model
    public var productOption : Optional<ProductOption> = nil

    /**
     Getter for productOption.

     - Returns: ProductOption
     */
    public func getProductOption() -> Optional<ProductOption> {
        return self.productOption
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case productOption = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.productOption = try container.decodeIfPresent(ProductOption.self, forKey: .productOption)
        try super.init(from : decoder)
    }
}