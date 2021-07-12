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
 Handles API Request Note_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/note_insert
 */
public class NoteInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Note_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field NoteText.
    var noteText : Optional<String> = nil

    /// Request field Customer_ID.
    var customerId : Optional<Int> = nil

    /// Request field Account_ID.
    var accountId : Optional<Int> = nil

    /// Request field Order_ID.
    var orderId : Optional<Int> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case noteText = "NoteText"
        case customerId = "Customer_ID"
        case accountId = "Account_ID"
        case orderId = "Order_ID"
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

        try container.encodeIfPresent(self.noteText, forKey: .noteText)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encodeIfPresent(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.orderId, forKey: .orderId)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (NoteInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (NoteInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? NoteInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> NoteInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(NoteInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return NoteInsertResponse.self
    }

    /**
     Getter for NoteText.

     - Returns:  Optional<String>
     */
    public func getNoteText() -> Optional<String> {
        return self.noteText
    }

    /**
     Getter for Customer_ID.

     - Returns:  Optional<Int>
     */
    public func getCustomerId() -> Optional<Int> {
        return self.customerId
    }

    /**
     Getter for Account_ID.

     - Returns:  Optional<Int>
     */
    public func getAccountId() -> Optional<Int> {
        return self.accountId
    }

    /**
     Getter for Order_ID.

     - Returns:  Optional<Int>
     */
    public func getOrderId() -> Optional<Int> {
        return self.orderId
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

    /**
     Setter for Customer_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerId(_ value: Optional<Int>) -> Self {
        self.customerId = value
        return self
    }

    /**
     Setter for Account_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAccountId(_ value: Optional<Int>) -> Self {
        self.accountId = value
        return self
    }

    /**
     Setter for Order_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOrderId(_ value: Optional<Int>) -> Self {
        self.orderId = value
        return self
    }
}
