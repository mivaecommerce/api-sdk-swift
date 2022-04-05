/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Module data model.
public class Module : Model {

    /// Model field id.
    var id : Int

    /// Model field code.
    var code : String

    /// Model field name.
    var name : String

    /// Model field provider.
    var provider : String

    /// Model field api_ver.
    var apiVersion : String

    /// Model field version.
    var version : String

    /// Model field module.
    var module : String

    /// Model field refcount.
    var referenceCount : Int

    /// Model field active.
    var active : Bool

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case code
        case name
        case provider
        case apiVersion = "api_ver"
        case version
        case module
        case referenceCount = "refcount"
        case active
    }

    /**
     Module Constructor.
     */
    public override init() {
        self.id = 0
        self.code = ""
        self.name = ""
        self.provider = ""
        self.apiVersion = ""
        self.version = ""
        self.module = ""
        self.referenceCount = 0
        self.active = false

        super.init()
    }

    /**
     Module Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.provider = try container.decodeIfPresent(String.self, forKey: .provider) ?? ""
        self.apiVersion = try container.decodeIfPresent(String.self, forKey: .apiVersion) ?? ""
        self.version = try container.decodeIfPresent(String.self, forKey: .version) ?? ""
        self.module = try container.decodeIfPresent(String.self, forKey: .module) ?? ""
        self.referenceCount = try container.decodeIfPresent(Int.self, forKey: .referenceCount) ?? 0
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false

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

        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.apiVersion, forKey: .apiVersion)
        try container.encodeIfPresent(self.version, forKey: .version)
        try container.encodeIfPresent(self.module, forKey: .module)
        try container.encodeIfPresent(self.referenceCount, forKey: .referenceCount)
        try container.encodeIfPresent(self.active, forKey: .active)

        try super.encode(to: encoder)
    }

    /**
     Getter for id.

     - Returns:  Int

     */
    public func getId() -> Int {
        return self.id
    }

    /**
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for name.

     - Returns:  String

     */
    public func getName() -> String {
        return self.name
    }

    /**
     Getter for provider.

     - Returns:  String

     */
    public func getProvider() -> String {
        return self.provider
    }

    /**
     Getter for api_ver.

     - Returns:  String

     */
    public func getApiVersion() -> String {
        return self.apiVersion
    }

    /**
     Getter for version.

     - Returns:  String

     */
    public func getVersion() -> String {
        return self.version
    }

    /**
     Getter for module.

     - Returns:  String

     */
    public func getModule() -> String {
        return self.module
    }

    /**
     Getter for refcount.

     - Returns:  Int

     */
    public func getReferenceCount() -> Int {
        return self.referenceCount
    }

    /**
     Getter for active.

     - Returns:  Bool     */
    public func getActive() -> Bool {
        return self.active
    }
}
