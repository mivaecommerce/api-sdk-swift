/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ShippingRuleMethod data model.
public class ShippingRuleMethod : Model {

    /// Model field module_code.
    var moduleCode : Optional<String>

    /// Model field method_code.
    var methodCode : Optional<String>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case moduleCode = "module_code"
        case methodCode = "method_code"
    }

    /**
     ShippingRuleMethod Constructor.
     */
    public override init() {
        self.moduleCode = nil
        self.methodCode = nil

        super.init()
    }

    /**
     ShippingRuleMethod Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.moduleCode = try container.decodeIfPresent(String.self, forKey: .moduleCode) ?? nil
        self.methodCode = try container.decodeIfPresent(String.self, forKey: .methodCode) ?? nil

        try super.init(from : decoder)
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encoder: The Encoder instance.
     - Throws: error when unable to encode.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.moduleCode, forKey: .moduleCode)
        try container.encodeIfPresent(self.methodCode, forKey: .methodCode)

        try super.encode(to: encoder)
    }

    /**
     Getter for module_code.

     - Returns:  Optional<String>

     */
    public func getModuleCode() -> Optional<String> {
        return self.moduleCode
    }

    /**
     Getter for method_code.

     - Returns:  Optional<String>

     */
    public func getMethodCode() -> Optional<String> {
        return self.methodCode
    }

    /**
     Setter for module_code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setModuleCode(_ value: String) -> Self {
        self.moduleCode = value
        return self
    }

    /**
     Setter for method_code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setMethodCode(_ value: String) -> Self {
        self.methodCode = value
        return self
    }
}
