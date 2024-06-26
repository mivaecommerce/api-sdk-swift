/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Uri data model.
public class Uri : Model {

    /// Enumeration DestinationType
    public enum DestinationType : String {
        case Screen = "screen"
        case Page = "page"
        case Category = "category"
        case Product = "product"
        case Feed = "feed"
    }

    /// Model field id.
    var id : Int

    /// Model field uri.
    var uri : String

    /// Model field store_id.
    var storeId : Int

    /// Model field screen.
    var screen : String

    /// Model field page_id.
    var pageId : Int

    /// Model field page_code.
    var pageCode : String

    /// Model field cat_id.
    var categoryId : Int

    /// Model field product_id.
    var productId : Int

    /// Model field feed_id.
    var feedId : Int

    /// Model field canonical.
    var canonical : Bool

    /// Model field status.
    var status : Int

    /// Model field store
    var store : UriDetail

    /// Model field product
    var product : UriDetail

    /// Model field category
    var category : UriDetail

    /// Model field page
    var page : UriDetail

    /// Model field feed
    var feed : UriDetail

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case uri
        case storeId = "store_id"
        case screen
        case pageId = "page_id"
        case pageCode = "page_code"
        case categoryId = "cat_id"
        case productId = "product_id"
        case feedId = "feed_id"
        case canonical
        case status
        case store
        case product
        case category
        case page
        case feed
    }

    /**
     Uri Constructor.
     */
    public override init() {
        self.id = 0
        self.uri = ""
        self.storeId = 0
        self.screen = ""
        self.pageId = 0
        self.pageCode = ""
        self.categoryId = 0
        self.productId = 0
        self.feedId = 0
        self.canonical = false
        self.status = 0
        self.store = UriDetail()
        self.product = UriDetail()
        self.category = UriDetail()
        self.page = UriDetail()
        self.feed = UriDetail()

        super.init()
    }

    /**
     Uri Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.uri = try container.decodeIfPresent(String.self, forKey: .uri) ?? ""
        self.storeId = try container.decodeIfPresent(Int.self, forKey: .storeId) ?? 0
        self.screen = try container.decodeIfPresent(String.self, forKey: .screen) ?? ""
        self.pageId = try container.decodeIfPresent(Int.self, forKey: .pageId) ?? 0
        self.pageCode = try container.decodeIfPresent(String.self, forKey: .pageCode) ?? ""
        self.categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId) ?? 0
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        self.feedId = try container.decodeIfPresent(Int.self, forKey: .feedId) ?? 0
        self.canonical = try container.decodeIfPresent(Bool.self, forKey: .canonical) ?? false
        self.status = try container.decodeIfPresent(Int.self, forKey: .status) ?? 0
        self.store = try container.decodeIfPresent(UriDetail.self, forKey: .store) ?? UriDetail()
        self.product = try container.decodeIfPresent(UriDetail.self, forKey: .product) ?? UriDetail()
        self.category = try container.decodeIfPresent(UriDetail.self, forKey: .category) ?? UriDetail()
        self.page = try container.decodeIfPresent(UriDetail.self, forKey: .page) ?? UriDetail()
        self.feed = try container.decodeIfPresent(UriDetail.self, forKey: .feed) ?? UriDetail()

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
        try container.encodeIfPresent(self.uri, forKey: .uri)
        try container.encodeIfPresent(self.storeId, forKey: .storeId)
        try container.encodeIfPresent(self.screen, forKey: .screen)
        try container.encodeIfPresent(self.pageId, forKey: .pageId)
        try container.encodeIfPresent(self.pageCode, forKey: .pageCode)
        try container.encodeIfPresent(self.categoryId, forKey: .categoryId)
        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.feedId, forKey: .feedId)
        try container.encodeIfPresent(self.canonical, forKey: .canonical)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.store, forKey: .store)
        try container.encodeIfPresent(self.product, forKey: .product)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.page, forKey: .page)
        try container.encodeIfPresent(self.feed, forKey: .feed)

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
     Getter for uri.

     - Returns:  String

     */
    public func getUri() -> String {
        return self.uri
    }

    /**
     Getter for store_id.

     - Returns:  Int

     */
    public func getStoreId() -> Int {
        return self.storeId
    }

    /**
     Getter for screen.

     - Returns:  String

     */
    public func getScreen() -> String {
        return self.screen
    }

    /**
     Getter for page_id.

     - Returns:  Int

     */
    public func getPageId() -> Int {
        return self.pageId
    }

    /**
     Getter for page_code.

     - Returns:  String

     */
    public func getPageCode() -> String {
        return self.pageCode
    }

    /**
     Getter for cat_id.

     - Returns:  Int

     */
    public func getCategoryId() -> Int {
        return self.categoryId
    }

    /**
     Getter for product_id.

     - Returns:  Int

     */
    public func getProductId() -> Int {
        return self.productId
    }

    /**
     Getter for feed_id.

     - Returns:  Int

     */
    public func getFeedId() -> Int {
        return self.feedId
    }

    /**
     Getter for canonical.

     - Returns:  Bool     */
    public func getCanonical() -> Bool {
        return self.canonical
    }

    /**
     Getter for status.

     - Returns:  Int

     */
    public func getStatus() -> Int {
        return self.status
    }

    /**
     Getter for store.

     - Returns:  UriDetail
     */
    public func getStore() -> UriDetail {
        return self.store
    }

    /**
     Getter for product.

     - Returns:  UriDetail
     */
    public func getProduct() -> UriDetail {
        return self.product
    }

    /**
     Getter for category.

     - Returns:  UriDetail
     */
    public func getCategory() -> UriDetail {
        return self.category
    }

    /**
     Getter for page.

     - Returns:  UriDetail
     */
    public func getPage() -> UriDetail {
        return self.page
    }

    /**
     Getter for feed.

     - Returns:  UriDetail
     */
    public func getFeed() -> UriDetail {
        return self.feed
    }
}
