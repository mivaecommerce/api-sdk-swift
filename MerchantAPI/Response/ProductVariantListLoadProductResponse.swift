/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: ProductVariantListLoadProductResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for ProductVariantList_Load_Product.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/productvariantlist_load_product
 */
public class ProductVariantListLoadProductResponse : Response {

    /// Holds array of ProductVariant returned by the response
    public var data : [ProductVariant] = []

    /// Named computed property for data
    public var productVariants : [ProductVariant] {
        get {
            return self.data
        }
    }

    /**
     Getter for productVariants.

     - Returns: [ProductVariant]
     */
    public func getProductVariants() -> [ProductVariant] {
        return self.productVariants
    }
    
    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.data = try container.decodeIfPresent([ProductVariant].self, forKey: .data) ?? []
        try super.init(from : decoder)
    }
}