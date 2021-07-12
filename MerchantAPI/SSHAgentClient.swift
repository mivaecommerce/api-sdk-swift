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

public typealias SSHAgentClientDigestType = SSHAgentAuthenticatorDigestType

public class SSHAgentClient : BaseClient {
    /**
     Client Constructor.

     - Parameters:
         - url:
         - username:
         - privateKeyFile:
         - agentSocketPath:
         - digestType:
         - requireTimestamps:
         - defaultStoreCode:
     */
    public init(url : String, username : String, publicKeyFile : String, agentSocketPath : String, digestType : SSHAgentClientDigestType = SSHAgentClientDigestType.SSH_RSA_SHA256, requireTimestamps : Bool = true, defaultStoreCode : Optional<String> = nil, session : Optional<URLSession> = nil) {
        super.init(url: url, authenticator: SSHAgentAuthenticator(username: username, publicKeyFile: publicKeyFile, agentSocketPath: agentSocketPath, digestType: digestType), requireTimestamps: requireTimestamps, defaultStoreCode: defaultStoreCode, session: session)
    }

    /**
     Sets the public key from a file. View the readme for compatible formats.
     - Parameters:
         - publicKeyFile: String
     - Returns: String
     */
    @discardableResult
    public func setPublicKey(publicKeyFile: String) throws -> Self
    {
        if let auth = self.authenticator as? SSHAgentAuthenticator {
            try auth.setPublicKey(publicKeyFile: publicKeyFile)
        }

        return self
    }

    /**
     Gets the public key data

     - Returns: Data
     */
    public func getPublicKey() -> Data {
        if let auth = self.authenticator as? SSHAgentAuthenticator {
            return auth.getPublicKey()
        }

        return Data()
    }

    /**
     Sets the username
     - Parameters:
         - username: String
     - Returns: Self
     */
    @discardableResult
    public func setUsername(username: String)  -> Self {
        if let auth = self.authenticator as? SSHAgentAuthenticator {
            auth.setUsername(username: username)
        }
        return self
    }

    /**
     Gets the username

     - Returns: String
     */
    public func getUsername() -> String {
        if let auth = self.authenticator as? SSHAgentAuthenticator {
            return auth.getUsername()
        }

        return String()
    }

    /**
     Sets the digest type
     - Parameters:
         - digestType: SSHAgentAuthenticatorDigestType
     - Returns: Self
     */
    @discardableResult
    public func setDigestType(digestType: SSHAgentAuthenticatorDigestType)  -> Self {
        if let auth = self.authenticator as? SSHAgentAuthenticator {
            auth.setDigestType(digestType: digestType)
        }

        return self
    }

    /**
     Gets the digest type

     - Returns: SSHAgentAuthenticatorDigestType
     */
    public func getDigestType() -> SSHAgentAuthenticatorDigestType {
        if let auth = self.authenticator as? SSHAgentAuthenticator {
            return auth.getDigestType()
        }

        return SSHAgentAuthenticatorDigestType.SSH_RSA_SHA256
    }
}
