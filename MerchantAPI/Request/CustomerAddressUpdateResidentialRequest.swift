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
 Handles API Request CustomerAddress_Update_Residential.

 - SeeAlso: https://docs.miva.com/json-api/functions/customeraddress_update_residential
 */
public class CustomerAddressUpdateResidentialRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CustomerAddress_Update_Residential"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Address_ID.
    var addressId : Optional<Int> = nil

    /// Request field CustomerAddress_ID.
    var customerAddressId : Optional<Int> = nil

    /// Request field Residential.
    var residential : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case addressId = "Address_ID"
        case customerAddressId = "CustomerAddress_ID"
        case residential = "Residential"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - customerAddress: An optional CustomerAddress instance.
     */
    public init(client: Optional<BaseClient> = nil, customerAddress: Optional<CustomerAddress> = nil) {
        super.init(client: client)
        if let customerAddress = customerAddress {
            if customerAddress.id > 0 {
                self.addressId = customerAddress.id
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

        if self.addressId != nil {
            try container.encodeIfPresent(self.addressId, forKey: .addressId)
        } else if self.customerAddressId != nil {
            try container.encode(self.customerAddressId, forKey: .customerAddressId)
        }

        try container.encodeIfPresent(self.residential, forKey: .residential)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CustomerAddressUpdateResidentialResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CustomerAddressUpdateResidentialResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CustomerAddressUpdateResidentialResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CustomerAddressUpdateResidentialResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CustomerAddressUpdateResidentialResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CustomerAddressUpdateResidentialResponse.self
    }

    /**
     Getter for Address_ID.

     - Returns:  Optional<Int>
     */
    public func getAddressId() -> Optional<Int> {
        return self.addressId
    }

    /**
     Getter for CustomerAddress_ID.

     - Returns:  Optional<Int>
     */
    public func getCustomerAddressId() -> Optional<Int> {
        return self.customerAddressId
    }

    /**
     Getter for Residential.

     - Returns:  Optional<Bool>
     */
    public func getResidential() -> Optional<Bool> {
        return self.residential
    }

    /**
     Setter for Address_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAddressId(_ value: Optional<Int>) -> Self {
        self.addressId = value
        return self
    }

    /**
     Setter for CustomerAddress_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerAddressId(_ value: Optional<Int>) -> Self {
        self.customerAddressId = value
        return self
    }

    /**
     Setter for Residential.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setResidential(_ value: Optional<Bool>) -> Self {
        self.residential = value
        return self
    }
}
