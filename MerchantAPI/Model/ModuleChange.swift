/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ModuleChange data model.
public class ModuleChange : Model {

    /// Model field Module_Code.
    var moduleCode : Optional<String>

    /// Model field Module_Operation.
    var moduleOperation : Optional<String>

    /// Model field Module_Data
    var moduleData : VersionSettings

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case moduleCode = "Module_Code"
        case moduleOperation = "Module_Operation"
        case moduleData = "Module_Data"
    }

    /**
     ModuleChange Constructor.
     */
    public override init() {
        self.moduleCode = nil
        self.moduleOperation = nil
        self.moduleData = VersionSettings()

        super.init()
    }

    /**
     ModuleChange Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.moduleCode = try container.decodeIfPresent(String.self, forKey: .moduleCode) ?? nil
        self.moduleOperation = try container.decodeIfPresent(String.self, forKey: .moduleOperation) ?? nil
        self.moduleData = try container.decodeIfPresent(VersionSettings.self, forKey: .moduleData) ?? VersionSettings()

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
        try container.encodeIfPresent(self.moduleOperation, forKey: .moduleOperation)
        try container.encodeIfPresent(self.moduleData, forKey: .moduleData)

        try super.encode(to: encoder)
    }

    /**
     Getter for Module_Code.

     - Returns:  Optional<String>

     */
    public func getModuleCode() -> Optional<String> {
        return self.moduleCode
    }

    /**
     Getter for Module_Operation.

     - Returns:  Optional<String>

     */
    public func getModuleOperation() -> Optional<String> {
        return self.moduleOperation
    }

    /**
     Getter for Module_Data.

     - Returns:  VersionSettings
     */
    public func getModuleData() -> VersionSettings {
        return self.moduleData
    }

    /**
     Setter for Module_Code.

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
     Setter for Module_Operation.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setModuleOperation(_ value: String) -> Self {
        self.moduleOperation = value
        return self
    }
}
