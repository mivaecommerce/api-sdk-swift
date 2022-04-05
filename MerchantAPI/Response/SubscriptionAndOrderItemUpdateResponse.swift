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
 API Response for SubscriptionAndOrderItem_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/subscriptionandorderitem_update
 */
public class SubscriptionAndOrderItemUpdateResponse : Response {
    /// Response field total.
    var total : Optional<Decimal> = nil

    /// Response field formatted_total.
    var formattedTotal : Optional<String> = nil

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case total
        case formattedTotal = "formatted_total"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.total = try container.decodeIfPresent(Decimal.self, forKey: .total)
        self.formattedTotal = try container.decodeIfPresent(String.self, forKey: .formattedTotal)
        try super.init(from : decoder)
    }

    /**
     Get total.

     - Returns: Decimal
    */
    func getTotal() -> Decimal {
        return self.total ?? 0.00
    }

    /**
     Get formatted_total.

     - Returns: string
    */
    func getFormattedTotal() -> String {
        return self.formattedTotal ?? ""
    }
}