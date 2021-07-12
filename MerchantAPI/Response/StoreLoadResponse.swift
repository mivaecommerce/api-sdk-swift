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
 API Response for Store_Load.

 - SeeAlso: https://docs.miva.com/json-api/functions/store_load
 */
public class StoreLoadResponse : Response {

    /// The response model
    public var store : Optional<Store> = nil

    /**
     Getter for store.

     - Returns: Store
     */
    public func getStore() -> Optional<Store> {
        return self.store
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case store = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.store = try container.decodeIfPresent(Store.self, forKey: .store)
        try super.init(from : decoder)
    }
}