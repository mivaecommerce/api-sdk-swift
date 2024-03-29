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
 API Response for JavaScriptResource_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/javascriptresource_insert
 */
public class JavaScriptResourceInsertResponse : Response {

    /// The response model
    public var javaScriptResource : Optional<JavaScriptResource> = nil

    /**
     Getter for javaScriptResource.

     - Returns: JavaScriptResource
     */
    public func getJavaScriptResource() -> Optional<JavaScriptResource> {
        return self.javaScriptResource
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case javaScriptResource = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.javaScriptResource = try container.decodeIfPresent(JavaScriptResource.self, forKey: .javaScriptResource)
        try super.init(from : decoder)
    }
}