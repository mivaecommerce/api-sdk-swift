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
 Handles API Request Option_Set_Default.

 - SeeAlso: https://docs.miva.com/json-api/functions/option_set_default
 */
public class OptionSetDefaultRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Option_Set_Default"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Option_ID.
    var optionId : Optional<Int> = nil

    /// Request field Option_Code.
    var optionCode : Optional<String> = nil

    /// Request field Attribute_ID.
    var attributeId : Optional<Int> = nil

    /// Request field Option_Default.
    var optionDefault : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case optionId = "Option_ID"
        case optionCode = "Option_Code"
        case attributeId = "Attribute_ID"
        case optionDefault = "Option_Default"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - productOption: An optional ProductOption instance.
     */
    public init(client: Optional<BaseClient> = nil, productOption: Optional<ProductOption> = nil) {
        super.init(client: client)
        if let productOption = productOption {
            if productOption.id > 0 {
                self.optionId = productOption.id
            } else if productOption.code.count > 0 {
                self.optionCode = productOption.code
            }

            if productOption.attributeId > 0 {
                self.attributeId = productOption.attributeId
            }

            self.optionCode = productOption.code
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

        if self.optionId != nil {
            try container.encodeIfPresent(self.optionId, forKey: .optionId)
        } else if self.optionCode != nil {
            try container.encode(self.optionCode, forKey: .optionCode)
        }

        if self.attributeId != nil {
            try container.encodeIfPresent(self.attributeId, forKey: .attributeId)
        }

        try container.encodeIfPresent(self.optionCode, forKey: .optionCode)
        try container.encodeIfPresent(self.optionDefault, forKey: .optionDefault)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OptionSetDefaultResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OptionSetDefaultResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OptionSetDefaultResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OptionSetDefaultResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OptionSetDefaultResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OptionSetDefaultResponse.self
    }

    /**
     Getter for Option_ID.

     - Returns:  Optional<Int>
     */
    public func getOptionId() -> Optional<Int> {
        return self.optionId
    }

    /**
     Getter for Option_Code.

     - Returns:  Optional<String>
     */
    public func getOptionCode() -> Optional<String> {
        return self.optionCode
    }

    /**
     Getter for Attribute_ID.

     - Returns:  Optional<Int>
     */
    public func getAttributeId() -> Optional<Int> {
        return self.attributeId
    }

    /**
     Getter for Option_Default.

     - Returns:  Optional<Bool>
     */
    public func getOptionDefault() -> Optional<Bool> {
        return self.optionDefault
    }

    /**
     Setter for Option_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setOptionId(_ value: Optional<Int>) -> Self {
        self.optionId = value
        return self
    }

    /**
     Setter for Option_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setOptionCode(_ value: Optional<String>) -> Self {
        self.optionCode = value
        return self
    }

    /**
     Setter for Attribute_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAttributeId(_ value: Optional<Int>) -> Self {
        self.attributeId = value
        return self
    }

    /**
     Setter for Option_Default.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setOptionDefault(_ value: Optional<Bool>) -> Self {
        self.optionDefault = value
        return self
    }
}
