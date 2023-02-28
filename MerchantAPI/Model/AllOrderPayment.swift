/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// AllOrderPayment data model.
public class AllOrderPayment : Order {

    /// Model field orderpayment
    var orderPayment : OrderPayment

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case orderPayment = "orderpayment"
    }

    /**
     AllOrderPayment Constructor.
     */
    public override init() {
        self.orderPayment = OrderPayment()

        super.init()
    }

    /**
     AllOrderPayment Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.orderPayment = try container.decodeIfPresent(OrderPayment.self, forKey: .orderPayment) ?? OrderPayment()

        try super.init(from : decoder)
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encoder: The Encoder instance.
     - Throws: error when unable to encode.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.orderPayment, forKey: .orderPayment)

        try super.encode(to: encoder)
    }

    /**
     Getter for orderpayment.

     - Returns:  OrderPayment
     */
    public func getOrderPayment() -> OrderPayment {
        return self.orderPayment
    }
}
