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
 Handles API Request BusinessAccount_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/businessaccount_update
 */
public class BusinessAccountUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "BusinessAccount_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field BusinessAccount_ID.
    var businessAccountId : Optional<Int> = nil

    /// Request field Edit_BusinessAccount.
    var editBusinessAccount : Optional<Int> = nil

    /// Request field BusinessAccount_Title.
    var businessAccountTitle : Optional<String> = nil

    /// Request field BusinessAccount_Tax_Exempt.
    var businessAccountTaxExempt : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case businessAccountId = "BusinessAccount_ID"
        case editBusinessAccount = "Edit_BusinessAccount"
        case businessAccountTitle = "BusinessAccount_Title"
        case businessAccountTaxExempt = "BusinessAccount_Tax_Exempt"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - businessAccount: An optional BusinessAccount instance.
     */
    public init(client: Optional<BaseClient> = nil, businessAccount: Optional<BusinessAccount> = nil) {
        super.init(client: client)
        if let businessAccount = businessAccount {
            if businessAccount.id > 0 {
                self.businessAccountId = businessAccount.id
            }

            self.businessAccountTitle = businessAccount.title
            self.businessAccountTaxExempt = businessAccount.taxExempt
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

        if self.businessAccountId != nil {
            try container.encodeIfPresent(self.businessAccountId, forKey: .businessAccountId)
        } else if self.editBusinessAccount != nil {
            try container.encode(self.editBusinessAccount, forKey: .editBusinessAccount)
        } else if self.businessAccountTitle != nil {
            try container.encode(self.businessAccountTitle, forKey: .businessAccountTitle)
        }

        try container.encodeIfPresent(self.businessAccountTitle, forKey: .businessAccountTitle)
        try container.encodeIfPresent(self.businessAccountTaxExempt, forKey: .businessAccountTaxExempt)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (BusinessAccountUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (BusinessAccountUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? BusinessAccountUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> BusinessAccountUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(BusinessAccountUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return BusinessAccountUpdateResponse.self
    }

    /**
     Getter for BusinessAccount_ID.

     - Returns:  Optional<Int>
     */
    public func getBusinessAccountId() -> Optional<Int> {
        return self.businessAccountId
    }

    /**
     Getter for Edit_BusinessAccount.

     - Returns:  Optional<Int>
     */
    public func getEditBusinessAccount() -> Optional<Int> {
        return self.editBusinessAccount
    }

    /**
     Getter for BusinessAccount_Title.

     - Returns:  Optional<String>
     */
    public func getBusinessAccountTitle() -> Optional<String> {
        return self.businessAccountTitle
    }

    /**
     Getter for BusinessAccount_Tax_Exempt.

     - Returns:  Optional<Bool>
     */
    public func getBusinessAccountTaxExempt() -> Optional<Bool> {
        return self.businessAccountTaxExempt
    }

    /**
     Setter for BusinessAccount_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setBusinessAccountId(_ value: Optional<Int>) -> Self {
        self.businessAccountId = value
        return self
    }

    /**
     Setter for Edit_BusinessAccount.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setEditBusinessAccount(_ value: Optional<Int>) -> Self {
        self.editBusinessAccount = value
        return self
    }

    /**
     Setter for BusinessAccount_Title.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBusinessAccountTitle(_ value: Optional<String>) -> Self {
        self.businessAccountTitle = value
        return self
    }

    /**
     Setter for BusinessAccount_Tax_Exempt.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setBusinessAccountTaxExempt(_ value: Optional<Bool>) -> Self {
        self.businessAccountTaxExempt = value
        return self
    }
}
