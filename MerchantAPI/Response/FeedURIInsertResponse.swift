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
 API Response for FeedURI_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/feeduri_insert
 */
public class FeedURIInsertResponse : Response {

    /// The response model
    public var uri : Optional<Uri> = nil

    /**
     Getter for uri.

     - Returns: Uri
     */
    public func getUri() -> Optional<Uri> {
        return self.uri
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case uri = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.uri = try container.decodeIfPresent(Uri.self, forKey: .uri)
        try super.init(from : decoder)
    }
}