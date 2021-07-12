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
 Handles API Request URI_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/uri_insert
 */
public class URIInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "URI_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field URI.
    var uri : Optional<String> = nil

    /// Request field Destination_Type.
    var destinationType : Optional<String> = nil

    /// Request field Destination.
    var destination : Optional<String> = nil

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
        case uri = "URI"
        case destinationType = "Destination_Type"
        case destination = "Destination"
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

        try container.encodeIfPresent(self.uri, forKey: .uri)
        try container.encodeIfPresent(self.destinationType, forKey: .destinationType)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.canonical, forKey: .canonical)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (URIInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (URIInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? URIInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> URIInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(URIInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return URIInsertResponse.self
    }

    /**
     Getter for URI.

     - Returns:  Optional<String>
     */
    public func getUri() -> Optional<String> {
        return self.uri
    }

    /**
     Getter for Destination_Type.

     - Returns:  Optional<String>
     */
    public func getDestinationType() -> Optional<String> {
        return self.destinationType
    }

    /**
     Getter for Destination.

     - Returns:  Optional<String>
     */
    public func getDestination() -> Optional<String> {
        return self.destination
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
     Setter for Destination_Type.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationType(_ value: Optional<String>) -> Self {
        self.destinationType = value
        return self
    }

    /**
     Setter for Destination.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestination(_ value: Optional<String>) -> Self {
        self.destination = value
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
