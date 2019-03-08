/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CouponListDeleteResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for CouponList_Delete.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/couponlist_delete
 */
public class CouponListDeleteResponse : Response {
    /// Response field processed.
    var processed : Optional<Int>

    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case processed
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.processed = try container.decodeIfPresent(Int.self, forKey: .processed)
        try super.init(from : decoder)
    }

    /**
     Get processed.

     - Returns: Int
    */
    func getProcessed() -> Int {
        return self.processed ?? 0
    }
}