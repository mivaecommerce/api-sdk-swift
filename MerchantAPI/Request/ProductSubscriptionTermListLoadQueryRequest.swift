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
 Handles API Request ProductSubscriptionTermList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/productsubscriptiontermlist_load_query
 */
public class ProductSubscriptionTermListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductSubscriptionTermList_Load_Query"
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

    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "frequency",
                "term",
                "descrip",
                "n",
                "fixed_dow",
                "fixed_dom",
                "sub_count"
            ]
        }
    }

    /**
     The available sort fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSortFields : [ String ] {
        get {
            return [
                "id",
                "frequency",
                "term",
                "descrip",
                "n",
                "fixed_dow",
                "fixed_dom",
                "sub_count",
                "disp_order"
            ]
        }
    }

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productId = "Product_ID"
        case editProduct = "Edit_Product"
        case productCode = "Product_Code"
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
        } else if self.editProduct != nil {
            try container.encode(self.editProduct, forKey: .editProduct)
        } else if self.productCode != nil {
            try container.encode(self.productCode, forKey: .productCode)
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductSubscriptionTermListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductSubscriptionTermListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductSubscriptionTermListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductSubscriptionTermListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductSubscriptionTermListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductSubscriptionTermListLoadQueryResponse.self
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
}
