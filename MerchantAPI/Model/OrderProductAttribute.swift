/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/// OrderProductAttribute data model.
public class OrderProductAttribute : Model {

    /// Model field code.
    var code : String

    /// Model field template_code.
    var templateCode : String

    /// Model field value.
    var value : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case code
        case templateCode = "template_code"
        case value
    }

    /**
     OrderProductAttribute Constructor.
     */
    public override init() {
        self.code = ""
        self.templateCode = ""
        self.value = ""

        super.init()
    }

    /**
     OrderProductAttribute Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.templateCode = try container.decodeIfPresent(String.self, forKey: .templateCode) ?? ""
        self.value = try container.decodeIfPresent(String.self, forKey: .value) ?? ""

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

        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.templateCode, forKey: .templateCode)
        try container.encodeIfPresent(self.value, forKey: .value)

        try super.encode(to: encoder)
    }
    
    /**
     Getter for code.

     - Returns:  String
     */
    public func getCode() -> String {
        return self.code
    }
    
    /**
     Getter for template_code.

     - Returns:  String
     */
    public func getTemplateCode() -> String {
        return self.templateCode
    }
    
    /**
     Getter for value.

     - Returns:  String
     */
    public func getValue() -> String {
        return self.value
    }

    /**
     Setter for code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setCode(_ value: String) -> Self {
        self.code = value
        return self
    }

    /**
     Setter for template_code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setTemplateCode(_ value: String) -> Self {
        self.templateCode = value
        return self
    }

    /**
     Setter for value.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setValue(_ value: String) -> Self {
        self.value = value
        return self
    }
}
