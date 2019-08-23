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
 API Response for CustomerAddressList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/customeraddresslist_load_query
 */
public class CustomerAddressListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CustomerAddress>

    /// Named computed property for data
    public var customerAddresses : [CustomerAddress] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for customerAddresses.

     - Returns: [CustomerAddress]
     */
    public func getCustomerAddresses() -> [CustomerAddress] {
        return self.customerAddresses
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

        self.data = try container.decodeIfPresent(ListQueryResult<CustomerAddress>.self, forKey: .data) ?? ListQueryResult<CustomerAddress>()
        try super.init(from : decoder)
    }
}