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
 Handles API Request ChangesetCSSResourceVersionList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/changesetcssresourceversionlist_load_query
 */
public class ChangesetCSSResourceVersionListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "ChangesetCSSResourceVersionList_Load_Query"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Changeset_ID.
    var changesetId : Optional<Int> = nil

    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "id",
                "res_id",
                "code",
                "type",
                "is_global",
                "active",
                "file",
                "templ_id",
                "user_id",
                "user_name",
                "source_user_id",
                "source_user_name"
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
                "res_id",
                "code",
                "type",
                "is_global",
                "active",
                "file",
                "templ_id",
                "user_id",
                "user_name",
                "source_user_id",
                "source_user_name"
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
                "source",
                "source_notes"
            ]
        }
    }

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case changesetId = "Changeset_ID"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - changeset: An optional Changeset instance.
     */
    public init(client: Optional<BaseClient> = nil, changeset: Optional<Changeset> = nil) {
        super.init(client: client)
        if let changeset = changeset {
            self.changesetId = changeset.id
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

        try container.encodeIfPresent(self.changesetId, forKey: .changesetId)
        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ChangesetCSSResourceVersionListLoadQueryResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ChangesetCSSResourceVersionListLoadQueryResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ChangesetCSSResourceVersionListLoadQueryResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ChangesetCSSResourceVersionListLoadQueryResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ChangesetCSSResourceVersionListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ChangesetCSSResourceVersionListLoadQueryResponse.self
    }

    /**
     Getter for Changeset_ID.

     - Returns:  Optional<Int>
     */
    public func getChangesetId() -> Optional<Int> {
        return self.changesetId
    }

    /**
     Setter for Changeset_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setChangesetId(_ value: Optional<Int>) -> Self {
        self.changesetId = value
        return self
    }
}
