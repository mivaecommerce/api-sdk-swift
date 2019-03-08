/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CategoryProductListLoadQueryResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for CategoryProductList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/categoryproductlist_load_query
 */
public class CategoryProductListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CategoryProduct>

    /// Named computed property for data
    public var categoryProducts : [CategoryProduct] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for categoryProducts.

     - Returns: [CategoryProduct]
     */
    public func getCategoryProducts() -> [CategoryProduct] {
        return self.categoryProducts
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

        self.data = try container.decodeIfPresent(ListQueryResult<CategoryProduct>.self, forKey: .data) ?? ListQueryResult<CategoryProduct>()
        try super.init(from : decoder)
    }
}