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
 Handles API Request CategoryURI_Redirect.

 - SeeAlso: https://docs.miva.com/json-api/functions/categoryuri_redirect
 */
public class CategoryURIRedirectRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CategoryURI_Redirect"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Destination_Store_Code.
    var destinationStoreCode : Optional<String> = nil

    /// Request field Destination_Type.
    var destinationType : Optional<String> = nil

    /// Request field Destination.
    var destination : Optional<String> = nil

    /// Request field Status.
    var status : Optional<Int> = nil

    /// Request field URI_IDs.
    var uriIds : [Int] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case destinationStoreCode = "Destination_Store_Code"
        case destinationType = "Destination_Type"
        case destination = "Destination"
        case status = "Status"
        case uriIds = "URI_IDs"
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

        try container.encodeIfPresent(self.destinationStoreCode, forKey: .destinationStoreCode)
        try container.encodeIfPresent(self.destinationType, forKey: .destinationType)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.uriIds, forKey: .uriIds)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CategoryURIRedirectResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CategoryURIRedirectResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CategoryURIRedirectResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CategoryURIRedirectResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CategoryURIRedirectResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CategoryURIRedirectResponse.self
    }

    /**
     Getter for Destination_Store_Code.

     - Returns:  Optional<String>
     */
    public func getDestinationStoreCode() -> Optional<String> {
        return self.destinationStoreCode
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
     Setter for Destination_Store_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationStoreCode(_ value: Optional<String>) -> Self {
        self.destinationStoreCode = value
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
     Add URI_IDs.

     - Parameters:
        - uriId: Int
     - Returns: Self
     */
    @discardableResult
    public func addUriID(_ uriId : Int) -> Self {
        self.uriIds.append(uriId);
        return self
    }

    /**
     Add Uri model.

     - Parameters:
        - uri: Uri
     - Returns: Self
     */
    @discardableResult
    public func addUri(_ uri: Uri) -> Self {
        if uri.id > 0 {
            self.uriIds.append(uri.id)
        }

        return self
    }
}
