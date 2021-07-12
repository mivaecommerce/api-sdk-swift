/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// PropertyVersion data model.
public class PropertyVersion : Model {

    /// Model field id.
    var id : Int
    /// Model field prop_id.
    var propertyId : Int
    /// Model field version_id.
    var versionId : Int
    /// Model field type.
    var type : String
    /// Model field code.
    var code : String
    /// Model field product_id.
    var productId : Int
    /// Model field cat_id.
    var categoryId : Int
    /// Model field version_user_id.
    var versionUserId : Int
    /// Model field version_user_name.
    var versionUserName : String
    /// Model field version_user_icon.
    var versionUserIcon : String
    /// Model field source_user_id.
    var sourceUserId : Int
    /// Model field source_user_name.
    var sourceUserName : String
    /// Model field source_user_icon.
    var sourceUserIcon : String
    /// Model field templ_id.
    var templateId : Int
    /// Model field settings
    var settings : TemplateVersionSettings

    /// Model field product
    var product : Product

    /// Model field category
    var category : Category

    /// Model field source.
    var source : String
    /// Model field sync.
    var sync : Bool
    /// Model field source_notes.
    var sourceNotes : String
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case propertyId = "prop_id"
        case versionId = "version_id"
        case type
        case code
        case productId = "product_id"
        case categoryId = "cat_id"
        case versionUserId = "version_user_id"
        case versionUserName = "version_user_name"
        case versionUserIcon = "version_user_icon"
        case sourceUserId = "source_user_id"
        case sourceUserName = "source_user_name"
        case sourceUserIcon = "source_user_icon"
        case templateId = "templ_id"
        case settings
        case product
        case category
        case source
        case sync
        case sourceNotes = "source_notes"
    }

    /**
     PropertyVersion Constructor.
     */
    public override init() {
        self.id = 0
        self.propertyId = 0
        self.versionId = 0
        self.type = ""
        self.code = ""
        self.productId = 0
        self.categoryId = 0
        self.versionUserId = 0
        self.versionUserName = ""
        self.versionUserIcon = ""
        self.sourceUserId = 0
        self.sourceUserName = ""
        self.sourceUserIcon = ""
        self.templateId = 0
        self.settings = TemplateVersionSettings()
        self.product = Product()
        self.category = Category()
        self.source = ""
        self.sync = false
        self.sourceNotes = ""

        super.init()
    }

    /**
     PropertyVersion Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.propertyId = try container.decodeIfPresent(Int.self, forKey: .propertyId) ?? 0
        self.versionId = try container.decodeIfPresent(Int.self, forKey: .versionId) ?? 0
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId) ?? 0
        self.versionUserId = try container.decodeIfPresent(Int.self, forKey: .versionUserId) ?? 0
        self.versionUserName = try container.decodeIfPresent(String.self, forKey: .versionUserName) ?? ""
        self.versionUserIcon = try container.decodeIfPresent(String.self, forKey: .versionUserIcon) ?? ""
        self.sourceUserId = try container.decodeIfPresent(Int.self, forKey: .sourceUserId) ?? 0
        self.sourceUserName = try container.decodeIfPresent(String.self, forKey: .sourceUserName) ?? ""
        self.sourceUserIcon = try container.decodeIfPresent(String.self, forKey: .sourceUserIcon) ?? ""
        self.templateId = try container.decodeIfPresent(Int.self, forKey: .templateId) ?? 0
        self.settings = try container.decodeIfPresent(TemplateVersionSettings.self, forKey: .settings) ?? TemplateVersionSettings()
        self.product = try container.decodeIfPresent(Product.self, forKey: .product) ?? Product()
        self.category = try container.decodeIfPresent(Category.self, forKey: .category) ?? Category()
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
        self.sync = try container.decodeIfPresent(Bool.self, forKey: .sync) ?? false
        self.sourceNotes = try container.decodeIfPresent(String.self, forKey: .sourceNotes) ?? ""

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
        try container.encodeIfPresent(self.propertyId, forKey: .propertyId)
        try container.encodeIfPresent(self.versionId, forKey: .versionId)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.categoryId, forKey: .categoryId)
        try container.encodeIfPresent(self.versionUserId, forKey: .versionUserId)
        try container.encodeIfPresent(self.versionUserName, forKey: .versionUserName)
        try container.encodeIfPresent(self.versionUserIcon, forKey: .versionUserIcon)
        try container.encodeIfPresent(self.sourceUserId, forKey: .sourceUserId)
        try container.encodeIfPresent(self.sourceUserName, forKey: .sourceUserName)
        try container.encodeIfPresent(self.sourceUserIcon, forKey: .sourceUserIcon)
        try container.encodeIfPresent(self.templateId, forKey: .templateId)
        try container.encodeIfPresent(self.settings, forKey: .settings)
        try container.encodeIfPresent(self.product, forKey: .product)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.sync, forKey: .sync)
        try container.encodeIfPresent(self.sourceNotes, forKey: .sourceNotes)

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
     Getter for prop_id.

     - Returns:  Int

     */
    public func getPropertyId() -> Int {
        return self.propertyId
    }

    /**
     Getter for version_id.

     - Returns:  Int

     */
    public func getVersionId() -> Int {
        return self.versionId
    }

    /**
     Getter for type.

     - Returns:  String

     */
    public func getType() -> String {
        return self.type
    }

    /**
     Getter for code.

     - Returns:  String

     */
    public func getCode() -> String {
        return self.code
    }

    /**
     Getter for product_id.

     - Returns:  Int

     */
    public func getProductId() -> Int {
        return self.productId
    }

    /**
     Getter for cat_id.

     - Returns:  Int

     */
    public func getCategoryId() -> Int {
        return self.categoryId
    }

    /**
     Getter for version_user_id.

     - Returns:  Int

     */
    public func getVersionUserId() -> Int {
        return self.versionUserId
    }

    /**
     Getter for version_user_name.

     - Returns:  String

     */
    public func getVersionUserName() -> String {
        return self.versionUserName
    }

    /**
     Getter for version_user_icon.

     - Returns:  String

     */
    public func getVersionUserIcon() -> String {
        return self.versionUserIcon
    }

    /**
     Getter for source_user_id.

     - Returns:  Int

     */
    public func getSourceUserId() -> Int {
        return self.sourceUserId
    }

    /**
     Getter for source_user_name.

     - Returns:  String

     */
    public func getSourceUserName() -> String {
        return self.sourceUserName
    }

    /**
     Getter for source_user_icon.

     - Returns:  String

     */
    public func getSourceUserIcon() -> String {
        return self.sourceUserIcon
    }

    /**
     Getter for templ_id.

     - Returns:  Int

     */
    public func getTemplateId() -> Int {
        return self.templateId
    }

    /**
     Getter for settings.

     - Returns:  TemplateVersionSettings
     */
    public func getSettings() -> TemplateVersionSettings {
        return self.settings
    }

    /**
     Getter for product.

     - Returns:  Product
     */
    public func getProduct() -> Product {
        return self.product
    }

    /**
     Getter for category.

     - Returns:  Category
     */
    public func getCategory() -> Category {
        return self.category
    }

    /**
     Getter for source.

     - Returns:  String

     */
    public func getSource() -> String {
        return self.source
    }

    /**
     Getter for sync.

     - Returns:  Bool     */
    public func getSync() -> Bool {
        return self.sync
    }

    /**
     Getter for source_notes.

     - Returns:  String

     */
    public func getSourceNotes() -> String {
        return self.sourceNotes
    }
}
