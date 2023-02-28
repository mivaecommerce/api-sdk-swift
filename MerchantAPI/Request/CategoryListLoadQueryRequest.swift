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
 Handles API Request CategoryList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/categorylist_load_query
 */
public class CategoryListLoadQueryRequest : ListQueryRequest {

    /// Enumeration CategoryShow
    public enum CategoryShow : String {
        case All = "All"
        case Active = "Active"
    }

    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CategoryList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "id",
                "code",
                "name",
                "page_title",
                "parent_category",
                "page_code",
                "dt_created",
                "dt_updated",
                "depth"
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
                "code",
                "name",
                "page_title",
                "active",
                "page_code",
                "parent_category",
                "disp_order",
                "dt_created",
                "dt_updated",
                "depth"
            ]
        }
    }

    /**
     The available on demand columns applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableOnDemandColumns : [ String ] {
        get {
            return [
                "uris"
            ]
        }
    }

    /**
     The available custom fileters applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableCustomFilters : [ String ] {
        get {
            return [
                "Category_Show"
            ]
        }
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
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CategoryListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CategoryListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CategoryListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CategoryListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CategoryListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CategoryListLoadQueryResponse.self
    }
}
