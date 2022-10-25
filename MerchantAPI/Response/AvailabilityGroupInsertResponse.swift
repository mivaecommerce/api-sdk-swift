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
 API Response for AvailabilityGroup_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/availabilitygroup_insert
 */
public class AvailabilityGroupInsertResponse : Response {

    /// The response model
    public var availabilityGroup : Optional<AvailabilityGroup> = nil

    /**
     Getter for availabilityGroup.

     - Returns: AvailabilityGroup
     */
    public func getAvailabilityGroup() -> Optional<AvailabilityGroup> {
        return self.availabilityGroup
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case availabilityGroup = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.availabilityGroup = try container.decodeIfPresent(AvailabilityGroup.self, forKey: .availabilityGroup)
        try super.init(from : decoder)
    }
}