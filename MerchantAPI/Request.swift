/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: Request.swift 73830 2019-03-05 23:40:40Z gidriss $
 */

import Foundation

/// The scope of a Request object.
public enum RequestScope {
    case Store
    case Domain
}

/// Errors thrown from Request
public enum RequestError: Error {
    case noClientAssigned
}

/// The base request object all requests inherit from.
public class Request : Encodable {
    /// The api client instance
    var client : Optional<Client>
    
    /// The optional api function store code [String]
    var storeCode : Optional<String>
    
    /// Used for MultiCallOperations
    public var isIteration : Bool = false
    
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
    public init(client: Optional<Client> = nil) {
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
        - client: Optional<String>.
     - Returns: self
     */
    @discardableResult
    public func setClient(client: Optional<Client>) -> Self {
        self.client = client
        return self
    }
    
    /**
     Get the request client.
     
     - Returns: Optional<Client>
     */
    public func getClient() -> Optional<Client> {
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
        if self.isIteration {
            return
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.function, forKey: .function)
        
        if self.scope == RequestScope.Store {
            if self.storeCode != nil {
                try container.encode(self.storeCode, forKey: .storeCode)
            } else if self.client?.getDefaultStoreCode() != nil {
                try container.encode(self.client?.getDefaultStoreCode(), forKey: .storeCode)
            }
        }

        if self.client?.getRequireTimesamps() == true {
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
    public func createResponse(data: Data) throws -> Response {
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
}
