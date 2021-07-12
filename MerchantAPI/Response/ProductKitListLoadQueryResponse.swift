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
 API Response for ProductKitList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/productkitlist_load_query
 */
public class ProductKitListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<ProductKit>

    /// Named computed property for data
    public var productKits : [ProductKit] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for productKits.

     - Returns: [ProductKit]
     */
    public func getProductKits() -> [ProductKit] {
        return self.productKits
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

        self.data = try container.decodeIfPresent(ListQueryResult<ProductKit>.self, forKey: .data) ?? ListQueryResult<ProductKit>()
        try super.init(from : decoder)
    }
}