/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: Client.swift 73766 2019-03-05 17:33:13Z gidriss $
 */

import Foundation
import CommonCrypto

/// The type of signature requirements for API requests.
public enum ClientSignType {
    /// Requests are signed with SHA1 digest.
    case SHA1
    /// Requests are signed with SHA256 digest.
    case SHA256
    /// Request does not require signing.
    case NONE
    
    /**
     Get the signing type header value from ClientSignType
     
     - Parameters:
     - type: The ClientSignType constant to get header prefix of.
     - Returns: String
     */
    static func getHeaderValue(type: ClientSignType) -> String {
        switch type {
            case ClientSignType.SHA1:       return "MIVA-HMAC-SHA1"
            case ClientSignType.SHA256:     return "MIVA-HMAC-SHA256"
            default:                        return "MIVA"
        }
    }
    
    /**
     Get CCHmacAlgorithm from ClientSignType
     
     - Parameters:
        - type: The ClientSignType constant to get CCHmacAlgorithm of.
     - Returns: CCHmacAlgorithm
     */
    static func getAlgorithm(type: ClientSignType) -> CCHmacAlgorithm {
        switch type {
            case ClientSignType.SHA1:    return CCHmacAlgorithm(kCCHmacAlgSHA1)
            case ClientSignType.SHA256:  return CCHmacAlgorithm(kCCHmacAlgSHA256)
            case ClientSignType.NONE:    return CCHmacAlgorithm()
        }
    }
    
    /**
     Get the alogrithm digest length from ClientSignType
     
     - Parameters:
        - type: The ClientSignType constant to get length of.
     - Returns: Int
     */
    static func getDigestLength(type: ClientSignType) -> Int {
        switch type {
            case ClientSignType.SHA1:    return Int(CC_SHA1_DIGEST_LENGTH)
            case ClientSignType.SHA256:  return Int(CC_SHA256_DIGEST_LENGTH)
            case ClientSignType.NONE:    return 0
        }
    }
}

/// Client handles sending API Request objects.
public class Client {    
    /// The API Endpoint [URL]
    var url                : URL
    
    /// The HTTP URL Session [URLSession]
    var session            : URLSession
    
    /// The API Access Token [String]
    var apiToken           : String
    
    /// The signing key buffer [Data]
    var signingKey         : Data

    /// The type of signing to apply to requests [ClientSignType]
    var signingType        : ClientSignType
    
    /// An optional default store code to apply [String]
    var defaultStoreCode   : Optional<String>
    
    /// If timestamps should be applied to requests to prevent replay attacks. [Bool]
    var requireTimestamps  : Bool
    
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
    public init(url : String, apiToken : String, signingKey : String = "", signingType : ClientSignType = ClientSignType.SHA256, requireTimestamps : Bool = true, defaultStoreCode : Optional<String> = nil ) {
        self.url                 = URL(string: url.trimmingCharacters(in: .whitespaces))!
        self.session             = URLSession(configuration: URLSessionConfiguration.default)
        self.apiToken            = apiToken
        self.signingType         = signingType
        self.requireTimestamps   = requireTimestamps
        self.defaultStoreCode    = defaultStoreCode
        self.signingKey          = Data()
        
        setSigningKey(key: signingKey)
    }
    
    /**
     Sends a Request object.
     
     - Parameters:
         - request:
         - callback: Callable(Request, Response?, Error?) callback
     - Returns: void
     */
    public func send(_ request: Request, callback: @escaping (Request, Response?, Error?) -> ()) {
        var json : String = ""
 
        do {
            json = String(data: try JSONEncoder().encode(request), encoding: .utf8)!
        } catch {
            callback(request, nil, error)
        }
        
        sendLowLevel(json: json) { httpData, httpResponse, httpError in
            guard let httpData = httpData, httpError == nil else {
                callback(request, nil, httpError)
                return
            }
            
            do {
                let response = try request.createResponse(data : httpData)
                
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
    public func sendLowLevel(json: String, callback: @escaping (Data?, URLResponse?, Error?) -> ()) {
        var request = URLRequest(url: self.url)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(generateAuthHeader(data: json), forHTTPHeaderField: "X-Miva-API-Authorization")
        
        request.httpMethod = "POST"
        request.httpBody   = json.data(using: String.Encoding.utf8)
        
        let task = self.session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                callback(nil, response, error)
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
    public func generateAuthHeader(data : String) -> String {
        if self.signingType == ClientSignType.NONE {
            return String(format:"%@ %@", ClientSignType.getHeaderValue(type: self.signingType), self.apiToken)
        }
        
        let algorithm = ClientSignType.getAlgorithm(type : self.signingType)
        let digestlen = ClientSignType.getDigestLength(type : self.signingType)
        var digest    = Data(count: digestlen)
        
        let _ = digest.withUnsafeMutableBytes { _digest in
            self.signingKey.withUnsafeBytes { _key in
                CCHmac(
                    algorithm,
                    _key,
                    self.signingKey.count,
                    data.cString(using: String.Encoding.utf8),
                    Int(data.lengthOfBytes(using: String.Encoding.utf8)),
                    _digest
                );
            }
        }
        
        return String(format:"%@ %@:%@", ClientSignType.getHeaderValue(type: self.signingType), self.apiToken, digest.base64EncodedString())
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
     Set if the client should include timestamps in requests.
     
     - Parameters:
        - state: Bool
     - Returns: Self
     */
    @discardableResult
    public func setRequireTimesamps( state : Bool ) -> Self {
        self.requireTimestamps = state
        return self
    }
    
    /**
     Check if client will include timestamps in requests.
     
     - Returns: Bool
     */
    public func getRequireTimesamps() -> Bool {
        return self.requireTimestamps
    }
    
    /**
     Set the signing key from a base64 string.
     
     - Parameters:
        - key: String
     - Returns: Self
     */
    @discardableResult
    public func setSigningKey( key : String ) -> Self {
        var key = key
        
        if key.count > 0 {
            if (key.count % 4 != 0){
                key += String(repeating: "=", count: (key.count % 4))
            }
            
            self.signingKey = Data(base64Encoded: key) ?? Data()
        }
        
        return self
    }
    
    /**
     Set the signing key from a data buffer.
     
     - Parameters:
        - data: Data
     - Returns: Self
     */
    @discardableResult
    public func setSigningKey( data : Data ) -> Self {
        self.signingKey = data
        return self
    }
    
    /**
     Get the signging key data.
     
     - Returns: Data
     */
    public func getSigningKey() -> Data {
        return self.signingKey
    }
    
    /**
     Set the signing type.
     
     - Parameters:
        - type: ClientSignType
     - Returns: Self
     */
    @discardableResult
    public func setSigningType(type: ClientSignType) -> Self {
        self.signingType = type
        return self
    }
    
    /**
     Get the signing key type.
     
     - Returns: Data
     */
    public func getSigningType() -> ClientSignType {
        return self.signingType
    }
    
    /**
     Set the api token.
     
     - Parameters:
        - token: String
     - Returns: Self
     */
    @discardableResult
    public func setApiToken(token: String) -> Self {
        self.apiToken = token
        return self
    }
    
    /**
     Get the api token.
     
     - Returns: String
     */
    public func getApiToken() -> String {
        return self.apiToken
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
}
