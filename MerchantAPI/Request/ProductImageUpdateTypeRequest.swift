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
 Handles API Request ProductImage_Update_Type.

 - SeeAlso: https://docs.miva.com/json-api/functions/productimage_update_type
 */
public class ProductImageUpdateTypeRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductImage_Update_Type"
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
    var productImageId : Optional<Int> = nil

    /// Request field ImageType_ID.
    var imageTypeId : Optional<Int> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case productImageId = "ProductImage_ID"
        case imageTypeId = "ImageType_ID"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
     */
    public override init(client: Optional<BaseClient> = nil) {
        super.init(client: client)
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
        try container.encodeIfPresent(self.imageTypeId, forKey: .imageTypeId)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductImageUpdateTypeResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductImageUpdateTypeResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductImageUpdateTypeResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductImageUpdateTypeResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductImageUpdateTypeResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductImageUpdateTypeResponse.self
    }

    /**
     Getter for ProductImage_ID.

     - Returns:  Optional<Int>
     */
    public func getProductImageId() -> Optional<Int> {
        return self.productImageId
    }

    /**
     Getter for ImageType_ID.

     - Returns:  Optional<Int>
     */
    public func getImageTypeId() -> Optional<Int> {
        return self.imageTypeId
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
