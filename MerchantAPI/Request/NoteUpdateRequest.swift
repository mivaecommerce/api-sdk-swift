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
 Handles API Request Note_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/note_update
 */
public class NoteUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Note_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Note_ID.
    var noteId : Optional<Int> = nil

    /// Request field NoteText.
    var noteText : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case noteId = "Note_ID"
        case noteText = "NoteText"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - note: An optional Note instance.
     */
    public init(client: Optional<BaseClient> = nil, note: Optional<Note> = nil) {
        super.init(client: client)
        if let note = note {
            self.noteId = note.id
            self.noteText = note.noteText
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

        try container.encodeIfPresent(self.noteId, forKey: .noteId)
        try container.encodeIfPresent(self.noteText, forKey: .noteText)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (NoteUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (NoteUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? NoteUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> NoteUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(NoteUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return NoteUpdateResponse.self
    }

    /**
     Getter for Note_ID.

     - Returns:  Optional<Int>
     */
    public func getNoteId() -> Optional<Int> {
        return self.noteId
    }

    /**
     Getter for NoteText.

     - Returns:  Optional<String>
     */
    public func getNoteText() -> Optional<String> {
        return self.noteText
    }

    /**
     Setter for Note_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setNoteId(_ value: Optional<Int>) -> Self {
        self.noteId = value
        return self
    }

    /**
     Setter for NoteText.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setNoteText(_ value: Optional<String>) -> Self {
        self.noteText = value
        return self
    }
}
