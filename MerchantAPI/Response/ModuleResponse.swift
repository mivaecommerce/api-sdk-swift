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
 API Response for Module.

 - SeeAlso: https://docs.miva.com/json-api/functions/module
 */
public class ModuleResponse : Response {
    /// The underlying data the module returned, if any
    var data : Optional<VariableValue> = nil

    /**
     Get the underlying data if available

     - Returns: Optional<VariableValue>
     */
    public func getData() -> Optional<VariableValue> {
        return data
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

        self.data = try container.decodeIfPresent(VariableValue.self, forKey: .data) ?? nil
        try super.init(from : decoder)
    }
}