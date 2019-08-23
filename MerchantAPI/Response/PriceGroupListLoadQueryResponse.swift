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
 API Response for PriceGroupList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/pricegrouplist_load_query
 */
public class PriceGroupListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<PriceGroup>

    /// Named computed property for data
    public var priceGroups : [PriceGroup] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for priceGroups.

     - Returns: [PriceGroup]
     */
    public func getPriceGroups() -> [PriceGroup] {
        return self.priceGroups
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

        self.data = try container.decodeIfPresent(ListQueryResult<PriceGroup>.self, forKey: .data) ?? ListQueryResult<PriceGroup>()
        try super.init(from : decoder)
    }
}