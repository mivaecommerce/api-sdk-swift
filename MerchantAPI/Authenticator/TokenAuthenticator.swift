/*
* This file is part of the MerchantAPI package.
*
* (c) Miva Inc <https://www.miva.com/>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

import Foundation
import Cryptor

/// The type of signature requirements for API requests.
public enum TokenAuthenticatorDigestType {
    /// Requests are signed with SHA1 digest.
    case SHA1
    /// Requests are signed with SHA256 digest.
    case SHA256
    /// Request does not require signing.
    case NONE

    /**
     Get the signing type header value from TokenAuthenticatorDigestType

     - Parameters:
     - type: The TokenAuthenticatorDigestType constant to get header prefix of.
     - Returns: String
     */
    static func getHeaderValue(type: TokenAuthenticatorDigestType) -> String {
        switch type {
            case TokenAuthenticatorDigestType.SHA1:       return "MIVA-HMAC-SHA1"
            case TokenAuthenticatorDigestType.SHA256:     return "MIVA-HMAC-SHA256"
            default:                                      return "MIVA"
        }
    }

    static func getAlgorithm(type: TokenAuthenticatorDigestType) -> HMAC.Algorithm {
        switch type {
            case TokenAuthenticatorDigestType.SHA1:    return  HMAC.Algorithm.sha1
            case TokenAuthenticatorDigestType.SHA256:  return  HMAC.Algorithm.sha256
            case TokenAuthenticatorDigestType.NONE:    return  HMAC.Algorithm.sha256
        }
    }
}

public class TokenAuthenticator : Authenticator
{
    /// The API Access Token [String]
    var apiToken           : String = ""

    /// The signing key buffer [Data]
    var signingKey         : Data

    /// The type of signing to apply to requests [TokenAuthenticatorDigestType]
    var digestType        : TokenAuthenticatorDigestType

    public init(apiToken : String, signingKey : String = "", digestType : TokenAuthenticatorDigestType = TokenAuthenticatorDigestType.SHA256) {
        self.apiToken = apiToken
        self.digestType = digestType
        self.signingKey = Data()
        super.init()

        setSigningKey(key: signingKey)
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
            if (key.count % 4 != 0) {
                key += String(repeating: "=", count: (4 - (key.count % 4)))
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
     Set thedigest type.

     - Parameters:
        - type: TokenAuthenticatorDigestType
     - Returns: Self
     */
    @discardableResult
    public func setDigestType(type: TokenAuthenticatorDigestType) -> Self {
        self.digestType = type
        return self
    }

    /**
     Get the digest type

     - Returns: TokenAuthenticatorDigestType
     */
    public func getDigestType() -> TokenAuthenticatorDigestType {
        return self.digestType
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
     Generates the autentication header value

     - Returns: String
     - Throws
     */
    override public func generateAuthenticationHeader(data: String) throws -> String {
        if self.digestType == TokenAuthenticatorDigestType.NONE {
            return String.StringFormat(format:"%@ %@", TokenAuthenticatorDigestType.getHeaderValue(type: self.digestType), self.apiToken)
        }

        return String.StringFormat(format:"%@ %@:%@", TokenAuthenticatorDigestType.getHeaderValue(type: self.digestType), self.apiToken, try! signData(data: data))
    }

    /**
     Signs the given data

     - Returns: String
     - Throws
     */
    override public func signData(data: String) throws -> String {
        let hmac : [UInt8]? = HMAC(
            using: TokenAuthenticatorDigestType.getAlgorithm(type : self.digestType),
            key: [UInt8](self.signingKey)
        ).update(byteArray: CryptoUtils.byteArray(from: data))?.final()

        let signature : Data = CryptoUtils.data(from: hmac!)

        return signature.base64EncodedString()
    }
}
