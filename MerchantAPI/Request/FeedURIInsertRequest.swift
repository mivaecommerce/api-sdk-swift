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
 Handles API Request FeedURI_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/feeduri_insert
 */
public class FeedURIInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "FeedURI_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Feed_ID.
    var feedId : Optional<Int> = nil

    /// Request field Feed_Code.
    var feedCode : Optional<String> = nil

    /// Request field URI.
    var uri : Optional<String> = nil

    /// Request field Status.
    var status : Optional<Int> = nil

    /// Request field Canonical.
    var canonical : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case feedId = "Feed_ID"
        case feedCode = "Feed_Code"
        case uri = "URI"
        case status = "Status"
        case canonical = "Canonical"
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

        if self.feedId != nil {
            try container.encodeIfPresent(self.feedId, forKey: .feedId)
        } else if self.feedCode != nil {
            try container.encode(self.feedCode, forKey: .feedCode)
        }

        try container.encodeIfPresent(self.uri, forKey: .uri)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.canonical, forKey: .canonical)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (FeedURIInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (FeedURIInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? FeedURIInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> FeedURIInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(FeedURIInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return FeedURIInsertResponse.self
    }

    /**
     Getter for Feed_ID.

     - Returns:  Optional<Int>
     */
    public func getFeedId() -> Optional<Int> {
        return self.feedId
    }

    /**
     Getter for Feed_Code.

     - Returns:  Optional<String>
     */
    public func getFeedCode() -> Optional<String> {
        return self.feedCode
    }

    /**
     Getter for URI.

     - Returns:  Optional<String>
     */
    public func getUri() -> Optional<String> {
        return self.uri
    }

    /**
     Getter for Status.

     - Returns:  Optional<Int>
     */
    public func getStatus() -> Optional<Int> {
        return self.status
    }

    /**
     Getter for Canonical.

     - Returns:  Optional<Bool>
     */
    public func getCanonical() -> Optional<Bool> {
        return self.canonical
    }

    /**
     Setter for Feed_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setFeedId(_ value: Optional<Int>) -> Self {
        self.feedId = value
        return self
    }

    /**
     Setter for Feed_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setFeedCode(_ value: Optional<String>) -> Self {
        self.feedCode = value
        return self
    }

    /**
     Setter for URI.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setUri(_ value: Optional<String>) -> Self {
        self.uri = value
        return self
    }

    /**
     Setter for Status.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setStatus(_ value: Optional<Int>) -> Self {
        self.status = value
        return self
    }

    /**
     Setter for Canonical.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCanonical(_ value: Optional<Bool>) -> Self {
        self.canonical = value
        return self
    }
}
