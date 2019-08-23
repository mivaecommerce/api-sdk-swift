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
 Handles API Request CategoryList_Load_Parent.

 - SeeAlso: https://docs.miva.com/json-api/functions/categorylist_load_parent
 */
public class CategoryListLoadParentRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CategoryList_Load_Parent"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field Parent_ID.
    var parentId : Optional<Int>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case parentId = "Parent_ID"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - category: An optional Category instance.
     */
    public init(client: Optional<Client> = nil, category: Optional<Category> = nil) {
        super.init(client: client)
        if let category = category {
            self.parentId = category.id
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

        try container.encodeIfPresent(self.parentId, forKey: .parentId)
        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CategoryListLoadParentResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CategoryListLoadParentResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CategoryListLoadParentResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CategoryListLoadParentResponse, error)
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
    public override func createResponse(data : Data) throws -> CategoryListLoadParentResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CategoryListLoadParentResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CategoryListLoadParentResponse.self
    }
    
    /**
     Getter for Parent_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getParentId() -> Optional<Int> {
        return self.parentId
    }
    
    /**
     Setter for Parent_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setParentId(_ value: Optional<Int>) -> Self {
        self.parentId = value
        return self
    }
}
