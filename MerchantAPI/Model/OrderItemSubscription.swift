/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderItemSubscription data model.
public class OrderItemSubscription : BaseSubscription {

    /// Model field method.
    var method : String

    /// Model field productsubscriptionterm
    var productSubscriptionTerm : ProductSubscriptionTerm

    /// Model field options.
    var options : [SubscriptionOption]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case method
        case productSubscriptionTerm = "productsubscriptionterm"
        case options
    }

    /**
     OrderItemSubscription Constructor.
     */
    public override init() {
        self.method = ""
        self.productSubscriptionTerm = ProductSubscriptionTerm()
        self.options = []

        super.init()
    }

    /**
     OrderItemSubscription Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.method = try container.decodeIfPresent(String.self, forKey: .method) ?? ""
        self.productSubscriptionTerm = try container.decodeIfPresent(ProductSubscriptionTerm.self, forKey: .productSubscriptionTerm) ?? ProductSubscriptionTerm()
        self.options = try container.decodeIfPresent([SubscriptionOption].self, forKey: .options) ?? []

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

        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.productSubscriptionTerm, forKey: .productSubscriptionTerm)
        try container.encodeIfPresent(self.options, forKey: .options)

        try super.encode(to: encoder)
    }

    /**
     Getter for method.

     - Returns:  String

     */
    public func getMethod() -> String {
        return self.method
    }

    /**
     Getter for productsubscriptionterm.

     - Returns:  ProductSubscriptionTerm
     */
    public func getProductSubscriptionTerm() -> ProductSubscriptionTerm {
        return self.productSubscriptionTerm
    }

    /**
     Getter for options.

     - Returns:  [SubscriptionOption]
     */
    public func getOptions() -> [SubscriptionOption] {
        return self.options
    }
}
