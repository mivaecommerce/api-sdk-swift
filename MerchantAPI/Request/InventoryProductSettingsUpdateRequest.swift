/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/**
 Handles API Request InventoryProductSettings_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/inventoryproductsettings_update
 */
public class InventoryProductSettingsUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "InventoryProductSettings_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Product_ID.
    var productId : Optional<Int> = nil

    /// Request field Product_Code.
    var productCode : Optional<String> = nil

    /// Request field Edit_Product.
    var editProduct : Optional<String> = nil

    /// Request field TrackLowStockLevel.
    var trackLowStockLevel : Optional<String> = nil

    /// Request field TrackOutOfStockLevel.
    var trackOutOfStockLevel : Optional<String> = nil

    /// Request field HideOutOfStockProducts.
    var hideOutOfStockProducts : Optional<String> = nil

    /// Request field LowStockLevel.
    var lowStockLevel : Optional<Int> = nil

    /// Request field OutOfStockLevel.
    var outOfStockLevel : Optional<Int> = nil

    /// Request field TrackProduct.
    var trackProduct : Optional<Bool> = nil

    /// Request field InStockMessageShort.
    var inStockMessageShort : Optional<String> = nil

    /// Request field InStockMessageLong.
    var inStockMessageLong : Optional<String> = nil

    /// Request field LowStockMessageShort.
    var lowStockMessageShort : Optional<String> = nil

    /// Request field LowStockMessageLong.
    var lowStockMessageLong : Optional<String> = nil

    /// Request field OutOfStockMessageShort.
    var outOfStockMessageShort : Optional<String> = nil

    /// Request field OutOfStockMessageLong.
    var outOfStockMessageLong : Optional<String> = nil

    /// Request field LimitedStockMessage.
    var limitedStockMessage : Optional<String> = nil

    /// Request field AdjustStockBy.
    var adjustStockBy : Optional<Int> = nil

    /// Request field CurrentStock.
    var currentStock : Optional<Int> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case productCode = "Product_Code"
        case editProduct = "Edit_Product"
        case trackLowStockLevel = "TrackLowStockLevel"
        case trackOutOfStockLevel = "TrackOutOfStockLevel"
        case hideOutOfStockProducts = "HideOutOfStockProducts"
        case lowStockLevel = "LowStockLevel"
        case outOfStockLevel = "OutOfStockLevel"
        case trackProduct = "TrackProduct"
        case inStockMessageShort = "InStockMessageShort"
        case inStockMessageLong = "InStockMessageLong"
        case lowStockMessageShort = "LowStockMessageShort"
        case lowStockMessageLong = "LowStockMessageLong"
        case outOfStockMessageShort = "OutOfStockMessageShort"
        case outOfStockMessageLong = "OutOfStockMessageLong"
        case limitedStockMessage = "LimitedStockMessage"
        case adjustStockBy = "AdjustStockBy"
        case currentStock = "CurrentStock"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - product: An optional Product instance.
     */
    public init(client: Optional<BaseClient> = nil, product: Optional<Product> = nil) {
        super.init(client: client)
        if let product = product {
            if product.id > 0 {
                self.productId = product.id
            } else if product.code.count > 0 {
                self.editProduct = product.code
            }
        }
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encode: A Encoder instance to encode to.
     - Throws: Error when unable to encode the request data.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if self.productId != nil {
            try container.encodeIfPresent(self.productId, forKey: .productId)
        } else if self.productCode != nil {
            try container.encode(self.productCode, forKey: .productCode)
        } else if self.editProduct != nil {
            try container.encode(self.editProduct, forKey: .editProduct)
        }

        try container.encodeIfPresent(self.trackLowStockLevel, forKey: .trackLowStockLevel)
        try container.encodeIfPresent(self.trackOutOfStockLevel, forKey: .trackOutOfStockLevel)
        try container.encodeIfPresent(self.hideOutOfStockProducts, forKey: .hideOutOfStockProducts)
        try container.encodeIfPresent(self.lowStockLevel, forKey: .lowStockLevel)
        try container.encodeIfPresent(self.outOfStockLevel, forKey: .outOfStockLevel)
        try container.encodeIfPresent(self.trackProduct, forKey: .trackProduct)
        try container.encodeIfPresent(self.inStockMessageShort, forKey: .inStockMessageShort)
        try container.encodeIfPresent(self.inStockMessageLong, forKey: .inStockMessageLong)
        try container.encodeIfPresent(self.lowStockMessageShort, forKey: .lowStockMessageShort)
        try container.encodeIfPresent(self.lowStockMessageLong, forKey: .lowStockMessageLong)
        try container.encodeIfPresent(self.outOfStockMessageShort, forKey: .outOfStockMessageShort)
        try container.encodeIfPresent(self.outOfStockMessageLong, forKey: .outOfStockMessageLong)
        try container.encodeIfPresent(self.limitedStockMessage, forKey: .limitedStockMessage)
        try container.encodeIfPresent(self.adjustStockBy, forKey: .adjustStockBy)
        try container.encodeIfPresent(self.currentStock, forKey: .currentStock)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (InventoryProductSettingsUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (InventoryProductSettingsUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? InventoryProductSettingsUpdateResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - httpResponse: The underlying HTTP response object
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> InventoryProductSettingsUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(InventoryProductSettingsUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return InventoryProductSettingsUpdateResponse.self
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
     Getter for TrackLowStockLevel.

     - Returns:  Optional<String>
     */
    public func getTrackLowStockLevel() -> Optional<String> {
        return self.trackLowStockLevel
    }

    /**
     Getter for TrackOutOfStockLevel.

     - Returns:  Optional<String>
     */
    public func getTrackOutOfStockLevel() -> Optional<String> {
        return self.trackOutOfStockLevel
    }

    /**
     Getter for HideOutOfStockProducts.

     - Returns:  Optional<String>
     */
    public func getHideOutOfStockProducts() -> Optional<String> {
        return self.hideOutOfStockProducts
    }

    /**
     Getter for LowStockLevel.

     - Returns:  Optional<Int>
     */
    public func getLowStockLevel() -> Optional<Int> {
        return self.lowStockLevel
    }

    /**
     Getter for OutOfStockLevel.

     - Returns:  Optional<Int>
     */
    public func getOutOfStockLevel() -> Optional<Int> {
        return self.outOfStockLevel
    }

    /**
     Getter for TrackProduct.

     - Returns:  Optional<Bool>
     */
    public func getTrackProduct() -> Optional<Bool> {
        return self.trackProduct
    }

    /**
     Getter for InStockMessageShort.

     - Returns:  Optional<String>
     */
    public func getInStockMessageShort() -> Optional<String> {
        return self.inStockMessageShort
    }

    /**
     Getter for InStockMessageLong.

     - Returns:  Optional<String>
     */
    public func getInStockMessageLong() -> Optional<String> {
        return self.inStockMessageLong
    }

    /**
     Getter for LowStockMessageShort.

     - Returns:  Optional<String>
     */
    public func getLowStockMessageShort() -> Optional<String> {
        return self.lowStockMessageShort
    }

    /**
     Getter for LowStockMessageLong.

     - Returns:  Optional<String>
     */
    public func getLowStockMessageLong() -> Optional<String> {
        return self.lowStockMessageLong
    }

    /**
     Getter for OutOfStockMessageShort.

     - Returns:  Optional<String>
     */
    public func getOutOfStockMessageShort() -> Optional<String> {
        return self.outOfStockMessageShort
    }

    /**
     Getter for OutOfStockMessageLong.

     - Returns:  Optional<String>
     */
    public func getOutOfStockMessageLong() -> Optional<String> {
        return self.outOfStockMessageLong
    }

    /**
     Getter for LimitedStockMessage.

     - Returns:  Optional<String>
     */
    public func getLimitedStockMessage() -> Optional<String> {
        return self.limitedStockMessage
    }

    /**
     Getter for AdjustStockBy.

     - Returns:  Optional<Int>
     */
    public func getAdjustStockBy() -> Optional<Int> {
        return self.adjustStockBy
    }

    /**
     Getter for CurrentStock.

     - Returns:  Optional<Int>
     */
    public func getCurrentStock() -> Optional<Int> {
        return self.currentStock
    }

    /**
     Setter for Product_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductId(_ value: Optional<Int>) -> Self {
        self.productId = value
        return self
    }

    /**
     Setter for Product_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductCode(_ value: Optional<String>) -> Self {
        self.productCode = value
        return self
    }

    /**
     Setter for Edit_Product.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditProduct(_ value: Optional<String>) -> Self {
        self.editProduct = value
        return self
    }

    /**
     Setter for TrackLowStockLevel.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setTrackLowStockLevel(_ value: Optional<String>) -> Self {
        self.trackLowStockLevel = value
        return self
    }

    /**
     Setter for TrackOutOfStockLevel.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setTrackOutOfStockLevel(_ value: Optional<String>) -> Self {
        self.trackOutOfStockLevel = value
        return self
    }

    /**
     Setter for HideOutOfStockProducts.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setHideOutOfStockProducts(_ value: Optional<String>) -> Self {
        self.hideOutOfStockProducts = value
        return self
    }

    /**
     Setter for LowStockLevel.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setLowStockLevel(_ value: Optional<Int>) -> Self {
        self.lowStockLevel = value
        return self
    }

    /**
     Setter for OutOfStockLevel.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOutOfStockLevel(_ value: Optional<Int>) -> Self {
        self.outOfStockLevel = value
        return self
    }

    /**
     Setter for TrackProduct.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setTrackProduct(_ value: Optional<Bool>) -> Self {
        self.trackProduct = value
        return self
    }

    /**
     Setter for InStockMessageShort.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setInStockMessageShort(_ value: Optional<String>) -> Self {
        self.inStockMessageShort = value
        return self
    }

    /**
     Setter for InStockMessageLong.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setInStockMessageLong(_ value: Optional<String>) -> Self {
        self.inStockMessageLong = value
        return self
    }

    /**
     Setter for LowStockMessageShort.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setLowStockMessageShort(_ value: Optional<String>) -> Self {
        self.lowStockMessageShort = value
        return self
    }

    /**
     Setter for LowStockMessageLong.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setLowStockMessageLong(_ value: Optional<String>) -> Self {
        self.lowStockMessageLong = value
        return self
    }

    /**
     Setter for OutOfStockMessageShort.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setOutOfStockMessageShort(_ value: Optional<String>) -> Self {
        self.outOfStockMessageShort = value
        return self
    }

    /**
     Setter for OutOfStockMessageLong.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setOutOfStockMessageLong(_ value: Optional<String>) -> Self {
        self.outOfStockMessageLong = value
        return self
    }

    /**
     Setter for LimitedStockMessage.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setLimitedStockMessage(_ value: Optional<String>) -> Self {
        self.limitedStockMessage = value
        return self
    }

    /**
     Setter for AdjustStockBy.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAdjustStockBy(_ value: Optional<Int>) -> Self {
        self.adjustStockBy = value
        return self
    }

    /**
     Setter for CurrentStock.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCurrentStock(_ value: Optional<Int>) -> Self {
        self.currentStock = value
        return self
    }
}
