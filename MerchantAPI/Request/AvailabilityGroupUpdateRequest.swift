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
 Handles API Request AvailabilityGroup_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/availabilitygroup_update
 */
public class AvailabilityGroupUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AvailabilityGroup_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field AvailabilityGroup_ID.
    var availabilityGroupId : Optional<Int> = nil

    /// Request field Edit_AvailabilityGroup.
    var editAvailabilityGroup : Optional<String> = nil

    /// Request field AvailabilityGroup_Name.
    var availabilityGroupName : Optional<String> = nil

    /// Request field AvailabilityGroup_Tax_Exempt.
    var availabilityGroupTaxExempt : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case availabilityGroupId = "AvailabilityGroup_ID"
        case editAvailabilityGroup = "Edit_AvailabilityGroup"
        case availabilityGroupName = "AvailabilityGroup_Name"
        case availabilityGroupTaxExempt = "AvailabilityGroup_Tax_Exempt"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - availabilityGroup: An optional AvailabilityGroup instance.
     */
    public init(client: Optional<BaseClient> = nil, availabilityGroup: Optional<AvailabilityGroup> = nil) {
        super.init(client: client)
        if let availabilityGroup = availabilityGroup {
            if availabilityGroup.id > 0 {
                self.availabilityGroupId = availabilityGroup.id
            }

            self.availabilityGroupTaxExempt = availabilityGroup.taxExempt
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

        if self.availabilityGroupId != nil {
            try container.encodeIfPresent(self.availabilityGroupId, forKey: .availabilityGroupId)
        } else if self.editAvailabilityGroup != nil {
            try container.encode(self.editAvailabilityGroup, forKey: .editAvailabilityGroup)
        }

        try container.encodeIfPresent(self.availabilityGroupName, forKey: .availabilityGroupName)
        try container.encodeIfPresent(self.availabilityGroupTaxExempt, forKey: .availabilityGroupTaxExempt)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AvailabilityGroupUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AvailabilityGroupUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AvailabilityGroupUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AvailabilityGroupUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AvailabilityGroupUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AvailabilityGroupUpdateResponse.self
    }

    /**
     Getter for AvailabilityGroup_ID.

     - Returns:  Optional<Int>
     */
    public func getAvailabilityGroupId() -> Optional<Int> {
        return self.availabilityGroupId
    }

    /**
     Getter for Edit_AvailabilityGroup.

     - Returns:  Optional<String>
     */
    public func getEditAvailabilityGroup() -> Optional<String> {
        return self.editAvailabilityGroup
    }

    /**
     Getter for AvailabilityGroup_Name.

     - Returns:  Optional<String>
     */
    public func getAvailabilityGroupName() -> Optional<String> {
        return self.availabilityGroupName
    }

    /**
     Getter for AvailabilityGroup_Tax_Exempt.

     - Returns:  Optional<Bool>
     */
    public func getAvailabilityGroupTaxExempt() -> Optional<Bool> {
        return self.availabilityGroupTaxExempt
    }

    /**
     Setter for AvailabilityGroup_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAvailabilityGroupId(_ value: Optional<Int>) -> Self {
        self.availabilityGroupId = value
        return self
    }

    /**
     Setter for Edit_AvailabilityGroup.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditAvailabilityGroup(_ value: Optional<String>) -> Self {
        self.editAvailabilityGroup = value
        return self
    }

    /**
     Setter for AvailabilityGroup_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAvailabilityGroupName(_ value: Optional<String>) -> Self {
        self.availabilityGroupName = value
        return self
    }

    /**
     Setter for AvailabilityGroup_Tax_Exempt.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setAvailabilityGroupTaxExempt(_ value: Optional<Bool>) -> Self {
        self.availabilityGroupTaxExempt = value
        return self
    }
}
