/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// JavaScriptResourceChange data model.
public class JavaScriptResourceChange : Model {

    /// Model field JavaScriptResource_ID.
    var javaScriptResourceId : Optional<Int>

    /// Model field JavaScriptResource_Code.
    var javaScriptResourceCode : Optional<String>

    /// Model field Type.
    var type : Optional<String>

    /// Model field Global.
    var global : Optional<Bool>

    /// Model field Active.
    var active : Optional<Bool>

    /// Model field File_Path.
    var filePath : Optional<String>

    /// Model field Branchless_File_Path.
    var branchlessFilePath : Optional<String>

    /// Model field Source.
    var source : Optional<String>

    /// Model field LinkedPages.
    var linkedPages : [String]

    /// Model field LinkedResources.
    var linkedResources : [String]

    /// Model field Attributes.
    var attributes : [JavaScriptResourceVersionAttribute]

    /// Model field Notes.
    var notes : Optional<String>

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case javaScriptResourceId = "JavaScriptResource_ID"
        case javaScriptResourceCode = "JavaScriptResource_Code"
        case type = "Type"
        case global = "Global"
        case active = "Active"
        case filePath = "File_Path"
        case branchlessFilePath = "Branchless_File_Path"
        case source = "Source"
        case linkedPages = "LinkedPages"
        case linkedResources = "LinkedResources"
        case attributes = "Attributes"
        case notes = "Notes"
    }

    /**
     JavaScriptResourceChange Constructor.
     */
    public override init() {
        self.javaScriptResourceId = nil
        self.javaScriptResourceCode = nil
        self.type = nil
        self.global = nil
        self.active = nil
        self.filePath = nil
        self.branchlessFilePath = nil
        self.source = nil
        self.linkedPages = []
        self.linkedResources = []
        self.attributes = []
        self.notes = nil

        super.init()
    }

    /**
     JavaScriptResourceChange Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.javaScriptResourceId = try container.decodeIfPresent(Int.self, forKey: .javaScriptResourceId) ?? nil
        self.javaScriptResourceCode = try container.decodeIfPresent(String.self, forKey: .javaScriptResourceCode) ?? nil
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? nil
        self.global = try container.decodeIfPresent(Bool.self, forKey: .global) ?? nil
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? nil
        self.filePath = try container.decodeIfPresent(String.self, forKey: .filePath) ?? nil
        self.branchlessFilePath = try container.decodeIfPresent(String.self, forKey: .branchlessFilePath) ?? nil
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? nil
        self.linkedPages = try container.decodeIfPresent([String].self, forKey: .linkedPages) ?? []
        self.linkedResources = try container.decodeIfPresent([String].self, forKey: .linkedResources) ?? []
        self.attributes = try container.decodeIfPresent([JavaScriptResourceVersionAttribute].self, forKey: .attributes) ?? []
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

        try container.encodeIfPresent(self.javaScriptResourceId, forKey: .javaScriptResourceId)
        try container.encodeIfPresent(self.javaScriptResourceCode, forKey: .javaScriptResourceCode)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.global, forKey: .global)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(self.filePath, forKey: .filePath)
        try container.encodeIfPresent(self.branchlessFilePath, forKey: .branchlessFilePath)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.linkedPages, forKey: .linkedPages)
        try container.encodeIfPresent(self.linkedResources, forKey: .linkedResources)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)
        try container.encodeIfPresent(self.notes, forKey: .notes)

        try super.encode(to: encoder)
    }

    /**
     Getter for JavaScriptResource_ID.

     - Returns:  Optional<Int>

     */
    public func getJavaScriptResourceId() -> Optional<Int> {
        return self.javaScriptResourceId
    }

    /**
     Getter for JavaScriptResource_Code.

     - Returns:  Optional<String>

     */
    public func getJavaScriptResourceCode() -> Optional<String> {
        return self.javaScriptResourceCode
    }

    /**
     Getter for Type.

     - Returns:  Optional<String>

     */
    public func getType() -> Optional<String> {
        return self.type
    }

    /**
     Getter for Global.

     - Returns:  Optional<Bool>     */
    public func getGlobal() -> Optional<Bool> {
        return self.global
    }

    /**
     Getter for Active.

     - Returns:  Optional<Bool>     */
    public func getActive() -> Optional<Bool> {
        return self.active
    }

    /**
     Getter for File_Path.

     - Returns:  Optional<String>

     */
    public func getFilePath() -> Optional<String> {
        return self.filePath
    }

    /**
     Getter for Branchless_File_Path.

     - Returns:  Optional<String>

     */
    public func getBranchlessFilePath() -> Optional<String> {
        return self.branchlessFilePath
    }

    /**
     Getter for Source.

     - Returns:  Optional<String>

     */
    public func getSource() -> Optional<String> {
        return self.source
    }

    /**
     Getter for LinkedPages.

     - Returns:  [String]
     */
    public func getLinkedPages() -> [String] {
        return self.linkedPages
    }

    /**
     Getter for LinkedResources.

     - Returns:  [String]
     */
    public func getLinkedResources() -> [String] {
        return self.linkedResources
    }

    /**
     Getter for Attributes.

     - Returns:  [JavaScriptResourceVersionAttribute]
     */
    public func getAttributes() -> [JavaScriptResourceVersionAttribute] {
        return self.attributes
    }

    /**
     Getter for Notes.

     - Returns:  Optional<String>

     */
    public func getNotes() -> Optional<String> {
        return self.notes
    }

    /**
     Setter for JavaScriptResource_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceId(_ value: Int) -> Self {
        self.javaScriptResourceId = value
        return self
    }

    /**
     Setter for JavaScriptResource_Code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceCode(_ value: String) -> Self {
        self.javaScriptResourceCode = value
        return self
    }

    /**
     Setter for Type.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setType(_ value: String) -> Self {
        self.type = value
        return self
    }

    /**
     Setter for Global.

     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setGlobal(_ value: Bool) -> Self {
        self.global = value
        return self
    }

    /**
     Setter for Active.

     - Parameters:
        - value: Bool
     - Returns:  Self
     */
    @discardableResult
    public func setActive(_ value: Bool) -> Self {
        self.active = value
        return self
    }

    /**
     Setter for File_Path.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setFilePath(_ value: String) -> Self {
        self.filePath = value
        return self
    }

    /**
     Setter for Branchless_File_Path.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setBranchlessFilePath(_ value: String) -> Self {
        self.branchlessFilePath = value
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
     Setter for LinkedPages.

     - Parameters:
        - value: [String]
     - Returns:  Self
     */
    @discardableResult
    public func setLinkedPages(_ value: [String]) -> Self {
        self.linkedPages = value
        return self
    }

    /**
     Setter for LinkedResources.

     - Parameters:
        - value: [String]
     - Returns:  Self
     */
    @discardableResult
    public func setLinkedResources(_ value: [String]) -> Self {
        self.linkedResources = value
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

    /**
     Add a JavaScriptResourceVersionAttribute.

     - Parameters:
        - attribute: JavaScriptResourceVersionAttribute
     - Returns:  Self
     */
    @discardableResult
    public func addAttribute(_ attribute: JavaScriptResourceVersionAttribute) -> Self {
        self.attributes.append(attribute)
        return self
    }
}
