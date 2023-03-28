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
 API Response for CSSResource_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/cssresource_insert
 */
public class CSSResourceInsertResponse : Response {

    /// The response model
    public var cssResource : Optional<CSSResource> = nil

    /**
     Getter for CSSResource.

     - Returns: CSSResource
     */
    public func getCSSResource() -> Optional<CSSResource> {
        return self.cssResource
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case CSSResource = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.cssResource = try container.decodeIfPresent(CSSResource.self, forKey: .CSSResource)
        try super.init(from : decoder)
    }
}