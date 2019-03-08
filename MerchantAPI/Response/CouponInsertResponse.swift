/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CouponInsertResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for Coupon_Insert.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/coupon_insert
 */
public class CouponInsertResponse : Response {
    /// Response field id.
    var id : Optional<Int>

    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case data
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        if container.contains(.data) {
            let datacontainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
            self.id = try datacontainer.decodeIfPresent(Int.self, forKey: .id)
        }

        try super.init(from : decoder)
    }

    /**
     Get id.

     - Returns: Int
    */
    func getId() -> Int {
        return self.id ?? 0
    }
}