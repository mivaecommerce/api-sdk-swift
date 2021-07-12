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

public typealias ClientSignType = TokenAuthenticatorDigestType

/// Client handles sending API Request objects and by default authenticates with the TokenAuthenticator
public class Client : BaseClient {
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
    public init(url : String, apiToken : String, signingKey : String = "", signingType : ClientSignType = ClientSignType.SHA256, requireTimestamps : Bool = true, defaultStoreCode : Optional<String> = nil, session : Optional<URLSession> = nil ) {
        super.init(url: url, authenticator: TokenAuthenticator(apiToken: apiToken, signingKey: signingKey, digestType: signingType), requireTimestamps: requireTimestamps, defaultStoreCode: defaultStoreCode, session: session)
    }

    /**
     Set the signing key from a base64 string.

     - Parameters:
        - key: String
     - Returns: Self
     */
    @discardableResult
    public func setSigningKey( key : String ) -> Self {
        if let tokenAuth = self.authenticator as? TokenAuthenticator {
            tokenAuth.setSigningKey(key: key)
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
        if let tokenAuth = self.authenticator as? TokenAuthenticator {
            tokenAuth.setSigningKey(data: data)
        }

        return self
    }

    /**
     Get the signging key data.

     - Returns: Data
     */
    public func getSigningKey() -> Data {
        if let tokenAuth = self.authenticator as? TokenAuthenticator {
            return tokenAuth.getSigningKey()
        }

        return Data()
    }

    /**
     Set the signing type.

     - Parameters:
        - type: ClientSignType
     - Returns: Self
     */
    @discardableResult
    public func setSigningType(type: ClientSignType) -> Self {
        if let tokenAuth = self.authenticator as? TokenAuthenticator {
            tokenAuth.setDigestType(type: type)
        }
        return self
    }

    /**
     Get the signing key type.

     - Returns: ClientSignType
     */
    public func getSigningType() -> ClientSignType {
        if let tokenAuth = self.authenticator as? TokenAuthenticator {
            return tokenAuth.getDigestType()
        }

        return ClientSignType.NONE
    }

    /**
     Set the api token.

     - Parameters:
        - token: String
     - Returns: Self
     */
    @discardableResult
    public func setApiToken(token: String) -> Self {
        if let tokenAuth = self.authenticator as? TokenAuthenticator {
            tokenAuth.setApiToken(token: token)
        }

        return self
    }

    /**
     Get the api token.

     - Returns: String
     */
    public func getApiToken() -> String {
        if let tokenAuth = self.authenticator as? TokenAuthenticator {
            return tokenAuth.getApiToken()
        }

        return ""
    }
}
