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
 API Response for Order_Authorize.

 - SeeAlso: https://docs.miva.com/json-api/functions/order_authorize
 */
public class OrderAuthorizeResponse : Response {

    /// The response model
    public var orderPaymentAuthorize : Optional<OrderPaymentAuthorize> = nil

    /**
     Getter for orderPaymentAuthorize.

     - Returns: OrderPaymentAuthorize
     */
    public func getOrderPaymentAuthorize() -> Optional<OrderPaymentAuthorize> {
        return self.orderPaymentAuthorize
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case orderPaymentAuthorize = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.orderPaymentAuthorize = try container.decodeIfPresent(OrderPaymentAuthorize.self, forKey: .orderPaymentAuthorize)
        try super.init(from : decoder)
    }
}