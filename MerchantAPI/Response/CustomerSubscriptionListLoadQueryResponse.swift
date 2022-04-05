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
 API Response for CustomerSubscriptionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/customersubscriptionlist_load_query
 */
public class CustomerSubscriptionListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CustomerSubscription>

    /// Named computed property for data
    public var customerSubscriptions : [CustomerSubscription] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for customerSubscriptions.

     - Returns: [CustomerSubscription]
     */
    public func getCustomerSubscriptions() -> [CustomerSubscription] {
        return self.customerSubscriptions
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

        self.data = try container.decodeIfPresent(ListQueryResult<CustomerSubscription>.self, forKey: .data) ?? ListQueryResult<CustomerSubscription>()
        try super.init(from : decoder)
    }
}