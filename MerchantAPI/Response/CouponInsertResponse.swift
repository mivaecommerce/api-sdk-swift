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
 API Response for Coupon_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/coupon_insert
 */
public class CouponInsertResponse : Response {

    /// The response model
    public var coupon : Optional<Coupon> = nil

    /**
     Getter for coupon.

     - Returns: Coupon
     */
    public func getCoupon() -> Optional<Coupon> {
        return self.coupon
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case coupon = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.coupon = try container.decodeIfPresent(Coupon.self, forKey: .coupon)
        try super.init(from : decoder)
    }
}