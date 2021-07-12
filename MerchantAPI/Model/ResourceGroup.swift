/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ResourceGroup data model.
public class ResourceGroup : Model {

    /// Model field id.
    var id : Int
    /// Model field code.
    var code : String
    /// Model field linkedcssresources.
    var linkedCSSResources : [CSSResource]

    /// Model field linkedjavascriptresources.
    var linkedJavaScriptResources : [JavaScriptResource]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case code
        case linkedCSSResources = "linkedcssresources"
        case linkedJavaScriptResources = "linkedjavascriptresources"
    }

    /**
     ResourceGroup Constructor.
     */
    public override init() {
        self.id = 0
        self.code = ""
        self.linkedCSSResources = []
        self.linkedJavaScriptResources = []

        super.init()
    }

    /**
     ResourceGroup Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.linkedCSSResources = try container.decodeIfPresent([CSSResource].self, forKey: .linkedCSSResources) ?? []
        self.linkedJavaScriptResources = try container.decodeIfPresent([JavaScriptResource].self, forKey: .linkedJavaScriptResources) ?? []

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
        try container.encodeIfPresent(self.linkedCSSResources, forKey: .linkedCSSResources)
        try container.encodeIfPresent(self.linkedJavaScriptResources, forKey: .linkedJavaScriptResources)

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
     Getter for linkedcssresources.

     - Returns:  [CSSResource]
     */
    public func getLinkedCSSResources() -> [CSSResource] {
        return self.linkedCSSResources
    }

    /**
     Getter for linkedjavascriptresources.

     - Returns:  [JavaScriptResource]
     */
    public func getLinkedJavaScriptResources() -> [JavaScriptResource] {
        return self.linkedJavaScriptResources
    }
}
