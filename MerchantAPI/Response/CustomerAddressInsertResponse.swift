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
 API Response for CustomerAddress_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/customeraddress_insert
 */
public class CustomerAddressInsertResponse : Response {

    /// The response model
    public var customerAddress : Optional<CustomerAddress> = nil

    /**
     Getter for customerAddress.

     - Returns: CustomerAddress
     */
    public func getCustomerAddress() -> Optional<CustomerAddress> {
        return self.customerAddress
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case customerAddress = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.customerAddress = try container.decodeIfPresent(CustomerAddress.self, forKey: .customerAddress)
        try super.init(from : decoder)
    }
}