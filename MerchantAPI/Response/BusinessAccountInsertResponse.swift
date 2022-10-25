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
 API Response for BusinessAccount_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/businessaccount_insert
 */
public class BusinessAccountInsertResponse : Response {

    /// The response model
    public var businessAccount : Optional<BusinessAccount> = nil

    /**
     Getter for businessAccount.

     - Returns: BusinessAccount
     */
    public func getBusinessAccount() -> Optional<BusinessAccount> {
        return self.businessAccount
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case businessAccount = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.businessAccount = try container.decodeIfPresent(BusinessAccount.self, forKey: .businessAccount)
        try super.init(from : decoder)
    }
}