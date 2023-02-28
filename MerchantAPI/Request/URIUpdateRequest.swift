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
 Handles API Request URI_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/uri_update
 */
public class URIUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "URI_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field URI_ID.
    var uriId : Optional<Int> = nil

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
        case uriId = "URI_ID"
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
        - uri: An optional Uri instance.
     */
    public init(client: Optional<BaseClient> = nil, uri: Optional<Uri> = nil) {
        super.init(client: client)
        if let uri = uri {
            if uri.id > 0 {
                self.uriId = uri.id
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

        if self.uriId != nil {
            try container.encodeIfPresent(self.uriId, forKey: .uriId)
        }

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
        - callback: The callback function with signature (URIUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (URIUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? URIUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> URIUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(URIUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return URIUpdateResponse.self
    }

    /**
     Getter for URI_ID.

     - Returns:  Optional<Int>
     */
    public func getUriId() -> Optional<Int> {
        return self.uriId
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
     Enum Getter for Destination_Type.

     - Returns:  Optional<Uri.DestinationType>
     */
    public func getDestinationType() -> Optional<Uri.DestinationType> {
        if let v = self.destinationType {
            return Uri.DestinationType(rawValue: v) ?? nil
        }
        return nil;
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
     Setter for URI_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setUriId(_ value: Optional<Int>) -> Self {
        self.uriId = value
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
     Enum Setter for Destination_Type.

     - Parameters:
        - value: Uri.DestinationType
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationType(_ value: Uri.DestinationType) -> Self {
        self.destinationType = value.rawValue
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
