/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductVariant data model.
public class ProductVariant : Model {

    /// Model field product_id.
    var productId : Int
    /// Model field variant_id.
    var variantId : Int
    /// Model field parts.
    var parts : [ProductVariantPart]

    /// Model field dimensions.
    var dimensions : [ProductVariantDimension]

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case variantId = "variant_id"
        case parts
        case dimensions
    }

    /**
     ProductVariant Constructor.
     */
    public override init() {
        self.productId = 0
        self.variantId = 0
        self.parts = []
        self.dimensions = []

        super.init()
    }

    /**
     ProductVariant Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.variantId = try container.decodeIfPresent(Int.self, forKey: .variantId) ?? 0
        self.parts = try container.decodeIfPresent([ProductVariantPart].self, forKey: .parts) ?? []
        self.dimensions = try container.decodeIfPresent([ProductVariantDimension].self, forKey: .dimensions) ?? []

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

        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.variantId, forKey: .variantId)
        try container.encodeIfPresent(self.parts, forKey: .parts)
        try container.encodeIfPresent(self.dimensions, forKey: .dimensions)

        try super.encode(to: encoder)
    }

    /**
     Getter for product_id.

     - Returns:  Int

     */
    public func getProductId() -> Int {
        return self.productId
    }

    /**
     Getter for variant_id.

     - Returns:  Int

     */
    public func getVariantId() -> Int {
        return self.variantId
    }

    /**
     Getter for parts.

     - Returns:  [ProductVariantPart]
     */
    public func getParts() -> [ProductVariantPart] {
        return self.parts
    }

    /**
     Getter for dimensions.

     - Returns:  [ProductVariantDimension]
     */
    public func getDimensions() -> [ProductVariantDimension] {
        return self.dimensions
    }
}
