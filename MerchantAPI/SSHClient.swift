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

public typealias SSHClientDigestType = SSHPrivateKeyAuthenticatorDigestType

public class SSHClient : BaseClient {
    /**
     Client Constructor.

     - Parameters:
         - url:
         - username:
         - privateKeyFile:
         - privateKeyPassword:
         - digestType:
         - requireTimestamps:
         - defaultStoreCode:
     */
    public init(url : String, username : String, privateKeyFile : String, privateKeyPassword : String, digestType : SSHClientDigestType = SSHClientDigestType.SSH_RSA_SHA256, requireTimestamps : Bool = true, defaultStoreCode : Optional<String> = nil, session : Optional<URLSession> = nil) {
        super.init(url: url, authenticator: SSHPrivateKeyAuthenticator(username: username, privateKeyFile: privateKeyFile, privateKeyPassword: privateKeyPassword, digestType: digestType), requireTimestamps: requireTimestamps, defaultStoreCode: defaultStoreCode, session: session)
    }

    /**
     Sets the public key from a file. View the readme for compatible formats.
     - Parameters:
         - privateKeyPath: String
         - privateKeyPassword: String
     - Returns: String
     */
    @discardableResult
    public func setPrivateKey(privateKeyPath: String, privateKeyPassword: String) throws -> Self
    {
        if let auth = self.authenticator as? SSHPrivateKeyAuthenticator {
            try auth.setPrivateKey(privateKeyPath: privateKeyPath, privateKeyPassword: privateKeyPassword)
        }

        return self
    }

    /**
     Sets the username
     - Parameters:
         - username: String
     - Returns: Self
     */
    @discardableResult
    public func setUsername(username: String)  -> Self {
        if let auth = self.authenticator as? SSHPrivateKeyAuthenticator {
            auth.setUsername(username: username)
        }
        return self
    }

    /**
     Gets the username

     - Returns: String
     */
    public func getUsername() -> String {
        if let auth = self.authenticator as? SSHPrivateKeyAuthenticator {
            return auth.getUsername()
        }

        return String()
    }

    /**
     Sets the digest type
     - Parameters:
         - digestType: SSHPrivateKeyAuthenticatorDigestType
     - Returns: Self
     */
    @discardableResult
    public func setDigestType(digestType: SSHPrivateKeyAuthenticatorDigestType)  -> Self {
        if let auth = self.authenticator as? SSHPrivateKeyAuthenticator {
            auth.setDigestType(digestType: digestType)
        }

        return self
    }

    /**
     Gets the digest type

     - Returns: SSHPrivateKeyAuthenticatorDigestType
     */
    public func getDigestType() -> SSHPrivateKeyAuthenticatorDigestType {
        if let auth = self.authenticator as? SSHPrivateKeyAuthenticator {
            return auth.getDigestType()
        }

        return SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA256
    }
}
