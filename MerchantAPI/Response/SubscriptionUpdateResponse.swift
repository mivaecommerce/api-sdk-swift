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
 API Response for Subscription_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/subscription_update
 */
public class SubscriptionUpdateResponse : Response {

    /// The response model
    public var subscription : Optional<Subscription> = nil

    /**
     Getter for subscription.

     - Returns: Subscription
     */
    public func getSubscription() -> Optional<Subscription> {
        return self.subscription
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case subscription = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.subscription = try container.decodeIfPresent(Subscription.self, forKey: .subscription)
        try super.init(from : decoder)
    }
}