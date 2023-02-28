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
 Handles API Request CSSResource_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/cssresource_delete
 */
public class CSSResourceDeleteRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CSSResource_Delete"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field CSSResource_ID.
    var CSSResourceId : Optional<Int> = nil

    /// Request field Edit_CSSResource.
    var editCSSResource : Optional<String> = nil

    /// Request field CSSResource_Code.
    var CSSResourceCode : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case CSSResourceId = "CSSResource_ID"
        case editCSSResource = "Edit_CSSResource"
        case CSSResourceCode = "CSSResource_Code"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - CSSResource: An optional CSSResource instance.
     */
    public init(client: Optional<BaseClient> = nil, CSSResource: Optional<CSSResource> = nil) {
        super.init(client: client)
        if let CSSResource = CSSResource {
            if CSSResource.id > 0 {
                self.CSSResourceId = CSSResource.id
            } else if CSSResource.code.count > 0 {
                self.editCSSResource = CSSResource.code
            } else if CSSResource.code.count > 0 {
                self.CSSResourceCode = CSSResource.code
            }

            self.CSSResourceCode = CSSResource.code
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

        if self.CSSResourceId != nil {
            try container.encodeIfPresent(self.CSSResourceId, forKey: .CSSResourceId)
        } else if self.editCSSResource != nil {
            try container.encode(self.editCSSResource, forKey: .editCSSResource)
        } else if self.CSSResourceCode != nil {
            try container.encode(self.CSSResourceCode, forKey: .CSSResourceCode)
        }

        try container.encodeIfPresent(self.CSSResourceCode, forKey: .CSSResourceCode)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CSSResourceDeleteResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CSSResourceDeleteResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CSSResourceDeleteResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CSSResourceDeleteResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CSSResourceDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CSSResourceDeleteResponse.self
    }

    /**
     Getter for CSSResource_ID.

     - Returns:  Optional<Int>
     */
    public func getCSSResourceId() -> Optional<Int> {
        return self.CSSResourceId
    }

    /**
     Getter for Edit_CSSResource.

     - Returns:  Optional<String>
     */
    public func getEditCSSResource() -> Optional<String> {
        return self.editCSSResource
    }

    /**
     Getter for CSSResource_Code.

     - Returns:  Optional<String>
     */
    public func getCSSResourceCode() -> Optional<String> {
        return self.CSSResourceCode
    }

    /**
     Setter for CSSResource_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceId(_ value: Optional<Int>) -> Self {
        self.CSSResourceId = value
        return self
    }

    /**
     Setter for Edit_CSSResource.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditCSSResource(_ value: Optional<String>) -> Self {
        self.editCSSResource = value
        return self
    }

    /**
     Setter for CSSResource_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceCode(_ value: Optional<String>) -> Self {
        self.CSSResourceCode = value
        return self
    }
}
