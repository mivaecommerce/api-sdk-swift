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
 API Response for Customer_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/customer_insert
 */
public class CustomerInsertResponse : Response {

    /// The response model
    public var customer : Optional<Customer> = nil

    /**
     Getter for customer.

     - Returns: Customer
     */
    public func getCustomer() -> Optional<Customer> {
        return self.customer
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case customer = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.customer = try container.decodeIfPresent(Customer.self, forKey: .customer)
        try super.init(from : decoder)
    }
}