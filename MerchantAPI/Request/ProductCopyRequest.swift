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
 Handles API Request Product_Copy.

 - SeeAlso: https://docs.miva.com/json-api/functions/product_copy
 */
public class ProductCopyRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Product_Copy"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Product_Copy_Session_ID.
    var productCopySessionId : Optional<String> = nil

    /// Request field CopyProductRules_ID.
    var copyProductRulesId : Optional<Int> = nil

    /// Request field CopyProductRules_Name.
    var copyProductRulesName : Optional<String> = nil

    /// Request field Source_Product_ID.
    var sourceProductId : Optional<Int> = nil

    /// Request field Source_Product_Code.
    var sourceProductCode : Optional<String> = nil

    /// Request field Dest_Product_Code.
    var destinationProductCode : Optional<String> = nil

    /// Request field Dest_Product_Name.
    var destinationProductName : Optional<String> = nil

    /// Request field Dest_Product_SKU.
    var destinationProductSku : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productCopySessionId = "Product_Copy_Session_ID"
        case copyProductRulesId = "CopyProductRules_ID"
        case copyProductRulesName = "CopyProductRules_Name"
        case sourceProductId = "Source_Product_ID"
        case sourceProductCode = "Source_Product_Code"
        case destinationProductCode = "Dest_Product_Code"
        case destinationProductName = "Dest_Product_Name"
        case destinationProductSku = "Dest_Product_SKU"
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
                self.sourceProductId = product.id
            } else if product.code.count > 0 {
                self.sourceProductCode = product.code
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

        if self.sourceProductId != nil {
            try container.encodeIfPresent(self.sourceProductId, forKey: .sourceProductId)
        } else if self.sourceProductCode != nil {
            try container.encode(self.sourceProductCode, forKey: .sourceProductCode)
        }

        if self.destinationProductCode != nil {
            try container.encodeIfPresent(self.destinationProductCode, forKey: .destinationProductCode)
        }

        if self.copyProductRulesId != nil {
            try container.encodeIfPresent(self.copyProductRulesId, forKey: .copyProductRulesId)
        } else if self.copyProductRulesName != nil {
            try container.encode(self.copyProductRulesName, forKey: .copyProductRulesName)
        }

        try container.encodeIfPresent(self.productCopySessionId, forKey: .productCopySessionId)
        try container.encodeIfPresent(self.copyProductRulesId, forKey: .copyProductRulesId)
        try container.encodeIfPresent(self.copyProductRulesName, forKey: .copyProductRulesName)
        try container.encodeIfPresent(self.destinationProductCode, forKey: .destinationProductCode)
        try container.encodeIfPresent(self.destinationProductName, forKey: .destinationProductName)
        try container.encodeIfPresent(self.destinationProductSku, forKey: .destinationProductSku)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductCopyResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductCopyResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductCopyResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductCopyResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductCopyResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductCopyResponse.self
    }

    /**
     Getter for Product_Copy_Session_ID.

     - Returns:  Optional<String>
     */
    public func getProductCopySessionId() -> Optional<String> {
        return self.productCopySessionId
    }

    /**
     Getter for CopyProductRules_ID.

     - Returns:  Optional<Int>
     */
    public func getCopyProductRulesId() -> Optional<Int> {
        return self.copyProductRulesId
    }

    /**
     Getter for CopyProductRules_Name.

     - Returns:  Optional<String>
     */
    public func getCopyProductRulesName() -> Optional<String> {
        return self.copyProductRulesName
    }

    /**
     Getter for Source_Product_ID.

     - Returns:  Optional<Int>
     */
    public func getSourceProductId() -> Optional<Int> {
        return self.sourceProductId
    }

    /**
     Getter for Source_Product_Code.

     - Returns:  Optional<String>
     */
    public func getSourceProductCode() -> Optional<String> {
        return self.sourceProductCode
    }

    /**
     Getter for Dest_Product_Code.

     - Returns:  Optional<String>
     */
    public func getDestinationProductCode() -> Optional<String> {
        return self.destinationProductCode
    }

    /**
     Getter for Dest_Product_Name.

     - Returns:  Optional<String>
     */
    public func getDestinationProductName() -> Optional<String> {
        return self.destinationProductName
    }

    /**
     Getter for Dest_Product_SKU.

     - Returns:  Optional<String>
     */
    public func getDestinationProductSku() -> Optional<String> {
        return self.destinationProductSku
    }

    /**
     Setter for Product_Copy_Session_ID.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setProductCopySessionId(_ value: Optional<String>) -> Self {
        self.productCopySessionId = value
        return self
    }

    /**
     Setter for CopyProductRules_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyProductRulesId(_ value: Optional<Int>) -> Self {
        self.copyProductRulesId = value
        return self
    }

    /**
     Setter for CopyProductRules_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyProductRulesName(_ value: Optional<String>) -> Self {
        self.copyProductRulesName = value
        return self
    }

    /**
     Setter for Source_Product_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setSourceProductId(_ value: Optional<Int>) -> Self {
        self.sourceProductId = value
        return self
    }

    /**
     Setter for Source_Product_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setSourceProductCode(_ value: Optional<String>) -> Self {
        self.sourceProductCode = value
        return self
    }

    /**
     Setter for Dest_Product_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationProductCode(_ value: Optional<String>) -> Self {
        self.destinationProductCode = value
        return self
    }

    /**
     Setter for Dest_Product_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationProductName(_ value: Optional<String>) -> Self {
        self.destinationProductName = value
        return self
    }

    /**
     Setter for Dest_Product_SKU.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationProductSku(_ value: Optional<String>) -> Self {
        self.destinationProductSku = value
        return self
    }
}
