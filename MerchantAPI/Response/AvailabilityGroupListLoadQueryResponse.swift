/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: AvailabilityGroupListLoadQueryResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for AvailabilityGroupList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/availabilitygrouplist_load_query
 */
public class AvailabilityGroupListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<AvailabilityGroup>

    /// Named computed property for data
    public var availabilityGroups : [AvailabilityGroup] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for availabilityGroups.

     - Returns: [AvailabilityGroup]
     */
    public func getAvailabilityGroups() -> [AvailabilityGroup] {
        return self.availabilityGroups
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

        self.data = try container.decodeIfPresent(ListQueryResult<AvailabilityGroup>.self, forKey: .data) ?? ListQueryResult<AvailabilityGroup>()
        try super.init(from : decoder)
    }
}