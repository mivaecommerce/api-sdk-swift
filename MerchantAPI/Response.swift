/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/// The base response object all responses inherit from.
public class Response : Decodable {
    /// used to pass context data to decoder
    static var decoderRequestUserInfoKey : CodingUserInfoKey = CodingUserInfoKey(rawValue: "request")!

    /// used to pass context data to decoder
    static var decoderHttpResponseDataUserInfoKey : CodingUserInfoKey = CodingUserInfoKey(rawValue: "http_response")!

    /// used to pass context data to decoder
    static var decoderResponseDataUserInfoKey : CodingUserInfoKey = CodingUserInfoKey(rawValue: "response_data")!

    // Holds the underlying HTTP Response object
    var httpResponse        : URLResponse?

    /// Field success
    var success             : Int

    /// Field error_code
    var errorCode           : String

    /// Field error_message
    var errorMessage        : String

    /// Field input_errors
    var inputErrors         : Bool

    /// Field error_field
    var errorFields         : [[String:String]]

    /// Field
    var errorField          : String

    /// Field
    var errorFieldMessage   : String

    /// Field list_error
    var listError           : Bool

    /// Field input_error
    var inputError          : Bool

    /// Field errors
    var errors              : [[String:String]]

    /// Validation error
    var validationError     : Bool

    /// Holds the initiating request, if set
    var request : Optional<Request>

    /// Holds the response data, if set
    var responseData : Optional<Data>

    /**
     CodingKeys used for decoding the response.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey
    {
        case success
        case errorCode          = "error_code"
        case errorMessage       = "error_message"
        case inputErrors        = "input_errors"
        case errorFields        = "error_fields"
        case errorField         = "error_field"
        case errorFieldMessage  = "error_field_message"
        case listError          = "list_error"
        case inputError         = "input_error"
        case validationError    = "validation_error"
        case errors
    }

    /**
     Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    required public init(from decoder: Decoder) throws
    {
        self.request        = decoder.userInfo[Response.decoderRequestUserInfoKey] as? Request ?? nil
        self.httpResponse   = decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey] as? URLResponse ?? nil
        self.responseData   = decoder.userInfo[Response.decoderResponseDataUserInfoKey] as? Data ?? nil

        if decoder.userInfo[MultiCallRequest.decoderMultiCallUserInfoKey] != nil {
            self.request            = decoder.userInfo[MultiCallRequest.decoderMultiCallUserInfoKey] as? Request ?? nil
            self.success            = 1
            self.errorCode          = ""
            self.errorMessage       = ""
            self.inputErrors        = false
            self.validationError    = false
            self.errorFields        = []
            self.errorField         = ""
            self.errorFieldMessage  = ""
            self.listError          = false
            self.inputError         = false
            self.errors             = []

            return
        }

        let container           = try decoder.container(keyedBy : CodingKeys.self)

        self.success            = try container.decodeIfPresent(Int.self, forKey: .success) ?? 0
        self.errorCode          = try container.decodeIfPresent(String.self, forKey: .errorCode) ?? ""
        self.errorMessage       = try container.decodeIfPresent(String.self, forKey: .errorMessage) ?? ""
        self.inputErrors        = try container.decodeIfPresent(Bool.self, forKey: .inputErrors) ?? false
        self.validationError    = try container.decodeIfPresent(Bool.self, forKey: .validationError) ?? false
        self.errorFields        = try container.decodeIfPresent([[String:String]].self, forKey: .errorFields) ?? []
        self.errorField         = try container.decodeIfPresent(String.self, forKey: .errorField) ?? ""
        self.errorFieldMessage  = try container.decodeIfPresent(String.self, forKey: .errorFieldMessage) ?? ""
        self.listError          = try container.decodeIfPresent(Bool.self, forKey: .listError) ?? false
        self.inputError         = try container.decodeIfPresent(Bool.self, forKey: .inputError) ?? false
        self.errors             = try container.decodeIfPresent([[String:String]].self, forKey: .errors) ?? []
    }

    /**
     Check if the response was successful.

     - Returns: Bool
     */
    public func isSuccess() -> Bool {
        return self.success == 1
    }

    /**
     Check if the response was an error.

     - Returns: Bool
     */
    public func isError() -> Bool {
        return self.success == 0
    }

    /**
     Get the error code.

     - Returns: String
     */
    public func getErrorCode() -> String {
        return self.errorCode
    }

    /**

     Get the error message.

     - Returns: String
     */
    public func getErrorMessage() -> String {
        return self.errorMessage
    }

    /**
     Check if input errors encountered.

     - Returns: Bool
     */
    public func hasInputErrors() -> Bool {
        return self.inputErrors
    }

    /**
     Check if validation error encountered.

     - Returns: Bool
     */
    public func hasValidationError() -> Bool {
        return self.validationError
    }

    /**
     Get an array of error fields.

     - Returns: [[String:String]]
     */
    public func getErrorFields() -> [[String:String]] {
        return self.errorFields
    }

    /**
     Get the error field.

     - Returns: String
     */
    public func getErrorField() -> String {
        return self.errorField
    }

    /**
     Get the error field message.

     - Returns: String
     */
    public func getErrorFieldMessage() -> String {
        return self.errorFieldMessage
    }

    /**
     Check if a list error was encountered.

     - Returns: Bool
     */
    public func hasListError() -> Bool {
        return self.listError
    }

    /**
     Check if it an input error was encountered.

     - Returns: Bool
     */
    public func hasInputError() -> Bool {
        return self.inputError
    }

    /**
     Get an array of errors.

     - Returns:  [[String:String]]
     */
    public func getErrors() -> [[String:String]] {
        return self.errors
    }

    /**
     Get the initiating request.

     - Returns: Optional<Request>
     */
    public func getRequest() -> Optional<Request> {
        return self.request
    }

    /**
     Get the response data buffer.

     - Returns:  Optional<Data>
     */
    public func getData() -> Optional<Data> {
        return self.responseData
    }
}
