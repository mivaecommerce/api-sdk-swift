/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// TemplateChange data model.
public class TemplateChange : Model {

    /// Model field Template_ID.
    var templateId : Optional<Int>

    /// Model field Template_Filename.
    var templateFilename : Optional<String>

    /// Model field Source.
    var source : String

    /// Model field Settings
    var settings : VersionSettings

    /// Model field Notes.
    var notes : Optional<String>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case templateId = "Template_ID"
        case templateFilename = "Template_Filename"
        case source = "Source"
        case settings = "Settings"
        case notes = "Notes"
    }

    /**
     TemplateChange Constructor.
     */
    public override init() {
        self.templateId = nil
        self.templateFilename = nil
        self.source = ""
        self.settings = VersionSettings()
        self.notes = nil

        super.init()
    }

    /**
     TemplateChange Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.templateId = try container.decodeIfPresent(Int.self, forKey: .templateId) ?? nil
        self.templateFilename = try container.decodeIfPresent(String.self, forKey: .templateFilename) ?? nil
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
        self.settings = try container.decodeIfPresent(VersionSettings.self, forKey: .settings) ?? VersionSettings()
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes) ?? nil

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

        try container.encodeIfPresent(self.templateId, forKey: .templateId)
        try container.encodeIfPresent(self.templateFilename, forKey: .templateFilename)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.settings, forKey: .settings)
        try container.encodeIfPresent(self.notes, forKey: .notes)

        try super.encode(to: encoder)
    }

    /**
     Getter for Template_ID.

     - Returns:  Optional<Int>

     */
    public func getTemplateId() -> Optional<Int> {
        return self.templateId
    }

    /**
     Getter for Template_Filename.

     - Returns:  Optional<String>

     */
    public func getTemplateFilename() -> Optional<String> {
        return self.templateFilename
    }

    /**
     Getter for Source.

     - Returns:  String

     */
    public func getSource() -> String {
        return self.source
    }

    /**
     Getter for Settings.

     - Returns:  VersionSettings
     */
    public func getSettings() -> VersionSettings {
        return self.settings
    }

    /**
     Getter for Notes.

     - Returns:  Optional<String>

     */
    public func getNotes() -> Optional<String> {
        return self.notes
    }

    /**
     Setter for Template_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setTemplateId(_ value: Int) -> Self {
        self.templateId = value
        return self
    }

    /**
     Setter for Template_Filename.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setTemplateFilename(_ value: String) -> Self {
        self.templateFilename = value
        return self
    }

    /**
     Setter for Source.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setSource(_ value: String) -> Self {
        self.source = value
        return self
    }

    /**
     Setter for Notes.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setNotes(_ value: String) -> Self {
        self.notes = value
        return self
    }
}
