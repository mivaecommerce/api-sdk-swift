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
 API Response for AttributeTemplateOption_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/attributetemplateoption_insert
 */
public class AttributeTemplateOptionInsertResponse : Response {

    /// The response model
    public var attributeTemplateOption : Optional<AttributeTemplateOption> = nil

    /**
     Getter for attributeTemplateOption.

     - Returns: AttributeTemplateOption
     */
    public func getAttributeTemplateOption() -> Optional<AttributeTemplateOption> {
        return self.attributeTemplateOption
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case attributeTemplateOption = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.attributeTemplateOption = try container.decodeIfPresent(AttributeTemplateOption.self, forKey: .attributeTemplateOption)
        try super.init(from : decoder)
    }
}