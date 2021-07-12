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
 Handles API Request AvailabilityGroup_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/availabilitygroup_insert
 */
public class AvailabilityGroupInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AvailabilityGroup_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

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
        case availabilityGroupName = "AvailabilityGroup_Name"
        case availabilityGroupTaxExempt = "AvailabilityGroup_Tax_Exempt"
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

        try container.encodeIfPresent(self.availabilityGroupName, forKey: .availabilityGroupName)
        try container.encodeIfPresent(self.availabilityGroupTaxExempt, forKey: .availabilityGroupTaxExempt)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AvailabilityGroupInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (AvailabilityGroupInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? AvailabilityGroupInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> AvailabilityGroupInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(AvailabilityGroupInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AvailabilityGroupInsertResponse.self
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
