/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ResourceGroupChange data model.
public class ResourceGroupChange : Model {

    /// Model field ResourceGroup_ID.
    var resourceGroupId : Optional<Int>
    /// Model field ResourceGroup_Code.
    var resourceGroupCode : Optional<String>
    /// Model field LinkedCSSResources.
    var linkedCSSResources : [String]

    /// Model field LinkedJavaScriptResources.
    var linkedJavaScriptResources : [String]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case resourceGroupId = "ResourceGroup_ID"
        case resourceGroupCode = "ResourceGroup_Code"
        case linkedCSSResources = "LinkedCSSResources"
        case linkedJavaScriptResources = "LinkedJavaScriptResources"
    }

    /**
     ResourceGroupChange Constructor.
     */
    public override init() {
        self.resourceGroupId = nil
        self.resourceGroupCode = nil
        self.linkedCSSResources = []
        self.linkedJavaScriptResources = []

        super.init()
    }

    /**
     ResourceGroupChange Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.resourceGroupId = try container.decodeIfPresent(Int.self, forKey: .resourceGroupId) ?? nil
        self.resourceGroupCode = try container.decodeIfPresent(String.self, forKey: .resourceGroupCode) ?? nil
        self.linkedCSSResources = try container.decodeIfPresent([String].self, forKey: .linkedCSSResources) ?? []
        self.linkedJavaScriptResources = try container.decodeIfPresent([String].self, forKey: .linkedJavaScriptResources) ?? []

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

        try container.encodeIfPresent(self.resourceGroupId, forKey: .resourceGroupId)
        try container.encodeIfPresent(self.resourceGroupCode, forKey: .resourceGroupCode)

        try super.encode(to: encoder)
    }

    /**
     Getter for ResourceGroup_ID.

     - Returns:  Optional<Int>

     */
    public func getResourceGroupId() -> Optional<Int> {
        return self.resourceGroupId
    }

    /**
     Getter for ResourceGroup_Code.

     - Returns:  Optional<String>

     */
    public func getResourceGroupCode() -> Optional<String> {
        return self.resourceGroupCode
    }

    /**
     Getter for LinkedCSSResources.

     - Returns:  [String]
     */
    public func getLinkedCSSResources() -> [String] {
        return self.linkedCSSResources
    }

    /**
     Getter for LinkedJavaScriptResources.

     - Returns:  [String]
     */
    public func getLinkedJavaScriptResources() -> [String] {
        return self.linkedJavaScriptResources
    }

    /**
     Setter for ResourceGroup_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setResourceGroupId(_ value: Int) -> Self {
        self.resourceGroupId = value
        return self
    }

    /**
     Setter for ResourceGroup_Code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setResourceGroupCode(_ value: String) -> Self {
        self.resourceGroupCode = value
        return self
    }

    /**
     Setter for LinkedCSSResources.

     - Parameters:
        - value: [String]
     - Returns:  Self
     */
    @discardableResult
    public func setLinkedCSSResources(_ value: [String]) -> Self {
        self.linkedCSSResources = value
        return self
    }

    /**
     Setter for LinkedJavaScriptResources.

     - Parameters:
        - value: [String]
     - Returns:  Self
     */
    @discardableResult
    public func setLinkedJavaScriptResources(_ value: [String]) -> Self {
        self.linkedJavaScriptResources = value
        return self
    }
}
