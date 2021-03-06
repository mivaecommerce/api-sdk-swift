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
 API Response for OrderPayment_VOID.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderpayment_void
 */
public class OrderPaymentVoidResponse : Response {

    /// The response model
    public var orderPaymentTotal : Optional<OrderPaymentTotal> = nil

    /**
     Getter for orderPaymentTotal.

     - Returns: OrderPaymentTotal
     */
    public func getOrderPaymentTotal() -> Optional<OrderPaymentTotal> {
        return self.orderPaymentTotal
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case orderPaymentTotal = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.orderPaymentTotal = try container.decodeIfPresent(OrderPaymentTotal.self, forKey: .orderPaymentTotal)
        try super.init(from : decoder)
    }
}