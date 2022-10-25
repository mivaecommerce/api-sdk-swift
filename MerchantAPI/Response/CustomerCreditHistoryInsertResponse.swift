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
 API Response for CustomerCreditHistory_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/customercredithistory_insert
 */
public class CustomerCreditHistoryInsertResponse : Response {

    /// The response model
    public var customerCreditHistory : Optional<CustomerCreditHistory> = nil

    /**
     Getter for customerCreditHistory.

     - Returns: CustomerCreditHistory
     */
    public func getCustomerCreditHistory() -> Optional<CustomerCreditHistory> {
        return self.customerCreditHistory
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case customerCreditHistory = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.customerCreditHistory = try container.decodeIfPresent(CustomerCreditHistory.self, forKey: .customerCreditHistory)
        try super.init(from : decoder)
    }
}