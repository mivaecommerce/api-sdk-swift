/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// ProductImageData data model.
public class ProductImageData : Model {

    /// Model field id.
    var id : Int
    /// Model field product_id.
    var productId : Int
    /// Model field image_id.
    var imageId : Int
    /// Model field type_id.
    var typeId : Int
    /// Model field code.
    var code : String
    /// Model field type_desc.
    var typeDescription : String
    /// Model field image.
    var image : String
    /// Model field width.
    var width : Int
    /// Model field height.
    var height : Int
    /// Model field disp_order.
    var displayOrder : Int
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case productId = "product_id"
        case imageId = "image_id"
        case typeId = "type_id"
        case code
        case typeDescription = "type_desc"
        case image
        case width
        case height
        case displayOrder = "disp_order"
    }

    /**
     ProductImageData Constructor.
     */
    public override init() {
        self.id = 0
        self.productId = 0
        self.imageId = 0
        self.typeId = 0
        self.code = ""
        self.typeDescription = ""
        self.image = ""
        self.width = 0
        self.height = 0
        self.displayOrder = 0

        super.init()
    }

    /**
     ProductImageData Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.imageId = try container.decodeIfPresent(Int.self, forKey: .imageId) ?? 0
        self.typeId = try container.decodeIfPresent(Int.self, forKey: .typeId) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.typeDescription = try container.decodeIfPresent(String.self, forKey: .typeDescription) ?? ""
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.width = try container.decodeIfPresent(Int.self, forKey: .width) ?? 0
        self.height = try container.decodeIfPresent(Int.self, forKey: .height) ?? 0
        self.displayOrder = try container.decodeIfPresent(Int.self, forKey: .displayOrder) ?? 0

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
        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.imageId, forKey: .imageId)
        try container.encodeIfPresent(self.typeId, forKey: .typeId)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.typeDescription, forKey: .typeDescription)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.width, forKey: .width)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.displayOrder, forKey: .displayOrder)

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
     Getter for product_id.

     - Returns:  Int

     */
    public func getProductId() -> Int {
        return self.productId
    }

    /**
     Getter for image_id.

     - Returns:  Int

     */
    public func getImageId() -> Int {
        return self.imageId
    }

    /**
     Getter for type_id.

     - Returns:  Int

     */
    public func getTypeId() -> Int {
        return self.typeId
    }

    /**
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for type_desc.

     - Returns:  String

     */
    public func getTypeDescription() -> String {
        return self.typeDescription
    }

    /**
     Getter for image.

     - Returns:  String

     */
    public func getImage() -> String {
        return self.image
    }

    /**
     Getter for width.

     - Returns:  Int

     */
    public func getWidth() -> Int {
        return self.width
    }

    /**
     Getter for height.

     - Returns:  Int

     */
    public func getHeight() -> Int {
        return self.height
    }

    /**
     Getter for disp_order.

     - Returns:  Int

     */
    public func getDisplayOrder() -> Int {
        return self.displayOrder
    }
}
