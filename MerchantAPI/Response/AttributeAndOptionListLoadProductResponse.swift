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
 API Response for AttributeAndOptionList_Load_Product.

 - SeeAlso: https://docs.miva.com/json-api/functions/attributeandoptionlist_load_product
 */
public class AttributeAndOptionListLoadProductResponse : Response {

    /// Holds array of ProductAttribute returned by the response
    public var data : [ProductAttribute] = []

    /// Named computed property for data
    public var productAttributes : [ProductAttribute] {
        get {
            return self.data
        }
    }

    /**
     Getter for productAttributes.

     - Returns: [ProductAttribute]
     */
    public func getProductAttributes() -> [ProductAttribute] {
        return self.productAttributes
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.data = try container.decodeIfPresent([ProductAttribute].self, forKey: .data) ?? []
        try super.init(from : decoder)
    }
}