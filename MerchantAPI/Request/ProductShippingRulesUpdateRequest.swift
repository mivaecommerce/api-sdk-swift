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
 Handles API Request ProductShippingRules_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/productshippingrules_update
 */
public class ProductShippingRulesUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductShippingRules_Update"
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

    /// Request field Edit_Product.
    var editProduct : Optional<String> = nil

    /// Request field Product_Code.
    var productCode : Optional<String> = nil

    /// Request field Product_SKU.
    var productSku : Optional<String> = nil

    /// Request field ShipsInOwnPackaging.
    var shipsInOwnPackaging : Optional<Bool> = nil

    /// Request field LimitShippingMethods.
    var limitShippingMethods : Optional<Bool> = nil

    /// Request field Width.
    var width : Optional<Decimal> = nil

    /// Request field Length.
    var length : Optional<Decimal> = nil

    /// Request field Height.
    var height : Optional<Decimal> = nil

    /// Request field ShippingMethods.
    var shippingMethods : [ShippingRuleMethod] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case editProduct = "Edit_Product"
        case productCode = "Product_Code"
        case productSku = "Product_SKU"
        case shipsInOwnPackaging = "ShipsInOwnPackaging"
        case limitShippingMethods = "LimitShippingMethods"
        case width = "Width"
        case length = "Length"
        case height = "Height"
        case shippingMethods = "ShippingMethods"
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
            } else if product.sku.count > 0 {
                self.productSku = product.sku
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
        } else if self.editProduct != nil {
            try container.encode(self.editProduct, forKey: .editProduct)
        } else if self.productCode != nil {
            try container.encode(self.productCode, forKey: .productCode)
        } else if self.productSku != nil {
            try container.encode(self.productSku, forKey: .productSku)
        }

        try container.encodeIfPresent(self.shipsInOwnPackaging, forKey: .shipsInOwnPackaging)
        try container.encodeIfPresent(self.limitShippingMethods, forKey: .limitShippingMethods)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.width, precision: 2), forKey: .width)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.length, precision: 2), forKey: .length)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.height, precision: 2), forKey: .height)
        try container.encodeIfPresent(self.shippingMethods, forKey: .shippingMethods)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductShippingRulesUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductShippingRulesUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductShippingRulesUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductShippingRulesUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductShippingRulesUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductShippingRulesUpdateResponse.self
    }

    /**
     Getter for Product_ID.

     - Returns:  Optional<Int>
     */
    public func getProductId() -> Optional<Int> {
        return self.productId
    }

    /**
     Getter for Edit_Product.

     - Returns:  Optional<String>
     */
    public func getEditProduct() -> Optional<String> {
        return self.editProduct
    }

    /**
     Getter for Product_Code.

     - Returns:  Optional<String>
     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
    }

    /**
     Getter for Product_SKU.

     - Returns:  Optional<String>
     */
    public func getProductSku() -> Optional<String> {
        return self.productSku
    }

    /**
     Getter for ShipsInOwnPackaging.

     - Returns:  Optional<Bool>
     */
    public func getShipsInOwnPackaging() -> Optional<Bool> {
        return self.shipsInOwnPackaging
    }

    /**
     Getter for LimitShippingMethods.

     - Returns:  Optional<Bool>
     */
    public func getLimitShippingMethods() -> Optional<Bool> {
        return self.limitShippingMethods
    }

    /**
     Getter for Width.

     - Returns:  Optional<Decimal>
     */
    public func getWidth() -> Optional<Decimal> {
        return self.width
    }

    /**
     Getter for Length.

     - Returns:  Optional<Decimal>
     */
    public func getLength() -> Optional<Decimal> {
        return self.length
    }

    /**
     Getter for Height.

     - Returns:  Optional<Decimal>
     */
    public func getHeight() -> Optional<Decimal> {
        return self.height
    }

    /**
     Getter for ShippingMethods.

     - Returns:  [ShippingRuleMethod]
     */
    public func getShippingMethods() -> [ShippingRuleMethod] {
        return self.shippingMethods
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
     Setter for Product_SKU.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductSku(_ value: Optional<String>) -> Self {
        self.productSku = value
        return self
    }

    /**
     Setter for ShipsInOwnPackaging.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setShipsInOwnPackaging(_ value: Optional<Bool>) -> Self {
        self.shipsInOwnPackaging = value
        return self
    }

    /**
     Setter for LimitShippingMethods.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setLimitShippingMethods(_ value: Optional<Bool>) -> Self {
        self.limitShippingMethods = value
        return self
    }

    /**
     Setter for Width.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setWidth(_ value: Optional<Decimal>) -> Self {
        self.width = value
        return self
    }

    /**
     Setter for Length.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setLength(_ value: Optional<Decimal>) -> Self {
        self.length = value
        return self
    }

    /**
     Setter for Height.

     - Parameters:
        - value: Optional<Decimal>
     - Returns:  Self
     */
    @discardableResult
    public func setHeight(_ value: Optional<Decimal>) -> Self {
        self.height = value
        return self
    }

    /**
     Add a ShippingRuleMethod.

     - Parameters:
        - shippingMethod: ShippingRuleMethod
     - Returns: Self
     */
    @discardableResult
    public func addShippingMethod(_ shippingMethod : ShippingRuleMethod) -> Self {
        self.shippingMethods.append(shippingMethod)
        return self
    }

    /**
     Add an array of ShippingRuleMethod.

     - Parameters:
        - shippingMethods: [ShippingRuleMethod]
     - Returns: Self
     */
    @discardableResult
    public func addShippingMethods(_ shippingMethods: [ShippingRuleMethod]) -> Self {
        for s in shippingMethods {
            self.shippingMethods.append(s);
        }

        return self
    }
}
