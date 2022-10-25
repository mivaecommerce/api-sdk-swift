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
 API Response for Category_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/category_insert
 */
public class CategoryInsertResponse : Response {

    /// The response model
    public var category : Optional<Category> = nil

    /**
     Getter for category.

     - Returns: Category
     */
    public func getCategory() -> Optional<Category> {
        return self.category
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case category = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.category = try container.decodeIfPresent(Category.self, forKey: .category)
        try super.init(from : decoder)
    }
}