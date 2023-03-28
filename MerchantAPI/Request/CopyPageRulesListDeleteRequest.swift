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
 Handles API Request CopyPageRulesList_Delete.

 - SeeAlso: https://docs.miva.com/json-api/functions/copypageruleslist_delete
 */
public class CopyPageRulesListDeleteRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CopyPageRulesList_Delete"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field CopyPageRules_IDs.
    var copyPageRulesIds : [Int] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case copyPageRulesIds = "CopyPageRules_IDs"
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

        try container.encodeIfPresent(self.copyPageRulesIds, forKey: .copyPageRulesIds)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CopyPageRulesListDeleteResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CopyPageRulesListDeleteResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CopyPageRulesListDeleteResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CopyPageRulesListDeleteResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CopyPageRulesListDeleteResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CopyPageRulesListDeleteResponse.self
    }

    /**
     Add CopyPageRules_IDs.

     - Parameters:
        - copyPageRuleId: Int
     - Returns: Self
     */
    @discardableResult
    public func addCopyPageRuleId(_ copyPageRuleId : Int) -> Self {
        self.copyPageRulesIds.append(copyPageRuleId);
        return self
    }

    /**
     Add CopyPageRule model.

     - Parameters:
        - copyPageRule: CopyPageRule
     - Returns: Self
     */
    @discardableResult
    public func addCopyPageRule(_ copyPageRule: CopyPageRule) -> Self {
        if copyPageRule.id > 0 {
            self.copyPageRulesIds.append(copyPageRule.id)
        }

        return self
    }
}
