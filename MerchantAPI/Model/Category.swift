/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Category data model.
public class Category : Model {

    /// Model field id.
    var id : Int

    /// Model field parent_id.
    var parentId : Int

    /// Model field agrpcount.
    var availabilityGroupCount : Int

    /// Model field depth.
    var depth : Int

    /// Model field disp_order.
    var displayOrder : Int

    /// Model field page_id.
    var pageId : Int

    /// Model field code.
    var code : String

    /// Model field name.
    var name : String

    /// Model field page_title.
    var pageTitle : String

    /// Model field active.
    var active : Bool

    /// Model field dt_created.
    var dateTimeCreated : Date

    /// Model field dt_updated.
    var dateTimeUpdated : Date

    /// Model field page_code.
    var pageCode : String

    /// Model field parent_category.
    var parentCategory : String

    /// Model field uris.
    var uris : [Uri]

    /// Model field url.
    var url : String

    /// Model field CustomField_Values
    var customFieldValues : CustomFieldValues

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case parentId = "parent_id"
        case availabilityGroupCount = "agrpcount"
        case depth
        case displayOrder = "disp_order"
        case pageId = "page_id"
        case code
        case name
        case pageTitle = "page_title"
        case active
        case dateTimeCreated = "dt_created"
        case dateTimeUpdated = "dt_updated"
        case pageCode = "page_code"
        case parentCategory = "parent_category"
        case uris
        case url
        case customFieldValues = "CustomField_Values"
    }

    /**
     Category Constructor.
     */
    public override init() {
        self.id = 0
        self.parentId = 0
        self.availabilityGroupCount = 0
        self.depth = 0
        self.displayOrder = 0
        self.pageId = 0
        self.code = ""
        self.name = ""
        self.pageTitle = ""
        self.active = false
        self.dateTimeCreated = Date(timeIntervalSince1970: 0)
        self.dateTimeUpdated = Date(timeIntervalSince1970: 0)
        self.pageCode = ""
        self.parentCategory = ""
        self.uris = []
        self.url = ""
        self.customFieldValues = CustomFieldValues()

        super.init()
    }

    /**
     Category Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.parentId = try container.decodeIfPresent(Int.self, forKey: .parentId) ?? 0
        self.availabilityGroupCount = try container.decodeIfPresent(Int.self, forKey: .availabilityGroupCount) ?? 0
        self.depth = try container.decodeIfPresent(Int.self, forKey: .depth) ?? 0
        self.displayOrder = try container.decodeIfPresent(Int.self, forKey: .displayOrder) ?? 0
        self.pageId = try container.decodeIfPresent(Int.self, forKey: .pageId) ?? 0
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.pageTitle = try container.decodeIfPresent(String.self, forKey: .pageTitle) ?? ""
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false
        self.dateTimeCreated = try container.decodeIfPresent(DateTime.self, forKey: .dateTimeCreated)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.dateTimeUpdated = try container.decodeIfPresent(DateTime.self, forKey: .dateTimeUpdated)?.timeT ?? Date(timeIntervalSince1970: 0)
        self.pageCode = try container.decodeIfPresent(String.self, forKey: .pageCode) ?? ""
        self.parentCategory = try container.decodeIfPresent(String.self, forKey: .parentCategory) ?? ""
        self.uris = try container.decodeIfPresent([Uri].self, forKey: .uris) ?? []
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.customFieldValues = try container.decodeIfPresent(CustomFieldValues.self, forKey: .customFieldValues) ?? CustomFieldValues()

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
        try container.encodeIfPresent(self.parentId, forKey: .parentId)
        try container.encodeIfPresent(self.availabilityGroupCount, forKey: .availabilityGroupCount)
        try container.encodeIfPresent(self.depth, forKey: .depth)
        try container.encodeIfPresent(self.displayOrder, forKey: .displayOrder)
        try container.encodeIfPresent(self.pageId, forKey: .pageId)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.pageTitle, forKey: .pageTitle)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(Int64(self.dateTimeCreated.timeIntervalSince1970), forKey: .dateTimeCreated)
        try container.encodeIfPresent(Int64(self.dateTimeUpdated.timeIntervalSince1970), forKey: .dateTimeUpdated)
        try container.encodeIfPresent(self.pageCode, forKey: .pageCode)
        try container.encodeIfPresent(self.parentCategory, forKey: .parentCategory)
        try container.encodeIfPresent(self.uris, forKey: .uris)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)

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
     Getter for parent_id.

     - Returns:  Int

     */
    public func getParentId() -> Int {
        return self.parentId
    }

    /**
     Getter for agrpcount.

     - Returns:  Int

     */
    public func getAvailabilityGroupCount() -> Int {
        return self.availabilityGroupCount
    }

    /**
     Getter for depth.

     - Returns:  Int

     */
    public func getDepth() -> Int {
        return self.depth
    }

    /**
     Getter for disp_order.

     - Returns:  Int

     */
    public func getDisplayOrder() -> Int {
        return self.displayOrder
    }

    /**
     Getter for page_id.

     - Returns:  Int

     */
    public func getPageId() -> Int {
        return self.pageId
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
     Getter for page_title.

     - Returns:  String

     */
    public func getPageTitle() -> String {
        return self.pageTitle
    }

    /**
     Getter for active.

     - Returns:  Bool     */
    public func getActive() -> Bool {
        return self.active
    }

    /**
     Getter for dt_created.

     - Returns:  Date     */
    public func getDateTimeCreated() -> Date {
        return self.dateTimeCreated
    }

    /**
     Getter for dt_updated.

     - Returns:  Date     */
    public func getDateTimeUpdated() -> Date {
        return self.dateTimeUpdated
    }

    /**
     Getter for page_code.

     - Returns:  String

     */
    public func getPageCode() -> String {
        return self.pageCode
    }

    /**
     Getter for parent_category.

     - Returns:  String

     */
    public func getParentCategory() -> String {
        return self.parentCategory
    }

    /**
     Getter for uris.

     - Returns:  [Uri]
     */
    public func getUris() -> [Uri] {
        return self.uris
    }

    /**
     Getter for url.

     - Returns:  String

     */
    public func getUrl() -> String {
        return self.url
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
    }
}
