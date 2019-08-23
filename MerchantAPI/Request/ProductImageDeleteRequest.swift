/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/**
 Handles API Request ProductImage_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/productimage_delete
 */
public class ProductImageDeleteRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductImage_Delete"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field ProductImage_ID.
    var productImageId : Optional<Int>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productImageId = "ProductImage_ID"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - productImageData: An optional ProductImageData instance.
     */
    public init(client: Optional<Client> = nil, productImageData: Optional<ProductImageData> = nil) {
        super.init(client: client)
        if let productImageData = productImageData {
            self.productImageId = productImageData.id
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

        try container.encodeIfPresent(self.productImageId, forKey: .productImageId)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductImageDeleteResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (ProductImageDeleteResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? ProductImageDeleteResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? ProductImageDeleteResponse, error)
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
    public override func createResponse(data : Data) throws -> ProductImageDeleteResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(ProductImageDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductImageDeleteResponse.self
    }
    
    /**
     Getter for ProductImage_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getProductImageId() -> Optional<Int> {
        return self.productImageId
    }
    
    /**
     Setter for ProductImage_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setProductImageId(_ value: Optional<Int>) -> Self {
        self.productImageId = value
        return self
    }
}
