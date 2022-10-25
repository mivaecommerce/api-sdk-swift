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

public enum ClientError: Error {
    case authorizationFailed
    case invalidResponse
}

/// Client handles sending API Request objects.
public class BaseClient {
    /// The API Endpoint [URL]
    var url                : URL

    /// The URL Session [URLSession]
    var session : URLSession

    /// The API Access Token [String]
    var authenticator      : Authenticator

    /// An optional default store code to apply [String]
    var defaultStoreCode   : Optional<String>

    /// If timestamps should be applied to requests to prevent replay attacks. [Bool]
    var requireTimestamps  : Bool

    /// An optional logger
    var logger : Optional<Logger> = nil

    /// The timeout for MultiCall operations
    static var defaultOperationTimeout = 60

    var operationTimeout: Int = defaultOperationTimeout

    /// Global headers added into every request
    var globalHeaders : Dictionary<String, String> = [:]
    
    /**
     Client Constructor.

     - Parameters:
         - url:
         - apiToken:
         - signingKey:
         - signingType:
         - requireTimestamps:
         - defaultStoreCode:
     */
    public init(url : String, authenticator: Authenticator, requireTimestamps : Bool = true, defaultStoreCode : Optional<String> = nil, session : Optional<URLSession> = nil ) {
        self.url                 = URL(string: url.trimmingCharacters(in: .whitespaces))!
        self.session             = session ?? URLSession.shared
        self.authenticator       = authenticator
        self.requireTimestamps   = requireTimestamps
        self.defaultStoreCode    = defaultStoreCode
    }

    /**
     Sends a Request object.

     - Parameters:
         - request:
         - callback: Callable(Request, Response?, Error?) callback
     - Returns: void
     */
    public func send(_ request: Request, callback: @escaping (Request, Response?, Error?) -> ()) {
        var headers = self.globalHeaders
        var json : String = ""

        do {
            json = String(data: try JSONEncoder().encode(request), encoding: .utf8)!
        } catch {
            callback(request, nil, error)
            return
        }

        if (self.operationTimeout != Client.defaultOperationTimeout) {
            headers["X-Miva-API-Timeout"] = String(self.operationTimeout)
        }

        request.processRequestHeaders(headers: &headers)

        if let logger = self.logger {
            logger.logRequest(request: request, headers: headers, content: json)
        }

        sendLowLevel(json: json, headers: headers) { httpData, httpResponse, httpError in
            guard let httpData = httpData, httpError == nil else {                
                callback(request, nil, httpError)
                return
            }

            do {
                if let _httpResponse = httpResponse as? HTTPURLResponse {
                    if _httpResponse.statusCode < 200 || _httpResponse.statusCode >= 300 {
                        if let logger = self.logger {
                            logger.logResponse(response: _httpResponse, content: httpData)
                        }

                        if _httpResponse.statusCode == 401 {
                            callback(request, nil, ClientError.authorizationFailed)
                        } else {
                            callback(request, nil, ClientError.invalidResponse)
                        }
                        return
                    }
                }
                 
                let response = try request.createResponse(httpResponse: httpResponse!, data: httpData)

                if let logger = self.logger {
                    logger.logResponse(response: response, content: httpData)
                }
                
                callback(request, response, nil)
            } catch {
                callback(request, nil, error)
            }
        }
    }

    /**
     Send a HTTP Request to the configured endpoint.

     - Parameters:
         - json:
         - callback: Callable(Data?, URLResponse?, Error?) callback
     - Returns: void
     */
    public func sendLowLevel(json: String, headers: Dictionary<String, String> = Dictionary<String, String>(), callback: @escaping (Data?, URLResponse?, Error?) -> ()) {
        var request = URLRequest(url: self.url)

        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.addValue(try generateAuthHeader(data: json), forHTTPHeaderField: "X-Miva-API-Authorization")
        } catch {
            callback(nil, nil, error)
            return
        }
        
        request.httpMethod = "POST"
        request.httpBody   = json.data(using: .utf8)
        
        let task = self.session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                callback(data, response, error)
                return
            }
            
            callback(data, response, nil)
        }
        
        task.resume()
    }

    /**
     Generate the authentication header string.

     - Parameters:
         - data: The string of data to sign
         - callback: Callable(Data?, URLResponse?, Error?) callback
     - Returns: String
     */
    public func generateAuthHeader(data : String) throws -> String {
        return try self.authenticator.generateAuthenticationHeader(data: data)
    }

    /**
     Set the default store code.

     - Parameters:
         - code: String|nil
     - Returns: Self
     */
    @discardableResult
    public func setDefaultStoreCode( code : Optional<String> ) -> Self {
        self.defaultStoreCode = code
        return self
    }

    /**
     Get the default store code.

     - Returns: Optional<String>
     */
    public func getDefaultStoreCode() -> Optional<String> {
        return self.defaultStoreCode
    }

    /**
     Set the authenticator instance.

     - Parameters:
         - code: Authenticator
     - Returns: Self
     */
    @discardableResult
    public func setAuthenticator(authenticator : Authenticator) -> Self {
        self.authenticator = authenticator
        return self
    }

    /**
     Get the authenticator instance.

     - Returns: Authenticator
     */
    public func getAuthenticator() -> Authenticator {
        return self.authenticator
    }

    /**
     Set if the client should include timestamps in requests.

     - Parameters:
        - state: Bool
     - Returns: Self
     */
    @discardableResult
    public func setRequireTimestamps( state : Bool ) -> Self {
        self.requireTimestamps = state
        return self
    }

    /**
     Check if client will include timestamps in requests.

     - Returns: Bool
     */
    public func getRequireTimestamps() -> Bool {
        return self.requireTimestamps
    }

    /**
     Get the api entpoint URL.

     - Returns: URL
     */
    public func getEndpoint() -> URL {
        return self.url
    }

    /**
     Set the api entpoint URL.

     - Parameters:
        - url: String
     - Returns: Self
     - Throws: When invalid URL
     */
    @discardableResult
    public func setEndpoint(url: String) throws -> Self {
        self.url = URL(string: url.trimmingCharacters(in: .whitespaces))!
        return self
    }

    /**
     Get the MultiCall operation timeout.

     - Returns: Int
     */
    public func getOperationTimeout() -> Int {
        return self.operationTimeout
    }

    /**
     Set the MultiCall operation timeout.

     - Parameters:
        - timeout: Int
     - Returns: Self
     */
    @discardableResult
    public func setOperationTimeout(timeout: Int) -> Self {
        self.operationTimeout = timeout
        return self
    }

    /**
     The the logger instance or nil

     - Returns: Optional<Logger>
     */
    public func getLogger() -> Optional<Logger> {
        return self.logger
    }

    /**
     Set or clear the logger instance

     - Parameters:
        - logger: Optional<Logger>
     - Returns: Self
     */
    @discardableResult
    public func setLogger(logger: Optional<Logger>) -> Self {
        self.logger = logger ?? nil
        return self
    }
    
    /**
     Set a global header to be sent with every request

     - Parameters:
        - key: String
        - value: String
     - Returns: Self
     */
    @discardableResult
    public func setGlobalHeader(key: String, value: String) -> Self {
        self.globalHeaders[key] = value
        return self
    }
    
    /**
     Check if a global header is defined

     - Parameters:
        - key: String
     - Returns: Bool
     */
    public func hasGlobalHeader(key: String) -> Bool {
        return self.globalHeaders[key] != nil
    }
    
    /**
     Get a global header or nil if not defined

     - Parameters:
        - key: String
     - Returns: String?
     */
    public func getGlobalHeader(key: String) -> String? {
        return self.globalHeaders[key] ?? nil
    }
    
    /**
     Remove a global header

     - Parameters:
        - key: String
     - Returns: String?
     */
    @discardableResult
    public func removeGlobalHeader(key: String) -> Self {
        self.globalHeaders.removeValue(forKey: key)
        return self
    }
}
