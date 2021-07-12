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
 Handles API Request Branch_Create.

 - SeeAlso: https://docs.miva.com/json-api/functions/branch_create
 */
public class BranchCreateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Branch_Create"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Parent_Branch_ID.
    var parentBranchId : Optional<Int> = nil

    /// Request field Name.
    var name : Optional<String> = nil

    /// Request field Color.
    var color : Optional<String> = nil

    /// Request field Changeset_ID.
    var changesetId : Optional<Int> = nil

    /// Request field Tags.
    var tags : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case parentBranchId = "Parent_Branch_ID"
        case name = "Name"
        case color = "Color"
        case changesetId = "Changeset_ID"
        case tags = "Tags"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - branch: An optional Branch instance.
     */
    public init(client: Optional<BaseClient> = nil, branch: Optional<Branch> = nil) {
        super.init(client: client)
        if let branch = branch {
            if branch.id > 0 {
                self.parentBranchId = branch.id
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

        if self.parentBranchId != nil {
            try container.encodeIfPresent(self.parentBranchId, forKey: .parentBranchId)
        }

        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.color, forKey: .color)
        try container.encodeIfPresent(self.changesetId, forKey: .changesetId)
        try container.encodeIfPresent(self.tags, forKey: .tags)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (BranchCreateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (BranchCreateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? BranchCreateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> BranchCreateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(BranchCreateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return BranchCreateResponse.self
    }

    /**
     Getter for Parent_Branch_ID.

     - Returns:  Optional<Int>
     */
    public func getParentBranchId() -> Optional<Int> {
        return self.parentBranchId
    }

    /**
     Getter for Name.

     - Returns:  Optional<String>
     */
    public func getName() -> Optional<String> {
        return self.name
    }

    /**
     Getter for Color.

     - Returns:  Optional<String>
     */
    public func getColor() -> Optional<String> {
        return self.color
    }

    /**
     Getter for Changeset_ID.

     - Returns:  Optional<Int>
     */
    public func getChangesetId() -> Optional<Int> {
        return self.changesetId
    }

    /**
     Getter for Tags.

     - Returns:  Optional<String>
     */
    public func getTags() -> Optional<String> {
        return self.tags
    }

    /**
     Setter for Parent_Branch_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setParentBranchId(_ value: Optional<Int>) -> Self {
        self.parentBranchId = value
        return self
    }

    /**
     Setter for Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setName(_ value: Optional<String>) -> Self {
        self.name = value
        return self
    }

    /**
     Setter for Color.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setColor(_ value: Optional<String>) -> Self {
        self.color = value
        return self
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

    /**
     Setter for Tags.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setTags(_ value: Optional<String>) -> Self {
        self.tags = value
        return self
    }
}
