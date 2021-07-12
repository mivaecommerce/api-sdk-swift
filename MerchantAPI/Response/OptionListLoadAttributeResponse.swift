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
 API Response for OptionList_Load_Attribute.

 - SeeAlso: https://docs.miva.com/json-api/functions/optionlist_load_attribute
 */
public class OptionListLoadAttributeResponse : Response {

    /// Holds array of ProductOption returned by the response
    public var data : [ProductOption] = []

    /// Named computed property for data
    public var productOptions : [ProductOption] {
        get {
            return self.data
        }
    }

    /**
     Getter for productOptions.

     - Returns: [ProductOption]
     */
    public func getProductOptions() -> [ProductOption] {
        return self.productOptions
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

        self.data = try container.decodeIfPresent([ProductOption].self, forKey: .data) ?? []
        try super.init(from : decoder)
    }
}