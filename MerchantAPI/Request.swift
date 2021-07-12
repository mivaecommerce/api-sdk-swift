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

/// The scope of a Request object.
public enum RequestScope {
    case Store
    case Domain
}

/// Errors thrown from Request
public enum RequestError: Error {
    case noClientAssigned
}

public struct RequestEncoderOptions {
    var encodeTimestamp : Bool = true
    var encodeFunction : Bool = true
    var encodeStore : Bool = true
    var isIteration : Bool = false
}

/// The base request object all requests inherit from.
public class Request : Encodable {
    /// The api client instance
    var client : Optional<BaseClient>

    /// The optional api function store code [String]
    var storeCode : Optional<String> = nil

    /// Encoder options
    var encoderOptions : RequestEncoderOptions = RequestEncoderOptions()

    /// SeeAlso: Codable
    private enum CodingKeys: String, CodingKey
    {
        case storeCode = "Store_Code"
        case timestamp = "Miva_Request_Timestamp"
        case function  = "Function"
    }

    /**
     Request Constructor.

     - Parameters:
        - client: The Client to send the request from.
     */
    public init(client: Optional<BaseClient> = nil) {
        self.client = client
    }

    /**
     Gets the scope of the Request.

     - Returns: RequestScope
     - Note: This method must be overridden
     - Throws: When method not overridden by inheritor.
     */
    var scope : RequestScope {
        fatalError("Property Request.scope must be overridden")
    }

    /**
     Gets the API function name of the Request.

     - Returns: String
     - Note: This method must be overridden
     - Throws: When method not overridden by inheritor.
     */
    var function : String {
        fatalError("Property Request.function must be overridden")
    }

    /**
     Gets the API function name of the Request.

     - Returns: String
     - Note: This method must be overridden
     - Throws: When method not overridden by inheritor.
     */
    public func getFunction() -> String {
        return self.function
    }

    /**
     Gets the scope of the request.

     - Returns: RequestScope
     */
    public func getScope() -> RequestScope {
        return self.scope
    }

    /**
     Set the request store code.

     - Parameters:
        - code: Optional<String>.
     - Returns: self
     */
    @discardableResult
    public func setStoreCode(code: Optional<String>) -> Self {
        self.storeCode = code
        return self
    }

    /**
     Get the request store code.

     - Returns: Optional<String>
     */
    public func getStoreCode() -> Optional<String> {
        return self.storeCode
    }

    /**
     Set the request client.

     - Parameters:
        - client: Optional<BaseClient>.
     - Returns: self
     */
    @discardableResult
    public func setClient(client: Optional<BaseClient>) -> Self {
        self.client = client
        return self
    }

    /**
     Get the request client.

     - Returns: Optional<BaseClient>
     */
    public func getClient() -> Optional<BaseClient> {
        return self.client
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encoder: The Encoder instance.
     - Throws: error when unable to encode.
     - SeeAlso: Encodable
     */
    public func encode(to encoder: Encoder) throws {
        if self.encoderOptions.isIteration {
            return
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        if self.encoderOptions.encodeStore {
            if self.scope == RequestScope.Store {
                if self.storeCode != nil {
                    try container.encode(self.storeCode, forKey: .storeCode)
                } else if self.client?.getDefaultStoreCode() != nil {
                    try container.encode(self.client?.getDefaultStoreCode(), forKey: .storeCode)
                }
            }
        }
        
        if self.encoderOptions.encodeFunction {
            try container.encode(self.function, forKey: .function)
        }
        
        if self.encoderOptions.encodeTimestamp && self.client?.getRequireTimestamps() == true {
            try container.encode(Int(Date().timeIntervalSince1970), forKey: .timestamp)
        }        
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCallResponse.

     - Returns: Response.Type
     - SeeAlso: MultiCallResponse
     */
    public func getResponseType() -> Response.Type {
        return Response.self
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Must be overridden
     */
    public func createResponse(httpResponse: URLResponse, data: Data) throws -> Response {
        fatalError("Method Request.createResponse must be overridden")
    }

    /**
     Send the request for a response.

     - Parameters:
         - client: Optional client to send the request from
         - callback: The callback function with signature (Response?, Error?).
     - Note: Must be overridden
     */
    public func send(client: Optional<Client> = nil, callback: @escaping (Response?, Error?) -> ()) throws {
        fatalError("Method Request.send must be overridden")
    }

    /**
        Allows a Request to manipulate the request headers
        - Parameters:
            - headers: The dictionary of headers to manipulate
        - Note: Default behavior does nothing. Override this in your inheriting class to manipulate the HTT Request headers.
     */
    public func processRequestHeaders(headers: inout Dictionary<String, String>) {
        return
    }
}
