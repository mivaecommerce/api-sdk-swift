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
 API Response for ProductSubscriptionTermList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/productsubscriptiontermlist_load_query
 */
public class ProductSubscriptionTermListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<ProductSubscriptionTerm>

    /// Named computed property for data
    public var productSubscriptionTerms : [ProductSubscriptionTerm] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for productSubscriptionTerms.

     - Returns: [ProductSubscriptionTerm]
     */
    public func getProductSubscriptionTerms() -> [ProductSubscriptionTerm] {
        return self.productSubscriptionTerms
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

        self.data = try container.decodeIfPresent(ListQueryResult<ProductSubscriptionTerm>.self, forKey: .data) ?? ListQueryResult<ProductSubscriptionTerm>()
        try super.init(from : decoder)
    }
}