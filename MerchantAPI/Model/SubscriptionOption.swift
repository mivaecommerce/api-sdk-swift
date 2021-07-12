/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// SubscriptionOption data model.
public class SubscriptionOption : Model {

    /// Model field subscrp_id.
    var subscriptionId : Int
    /// Model field templ_code.
    var templateCode : String
    /// Model field attr_code.
    var attributeCode : String
    /// Model field value.
    var value : String
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case subscriptionId = "subscrp_id"
        case templateCode = "templ_code"
        case attributeCode = "attr_code"
        case value
    }

    /**
     SubscriptionOption Constructor.
     */
    public override init() {
        self.subscriptionId = 0
        self.templateCode = ""
        self.attributeCode = ""
        self.value = ""

        super.init()
    }

    /**
     SubscriptionOption Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.subscriptionId = try container.decodeIfPresent(Int.self, forKey: .subscriptionId) ?? 0
        self.templateCode = try container.decodeIfPresent(String.self, forKey: .templateCode) ?? ""
        self.attributeCode = try container.decodeIfPresent(String.self, forKey: .attributeCode) ?? ""
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

        try container.encodeIfPresent(self.subscriptionId, forKey: .subscriptionId)
        try container.encodeIfPresent(self.templateCode, forKey: .templateCode)
        try container.encodeIfPresent(self.attributeCode, forKey: .attributeCode)
        try container.encodeIfPresent(self.value, forKey: .value)

        try super.encode(to: encoder)
    }

    /**
     Getter for subscrp_id.

     - Returns:  Int

     */
    public func getSubscriptionId() -> Int {
        return self.subscriptionId
    }

    /**
     Getter for templ_code.

     - Returns:  String

     */
    public func getTemplateCode() -> String {
        return self.templateCode
    }

    /**
     Getter for attr_code.

     - Returns:  String

     */
    public func getAttributeCode() -> String {
        return self.attributeCode
    }

    /**
     Getter for value.

     - Returns:  String

     */
    public func getValue() -> String {
        return self.value
    }
}
