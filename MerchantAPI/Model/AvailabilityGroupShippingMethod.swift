/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// AvailabilityGroupShippingMethod data model.
public class AvailabilityGroupShippingMethod : Model {

    /// Model field mod_code.
    var moduleCode : String
    /// Model field meth_code.
    var methodCode : String
    /// Model field method_name.
    var methodName : String
    /// Model field assigned.
    var assigned : Bool
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case moduleCode = "mod_code"
        case methodCode = "meth_code"
        case methodName = "method_name"
        case assigned
    }

    /**
     AvailabilityGroupShippingMethod Constructor.
     */
    public override init() {
        self.moduleCode = ""
        self.methodCode = ""
        self.methodName = ""
        self.assigned = false

        super.init()
    }

    /**
     AvailabilityGroupShippingMethod Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.moduleCode = try container.decodeIfPresent(String.self, forKey: .moduleCode) ?? ""
        self.methodCode = try container.decodeIfPresent(String.self, forKey: .methodCode) ?? ""
        self.methodName = try container.decodeIfPresent(String.self, forKey: .methodName) ?? ""
        self.assigned = try container.decodeIfPresent(Bool.self, forKey: .assigned) ?? false

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
        try container.encodeIfPresent(self.methodName, forKey: .methodName)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

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

    /**
     Getter for method_name.

     - Returns:  String

     */
    public func getMethodName() -> String {
        return self.methodName
    }

    /**
     Getter for assigned.

     - Returns:  Bool     */
    public func getAssigned() -> Bool {
        return self.assigned
    }
}
