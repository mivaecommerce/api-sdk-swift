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
 API Response for Provision_Store.

 - SeeAlso: https://docs.miva.com/json-api/functions/provision_store
 */
public class ProvisionStoreResponse : Response {

    /// Holds array of ProvisionMessage returned by the response
    public var data : [ProvisionMessage] = []

    /// Named computed property for data
    public var provisionMessages : [ProvisionMessage] {
        get {
            return self.data
        }
    }

    /**
     Getter for provisionMessages.

     - Returns: [ProvisionMessage]
     */
    public func getProvisionMessages() -> [ProvisionMessage] {
        return self.provisionMessages
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

        self.data = try container.decodeIfPresent([ProvisionMessage].self, forKey: .data) ?? []
        try super.init(from : decoder)
    }
}