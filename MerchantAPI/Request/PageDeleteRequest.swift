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
 Handles API Request Page_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/page_delete
 */
public class PageDeleteRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Page_Delete"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Page_ID.
    var pageId : Optional<Int> = nil

    /// Request field Edit_Page.
    var editPage : Optional<String> = nil

    /// Request field Page_Code.
    var pageCode : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case pageId = "Page_ID"
        case editPage = "Edit_Page"
        case pageCode = "Page_Code"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - page: An optional Page instance.
     */
    public init(client: Optional<BaseClient> = nil, page: Optional<Page> = nil) {
        super.init(client: client)
        if let page = page {
            if page.id > 0 {
                self.pageId = page.id
            } else if page.code.count > 0 {
                self.editPage = page.code
            } else if page.code.count > 0 {
                self.pageCode = page.code
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

        if self.pageId != nil {
            try container.encodeIfPresent(self.pageId, forKey: .pageId)
        } else if self.editPage != nil {
            try container.encode(self.editPage, forKey: .editPage)
        } else if self.pageCode != nil {
            try container.encode(self.pageCode, forKey: .pageCode)
        }

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PageDeleteResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PageDeleteResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PageDeleteResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PageDeleteResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PageDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PageDeleteResponse.self
    }

    /**
     Getter for Page_ID.

     - Returns:  Optional<Int>
     */
    public func getPageId() -> Optional<Int> {
        return self.pageId
    }

    /**
     Getter for Edit_Page.

     - Returns:  Optional<String>
     */
    public func getEditPage() -> Optional<String> {
        return self.editPage
    }

    /**
     Getter for Page_Code.

     - Returns:  Optional<String>
     */
    public func getPageCode() -> Optional<String> {
        return self.pageCode
    }

    /**
     Setter for Page_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPageId(_ value: Optional<Int>) -> Self {
        self.pageId = value
        return self
    }

    /**
     Setter for Edit_Page.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditPage(_ value: Optional<String>) -> Self {
        self.editPage = value
        return self
    }

    /**
     Setter for Page_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPageCode(_ value: Optional<String>) -> Self {
        self.pageCode = value
        return self
    }
}
