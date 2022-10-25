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
 API Response for AttributeTemplate_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/attributetemplate_insert
 */
public class AttributeTemplateInsertResponse : Response {

    /// The response model
    public var attributeTemplate : Optional<AttributeTemplate> = nil

    /**
     Getter for attributeTemplate.

     - Returns: AttributeTemplate
     */
    public func getAttributeTemplate() -> Optional<AttributeTemplate> {
        return self.attributeTemplate
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case attributeTemplate = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.attributeTemplate = try container.decodeIfPresent(AttributeTemplate.self, forKey: .attributeTemplate)
        try super.init(from : decoder)
    }
}