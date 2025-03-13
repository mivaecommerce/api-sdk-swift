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
 Handles API Request Branch_Copy.

 - SeeAlso: https://docs.miva.com/json-api/functions/branch_copy
 */
public class BranchCopyRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Branch_Copy"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Source_Branch_ID.
    var sourceBranchId : Optional<Int> = nil

    /// Request field Source_Changeset_ID.
    var sourceChangesetId : Optional<Int> = nil

    /// Request field Destination_Branch_ID.
    var destinationBranchId : Optional<Int> = nil

    /// Request field Branch_Copy_Session_ID.
    var branchCopySessionId : Optional<String> = nil

    /// Request field Notes.
    var notes : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case sourceBranchId = "Source_Branch_ID"
        case sourceChangesetId = "Source_Changeset_ID"
        case destinationBranchId = "Destination_Branch_ID"
        case branchCopySessionId = "Branch_Copy_Session_ID"
        case notes = "Notes"
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
                self.sourceBranchId = branch.id
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

        if self.sourceBranchId != nil {
            try container.encodeIfPresent(self.sourceBranchId, forKey: .sourceBranchId)
        }

        if self.destinationBranchId != nil {
            try container.encodeIfPresent(self.destinationBranchId, forKey: .destinationBranchId)
        }

        try container.encodeIfPresent(self.sourceChangesetId, forKey: .sourceChangesetId)
        try container.encodeIfPresent(self.branchCopySessionId, forKey: .branchCopySessionId)
        try container.encodeIfPresent(self.notes, forKey: .notes)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (BranchCopyResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (BranchCopyResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? BranchCopyResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> BranchCopyResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(BranchCopyResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return BranchCopyResponse.self
    }

    /**
     Getter for Source_Branch_ID.

     - Returns:  Optional<Int>
     */
    public func getSourceBranchId() -> Optional<Int> {
        return self.sourceBranchId
    }

    /**
     Getter for Source_Changeset_ID.

     - Returns:  Optional<Int>
     */
    public func getSourceChangesetId() -> Optional<Int> {
        return self.sourceChangesetId
    }

    /**
     Getter for Destination_Branch_ID.

     - Returns:  Optional<Int>
     */
    public func getDestinationBranchId() -> Optional<Int> {
        return self.destinationBranchId
    }

    /**
     Getter for Branch_Copy_Session_ID.

     - Returns:  Optional<String>
     */
    public func getBranchCopySessionId() -> Optional<String> {
        return self.branchCopySessionId
    }

    /**
     Getter for Notes.

     - Returns:  Optional<String>
     */
    public func getNotes() -> Optional<String> {
        return self.notes
    }

    /**
     Setter for Source_Branch_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setSourceBranchId(_ value: Optional<Int>) -> Self {
        self.sourceBranchId = value
        return self
    }

    /**
     Setter for Source_Changeset_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setSourceChangesetId(_ value: Optional<Int>) -> Self {
        self.sourceChangesetId = value
        return self
    }

    /**
     Setter for Destination_Branch_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationBranchId(_ value: Optional<Int>) -> Self {
        self.destinationBranchId = value
        return self
    }

    /**
     Setter for Branch_Copy_Session_ID.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBranchCopySessionId(_ value: Optional<String>) -> Self {
        self.branchCopySessionId = value
        return self
    }

    /**
     Setter for Notes.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setNotes(_ value: Optional<String>) -> Self {
        self.notes = value
        return self
    }
}
