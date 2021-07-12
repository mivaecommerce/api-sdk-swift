/*
* This file is part of the MerchantAPI package.
*
* (c) Miva Inc <https://www.miva.com/>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

import Foundation

public enum SSHAgentAuthenticatorError: Error {
    case invalidDigest
    case invalidKey
}

/// The type of signature requirements for API requests.
public enum SSHAgentAuthenticatorDigestType {
    /// Requests are signed with SHA256 digest.
    case SSH_RSA_SHA256
    /// Requests are signed with SHA512 digest.
    case SSH_RSA_SHA512

    /**
     Get the signing type header value from SSHAgentAuthenticatorDigestType

     - Parameters:
     - type: The SSHAgentAuthenticatorDigestType constant to get header prefix of.
     - Returns: String
     */
    static func getHeaderValue(type: SSHAgentAuthenticatorDigestType) -> String {
        switch type {
            case SSHAgentAuthenticatorDigestType.SSH_RSA_SHA256:     return "SSH-RSA-SHA2-256"
            case SSHAgentAuthenticatorDigestType.SSH_RSA_SHA512:     return "SSH-RSA-SHA2-512"
        }
    }
}

public class SSHAgentAuthenticator : Authenticator
{
    /// The API Username [String]
    var username           : String = ""

    /// The private key
    var publicKey         : Data = Data()

    // The digest type
    var digestType        : SSHAgentAuthenticatorDigestType = SSHAgentAuthenticatorDigestType.SSH_RSA_SHA256

    // The agent instance to connect to the local SSH Agent
    var agent        : SSHAgentSignClient

    /**
     Constructor

     - Parameters:
         - username: String
         - publicKeyFile: String
         - agentSocketPath: String, defaults to SSH_AUTH_SOCK environment variable
         - digestType: SSHAgentAuthenticatorDigestType
     - Returns: String
     */
    public init(username : String, publicKeyFile : String = "", agentSocketPath : String = "", digestType : SSHAgentAuthenticatorDigestType = SSHAgentAuthenticatorDigestType.SSH_RSA_SHA256) {
        self.username = username
        self.digestType = digestType
        self.agent = try! SSHAgentSignClient(agentSocketPath: agentSocketPath)
        super.init()

        if (publicKeyFile.count > 0) {
            try! self.setPublicKey(publicKeyFile: publicKeyFile)
        }
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
        let content = try String(contentsOfFile: publicKeyFile, encoding: String.Encoding.utf8)

        if content.contains(" ") {
            let split = content.split(separator: " ")

            if split.count >= 2 {
                self.setPublicKeyString(publicKey: String(split[1]))
            } else {
                throw SSHAgentAuthenticatorError.invalidKey
            }
        } else {
            self.setPublicKeyString(publicKey: content)
        }

        return self
    }

    /**
     Sets the public key from a base64 encoded string
     - Parameters:
         - publicKey: String base64
     - Returns: Self
     */
    @discardableResult
    public func setPublicKeyString(publicKey: String) -> Self
    {
        self.publicKey = Data(base64Encoded: publicKey)!
        return self
    }

    /**
     Gets the public key data

     - Returns: Data
     */
    public func getPublicKey() -> Data {
        return self.publicKey
    }

    /**
     Sets the username
     - Parameters:
         - username: String
     - Returns: Self
     */
    @discardableResult
    public func setUsername(username: String)  -> Self {
        self.username = username
        return self
    }

    /**
     Gets the username

     - Returns: String
     */
    public func getUsername() -> String {
        return self.username
    }

    /**
     Sets the digest type
     - Parameters:
         - digestType: SSHAgentAuthenticatorDigestType
     - Returns: Self
     */
    @discardableResult
    public func setDigestType(digestType: SSHAgentAuthenticatorDigestType)  -> Self {
        self.digestType = digestType
        return self
    }

    /**
     Gets the digest type

     - Returns: SSHAgentAuthenticatorDigestType
     */
    public func getDigestType() -> SSHAgentAuthenticatorDigestType {
        return self.digestType
    }

    /**
     Generates the autentication header value
     - Returns: String
     - Throws
     */
    override public func generateAuthenticationHeader(data: String) throws -> String {
        if self.digestType == SSHAgentAuthenticatorDigestType.SSH_RSA_SHA256 || self.digestType == SSHAgentAuthenticatorDigestType.SSH_RSA_SHA512 {
            return String.StringFormat(format:"%@ %@:%@",
                SSHAgentAuthenticatorDigestType.getHeaderValue(type: self.digestType),
                self.username.data(using: .utf8)!.base64EncodedString(),
                try self.signData(data: data)
            )
        }

        throw SSHAgentAuthenticatorError.invalidDigest
    }

    /**
     Signs the given data
     - Returns: String
     - Throws
     */
    override public func signData(data: String) throws -> String {
        let request = SSHAgentSignRequest()

        request.setPublicKey(data: self.publicKey)
        request.setSignData(data: data.data(using: .utf8)!)

        if self.digestType == SSHAgentAuthenticatorDigestType.SSH_RSA_SHA512 {
            request.setDigestType(type: SSHAgentSignClient.SSH_AGENT_RSA_SHA2_512)
        } else {
            request.setDigestType(type: SSHAgentSignClient.SSH_AGENT_RSA_SHA2_256)
        }

        do {
            try agent.connect()

            let response : SSHAgentSignResponse = try self.agent.send(request: request)

            self.agent.disconnect()

            return response.getSignature().base64EncodedString()
         } catch {
            if agent.isConnected() {
                agent.disconnect()
            }

            throw error
         }
    }
}
