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
 API Response for Page_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/page_insert
 */
public class PageInsertResponse : Response {

    /// The response model
    public var page : Optional<Page> = nil

    /**
     Getter for page.

     - Returns: Page
     */
    public func getPage() -> Optional<Page> {
        return self.page
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case page = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.page = try container.decodeIfPresent(Page.self, forKey: .page)
        try super.init(from : decoder)
    }
}