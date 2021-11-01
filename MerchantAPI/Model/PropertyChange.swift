/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// PropertyChange data model.
public class PropertyChange : Model {

    /// Model field Property_ID.
    var propertyId : Optional<Int>
    /// Model field Property_Type.
    var propertyType : Optional<String>
    /// Model field Property_Code.
    var propertyCode : Optional<String>
    /// Model field Product_ID.
    var productId : Optional<Int>
    /// Model field Product_Code.
    var productCode : Optional<String>
    /// Model field Edit_Product.
    var editProduct : Optional<String>
    /// Model field Category_ID.
    var categoryId : Optional<Int>
    /// Model field Category_Code.
    var categoryCode : Optional<String>
    /// Model field Edit_Category.
    var editCategory : Optional<String>
    /// Model field Source.
    var source : Optional<String>
    /// Model field Settings
    var settings : TemplateVersionSettings

    /// Model field Notes.
    var notes : Optional<String>
    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case propertyId = "Property_ID"
        case propertyType = "Property_Type"
        case propertyCode = "Property_Code"
        case productId = "Product_ID"
        case productCode = "Product_Code"
        case editProduct = "Edit_Product"
        case categoryId = "Category_ID"
        case categoryCode = "Category_Code"
        case editCategory = "Edit_Category"
        case source = "Source"
        case settings = "Settings"
        case notes = "Notes"
    }

    /**
     PropertyChange Constructor.
     */
    public override init() {
        self.propertyId = nil
        self.propertyType = nil
        self.propertyCode = nil
        self.productId = nil
        self.productCode = nil
        self.editProduct = nil
        self.categoryId = nil
        self.categoryCode = nil
        self.editCategory = nil
        self.source = nil
        self.settings = TemplateVersionSettings()
        self.notes = nil

        super.init()
    }

    /**
     PropertyChange Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.propertyId = try container.decodeIfPresent(Int.self, forKey: .propertyId) ?? nil
        self.propertyType = try container.decodeIfPresent(String.self, forKey: .propertyType) ?? nil
        self.propertyCode = try container.decodeIfPresent(String.self, forKey: .propertyCode) ?? nil
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? nil
        self.productCode = try container.decodeIfPresent(String.self, forKey: .productCode) ?? nil
        self.editProduct = try container.decodeIfPresent(String.self, forKey: .editProduct) ?? nil
        self.categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId) ?? nil
        self.categoryCode = try container.decodeIfPresent(String.self, forKey: .categoryCode) ?? nil
        self.editCategory = try container.decodeIfPresent(String.self, forKey: .editCategory) ?? nil
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? nil
        self.settings = try container.decodeIfPresent(TemplateVersionSettings.self, forKey: .settings) ?? TemplateVersionSettings()
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

        try container.encodeIfPresent(self.propertyId, forKey: .propertyId)
        try container.encodeIfPresent(self.propertyType, forKey: .propertyType)
        try container.encodeIfPresent(self.propertyCode, forKey: .propertyCode)
        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.productCode, forKey: .productCode)
        try container.encodeIfPresent(self.editProduct, forKey: .editProduct)
        try container.encodeIfPresent(self.categoryId, forKey: .categoryId)
        try container.encodeIfPresent(self.categoryCode, forKey: .categoryCode)
        try container.encodeIfPresent(self.editCategory, forKey: .editCategory)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.settings, forKey: .settings)
        try container.encodeIfPresent(self.notes, forKey: .notes)

        try super.encode(to: encoder)
    }

    /**
     Getter for Property_ID.

     - Returns:  Optional<Int>

     */
    public func getPropertyId() -> Optional<Int> {
        return self.propertyId
    }

    /**
     Getter for Property_Type.

     - Returns:  Optional<String>

     */
    public func getPropertyType() -> Optional<String> {
        return self.propertyType
    }

    /**
     Getter for Property_Code.

     - Returns:  Optional<String>

     */
    public func getPropertyCode() -> Optional<String> {
        return self.propertyCode
    }

    /**
     Getter for Product_ID.

     - Returns:  Optional<Int>

     */
    public func getProductId() -> Optional<Int> {
        return self.productId
    }

    /**
     Getter for Product_Code.

     - Returns:  Optional<String>

     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
    }

    /**
     Getter for Edit_Product.

     - Returns:  Optional<String>

     */
    public func getEditProduct() -> Optional<String> {
        return self.editProduct
    }

    /**
     Getter for Category_ID.

     - Returns:  Optional<Int>

     */
    public func getCategoryId() -> Optional<Int> {
        return self.categoryId
    }

    /**
     Getter for Category_Code.

     - Returns:  Optional<String>

     */
    public func getCategoryCode() -> Optional<String> {
        return self.categoryCode
    }

    /**
     Getter for Edit_Category.

     - Returns:  Optional<String>

     */
    public func getEditCategory() -> Optional<String> {
        return self.editCategory
    }

    /**
     Getter for Source.

     - Returns:  Optional<String>

     */
    public func getSource() -> Optional<String> {
        return self.source
    }

    /**
     Getter for Settings.

     - Returns:  TemplateVersionSettings
     */
    public func getSettings() -> TemplateVersionSettings {
        return self.settings
    }

    /**
     Getter for Notes.

     - Returns:  Optional<String>

     */
    public func getNotes() -> Optional<String> {
        return self.notes
    }

    /**
     Setter for Property_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPropertyId(_ value: Int) -> Self {
        self.propertyId = value
        return self
    }

    /**
     Setter for Property_Type.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setPropertyType(_ value: String) -> Self {
        self.propertyType = value
        return self
    }

    /**
     Setter for Property_Code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setPropertyCode(_ value: String) -> Self {
        self.propertyCode = value
        return self
    }

    /**
     Setter for Product_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductId(_ value: Int) -> Self {
        self.productId = value
        return self
    }

    /**
     Setter for Product_Code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setProductCode(_ value: String) -> Self {
        self.productCode = value
        return self
    }

    /**
     Setter for Edit_Product.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setEditProduct(_ value: String) -> Self {
        self.editProduct = value
        return self
    }

    /**
     Setter for Category_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryId(_ value: Int) -> Self {
        self.categoryId = value
        return self
    }

    /**
     Setter for Category_Code.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setCategoryCode(_ value: String) -> Self {
        self.categoryCode = value
        return self
    }

    /**
     Setter for Edit_Category.

     - Parameters:
        - value: String
     - Returns:  Self
     */
    @discardableResult
    public func setEditCategory(_ value: String) -> Self {
        self.editCategory = value
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
}
