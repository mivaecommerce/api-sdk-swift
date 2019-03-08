/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CustomerListLoadQueryResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for CustomerList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/customerlist_load_query
 */
public class CustomerListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<Customer>

    /// Named computed property for data
    public var customers : [Customer] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for customers.

     - Returns: [Customer]
     */
    public func getCustomers() -> [Customer] {
        return self.customers
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

        self.data = try container.decodeIfPresent(ListQueryResult<Customer>.self, forKey: .data) ?? ListQueryResult<Customer>()
        try super.init(from : decoder)
    }
}