/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/**
 API Response for CategoryList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/categorylist_load_query
 */
public class CategoryListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<Category>

    /// Named computed property for data
    public var categories : [Category] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for categories.

     - Returns: [Category]
     */
    public func getCategories() -> [Category] {
        return self.categories
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

        self.data = try container.decodeIfPresent(ListQueryResult<Category>.self, forKey: .data) ?? ListQueryResult<Category>()
        try super.init(from : decoder)
    }
}