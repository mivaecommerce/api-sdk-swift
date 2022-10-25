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
 API Response for AttributeTemplateAttribute_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/attributetemplateattribute_insert
 */
public class AttributeTemplateAttributeInsertResponse : Response {

    /// The response model
    public var attributeTemplateAttribute : Optional<AttributeTemplateAttribute> = nil

    /**
     Getter for attributeTemplateAttribute.

     - Returns: AttributeTemplateAttribute
     */
    public func getAttributeTemplateAttribute() -> Optional<AttributeTemplateAttribute> {
        return self.attributeTemplateAttribute
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case attributeTemplateAttribute = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.attributeTemplateAttribute = try container.decodeIfPresent(AttributeTemplateAttribute.self, forKey: .attributeTemplateAttribute)
        try super.init(from : decoder)
    }
}