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
 Handles API Request JavaScriptResource_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/javascriptresource_delete
 */
public class JavaScriptResourceDeleteRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "JavaScriptResource_Delete"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field JavaScriptResource_ID.
    var javaScriptResourceId : Optional<Int> = nil

    /// Request field Edit_JavaScriptResource.
    var editJavaScriptResource : Optional<String> = nil

    /// Request field JavaScriptResource_Code.
    var javaScriptResourceCode : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case javaScriptResourceId = "JavaScriptResource_ID"
        case editJavaScriptResource = "Edit_JavaScriptResource"
        case javaScriptResourceCode = "JavaScriptResource_Code"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - javaScriptResource: An optional JavaScriptResource instance.
     */
    public init(client: Optional<BaseClient> = nil, javaScriptResource: Optional<JavaScriptResource> = nil) {
        super.init(client: client)
        if let javaScriptResource = javaScriptResource {
            if javaScriptResource.id > 0 {
                self.javaScriptResourceId = javaScriptResource.id
            } else if javaScriptResource.code.count > 0 {
                self.editJavaScriptResource = javaScriptResource.code
            } else if javaScriptResource.code.count > 0 {
                self.javaScriptResourceCode = javaScriptResource.code
            }

            self.javaScriptResourceCode = javaScriptResource.code
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

        if self.javaScriptResourceId != nil {
            try container.encodeIfPresent(self.javaScriptResourceId, forKey: .javaScriptResourceId)
        } else if self.editJavaScriptResource != nil {
            try container.encode(self.editJavaScriptResource, forKey: .editJavaScriptResource)
        } else if self.javaScriptResourceCode != nil {
            try container.encode(self.javaScriptResourceCode, forKey: .javaScriptResourceCode)
        }

        try container.encodeIfPresent(self.javaScriptResourceCode, forKey: .javaScriptResourceCode)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (JavaScriptResourceDeleteResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (JavaScriptResourceDeleteResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? JavaScriptResourceDeleteResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> JavaScriptResourceDeleteResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(JavaScriptResourceDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return JavaScriptResourceDeleteResponse.self
    }

    /**
     Getter for JavaScriptResource_ID.

     - Returns:  Optional<Int>
     */
    public func getJavaScriptResourceId() -> Optional<Int> {
        return self.javaScriptResourceId
    }

    /**
     Getter for Edit_JavaScriptResource.

     - Returns:  Optional<String>
     */
    public func getEditJavaScriptResource() -> Optional<String> {
        return self.editJavaScriptResource
    }

    /**
     Getter for JavaScriptResource_Code.

     - Returns:  Optional<String>
     */
    public func getJavaScriptResourceCode() -> Optional<String> {
        return self.javaScriptResourceCode
    }

    /**
     Setter for JavaScriptResource_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceId(_ value: Optional<Int>) -> Self {
        self.javaScriptResourceId = value
        return self
    }

    /**
     Setter for Edit_JavaScriptResource.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditJavaScriptResource(_ value: Optional<String>) -> Self {
        self.editJavaScriptResource = value
        return self
    }

    /**
     Setter for JavaScriptResource_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceCode(_ value: Optional<String>) -> Self {
        self.javaScriptResourceCode = value
        return self
    }
}
