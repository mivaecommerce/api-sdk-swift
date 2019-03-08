/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: ProductShippingMethod.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/// ProductShippingMethod data model.
public class ProductShippingMethod : Model {

    /// Model field mod_code.
    var moduleCode : String

    /// Model field meth_code.
    var methodCode : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case moduleCode = "mod_code"
        case methodCode = "meth_code"
    }

    /**
     ProductShippingMethod Constructor.
     */
    public override init() {
        self.moduleCode = ""
        self.methodCode = ""

        super.init()
    }

    /**
     ProductShippingMethod Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.moduleCode = try container.decodeIfPresent(String.self, forKey: .moduleCode) ?? ""
        self.methodCode = try container.decodeIfPresent(String.self, forKey: .methodCode) ?? ""

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
     Getter for mod_code.

     - Returns:  String
     */
    public func getModuleCode() -> String {
        return self.moduleCode
    }
    
    /**
     Getter for meth_code.

     - Returns:  String
     */
    public func getMethodCode() -> String {
        return self.methodCode
    }
}
