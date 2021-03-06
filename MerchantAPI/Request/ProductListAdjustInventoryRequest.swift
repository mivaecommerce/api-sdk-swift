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
 Handles API Request ProductList_Adjust_Inventory.

 - SeeAlso: https://docs.miva.com/json-api/functions/productlist_adjust_inventory
 */
public class ProductListAdjustInventoryRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ProductList_Adjust_Inventory"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Inventory_Adjustments.
    var inventoryAdjustments : [ProductInventoryAdjustment] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case inventoryAdjustments = "Inventory_Adjustments"
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

        try container.encodeIfPresent(self.inventoryAdjustments, forKey: .inventoryAdjustments)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ProductListAdjustInventoryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ProductListAdjustInventoryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ProductListAdjustInventoryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ProductListAdjustInventoryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ProductListAdjustInventoryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ProductListAdjustInventoryResponse.self
    }

    /**
     Getter for Inventory_Adjustments.

     - Returns:  [ProductInventoryAdjustment]
     */
    public func getInventoryAdjustments() -> [ProductInventoryAdjustment] {
        return self.inventoryAdjustments
    }

    /**
     Add a ProductInventoryAdjustment.

     - Parameters:
        - inventoryAdjustment: ProductInventoryAdjustment
     - Returns: Self
     */
    @discardableResult
    public func addInventoryAdjustment(_ inventoryAdjustment : ProductInventoryAdjustment) -> Self {
        self.inventoryAdjustments.append(inventoryAdjustment)
        return self
    }

    /**
     Add an array of ProductInventoryAdjustment.

     - Parameters:
        - inventoryAdjustments: [ProductInventoryAdjustment]
     - Returns: Self
     */
    @discardableResult
    public func addInventoryAdjustments(_ inventoryAdjustments: [ProductInventoryAdjustment]) -> Self {
        for i in inventoryAdjustments {
            self.inventoryAdjustments.append(i);
        }

        return self
    }
}
