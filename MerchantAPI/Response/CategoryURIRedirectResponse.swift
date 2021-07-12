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
 API Response for CategoryURI_Redirect.

 - SeeAlso: https://docs.miva.com/json-api/functions/categoryuri_redirect
 */
public class CategoryURIRedirectResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<Uri>

    /// Named computed property for data
    public var uris : [Uri] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for uris.

     - Returns: [Uri]
     */
    public func getUris() -> [Uri] {
        return self.uris
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

        self.data = try container.decodeIfPresent(ListQueryResult<Uri>.self, forKey: .data) ?? ListQueryResult<Uri>()
        try super.init(from : decoder)
    }
}