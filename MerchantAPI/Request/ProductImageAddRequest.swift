/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: ProductImageAddRequest.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 Handles API Request ProductImage_Add.

 - SeeAlso: https://docs.miva.com/json-api/functions/productimage_add
 */
public class ProductImageAddRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductImage_Add"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field Product_Code.
    var productCode : Optional<String>

    /// Request field Product_ID.
    var productId : Optional<Int>

    /// Request field Edit_Product.
    var editProduct : Optional<String>

    /// Request field Product_SKU.
    var productSku : Optional<String>

    /// Request field Filepath.
    var filepath : Optional<String>

    /// Request field ImageType_ID.
    var imageTypeId : Optional<Int>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productCode = "Product_Code"
        case productId = "Product_ID"
        case editProduct = "Edit_Product"
        case productSku = "Product_SKU"
        case filepath = "Filepath"
        case imageTypeId = "ImageType_ID"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - product: An optional Product instance.
     */
    public init(client: Optional<Client> = nil, product: Optional<Product> = nil) {
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

        try container.encodeIfPresent(self.filepath, forKey: .filepath)
        try container.encodeIfPresent(self.imageTypeId, forKey: .imageTypeId)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductImageAddResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (ProductImageAddResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? ProductImageAddResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? ProductImageAddResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(data : Data) throws -> ProductImageAddResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(ProductImageAddResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductImageAddResponse.self
    }
    
    /**
     Getter for Product_Code.

     - Returns:  Optional<String> 
     */
    public func getProductCode() -> Optional<String> {
        return self.productCode
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
     Getter for Product_SKU.

     - Returns:  Optional<String> 
     */
    public func getProductSku() -> Optional<String> {
        return self.productSku
    }
    
    /**
     Getter for Filepath.

     - Returns:  Optional<String> 
     */
    public func getFilepath() -> Optional<String> {
        return self.filepath
    }
    
    /**
     Getter for ImageType_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getImageTypeId() -> Optional<Int> {
        return self.imageTypeId
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
     Setter for Filepath.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setFilepath(_ value: Optional<String>) -> Self {
        self.filepath = value
        return self
    }
    
    /**
     Setter for ImageType_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setImageTypeId(_ value: Optional<Int>) -> Self {
        self.imageTypeId = value
        return self
    }
}
