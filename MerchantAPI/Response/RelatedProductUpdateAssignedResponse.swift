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
 API Response for RelatedProduct_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/relatedproduct_update_assigned
 */
public class RelatedProductUpdateAssignedResponse : Response {

    /// Holds array of RelatedProduct returned by the response
    public var data : [RelatedProduct] = []

    /// Named computed property for data
    public var relatedProducts : [RelatedProduct] {
        get {
            return self.data
        }
    }

    /**
     Getter for relatedProducts.

     - Returns: [RelatedProduct]
     */
    public func getRelatedProducts() -> [RelatedProduct] {
        return self.relatedProducts
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

        self.data = try container.decodeIfPresent([RelatedProduct].self, forKey: .data) ?? []
        try super.init(from : decoder)
    }
}