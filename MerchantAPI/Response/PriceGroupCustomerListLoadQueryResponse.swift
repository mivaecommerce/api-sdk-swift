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
 API Response for PriceGroupCustomerList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegroupcustomerlist_load_query
 */
public class PriceGroupCustomerListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<PriceGroupCustomer>

    /// Named computed property for data
    public var priceGroupCustomers : [PriceGroupCustomer] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for priceGroupCustomers.

     - Returns: [PriceGroupCustomer]
     */
    public func getPriceGroupCustomers() -> [PriceGroupCustomer] {
        return self.priceGroupCustomers
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

        self.data = try container.decodeIfPresent(ListQueryResult<PriceGroupCustomer>.self, forKey: .data) ?? ListQueryResult<PriceGroupCustomer>()
        try super.init(from : decoder)
    }
}