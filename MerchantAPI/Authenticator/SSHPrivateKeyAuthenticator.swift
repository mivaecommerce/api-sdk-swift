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
import CryptorRSA

public enum SSHPrivateKeyAuthenticatorError: Error {
    case invalidDigest
}

/// The type of signature requirements for API requests.
public enum SSHPrivateKeyAuthenticatorDigestType {
    /// Requests are signed with SHA256 digest.
    case SSH_RSA_SHA256
    /// Requests are signed with SHA512 digest.
    case SSH_RSA_SHA512

    /**
     Get the signing type header value from SSHPrivateKeyAuthenticatorDigestType

     - Parameters:
     - type: The ClientSignType constant to get header prefix of.
     - Returns: String
     */
    static func getHeaderValue(type: SSHPrivateKeyAuthenticatorDigestType) -> String {
        switch type {
            case SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA256:     return "SSH-RSA-SHA2-256"
            case SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA512:     return "SSH-RSA-SHA2-512"
        }
    }
}

@available(macOS, introduced: 10.12)
public class SSHPrivateKeyAuthenticator : Authenticator
{
    /// The API Username [String]
    var username           : String = ""

    /// The private key
    var privateKey         : Optional<CryptorRSA.PrivateKey> = nil

    /// The type of signing to apply to requests
    var digestType        : SSHPrivateKeyAuthenticatorDigestType = SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA256

    /**
     Constructor

     - Parameters:
         - username: String
         - privateKeyFile: String
         - privateKeyPassword: String
         - digestType: SSHPrivateKeyAuthenticatorDigestType
     - Returns: String
     */
    public init(username : String, privateKeyFile : String = "", privateKeyPassword : String = "", digestType : SSHPrivateKeyAuthenticatorDigestType = SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA256) {
        self.username = username
        self.digestType = digestType
        super.init()

        if (privateKeyFile.count > 0) {
            try! self.setPrivateKey(privateKeyPath: privateKeyFile, privateKeyPassword: privateKeyPassword)
        }
    }

    /**
     Set the private key from a file
     - Parameters:
         - privateKeyFile: String
         - privateKeyPassword: String
     - Returns: Self
     */
    @discardableResult
    public func setPrivateKey(privateKeyPath: String, privateKeyPassword: String = "") throws -> Self {
        let content = try! String(contentsOfFile: privateKeyPath, encoding: .utf8)
        var decrypted : [UInt8]? = []

        if content.starts(with: "-----BEGIN RSA PRIVATE KEY-----") && content.range(of: "ENCRYPTED", options: .caseInsensitive) != nil {
            let pem = try! RSAUtil.parseEncryptedPEM_PKCS1(pemString: content)
            let key : [UInt8] = RSAUtil.deriveKey(password: privateKeyPassword, salt: [UInt8](Data(bytes: pem.iv, count: 8)), keySize: pem.algorithm!.defaultKeySize)

            decrypted = try! Cryptor(
                operation:.decrypt,
                algorithm: pem.algorithm!,
                options: pem.options,
                key: key,
                iv: pem.iv
            ).update(byteArray: [UInt8](pem.encryptedData))!.final()

            self.privateKey = try! CryptorRSA.createPrivateKey(with: CryptoUtils.data(from: decrypted!))
        } else {
            self.privateKey = try! CryptorRSA.createPrivateKey(withPEM: content)
        }

        return self
    }

    /**
     Get the current private key instance
     - Returns: Optional<CryptorRSA.PrivateKey>
     */
    public func getPrivateKey() -> Optional<CryptorRSA.PrivateKey>  {
        return self.privateKey
    }

    /**
     Set the username
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
     Get the current username
     - Returns: String
     */
    public func getUsername() -> String {
        return self.username
    }

    /**
     Set the digest type
     - Parameters:
         - digestType: SSHPrivateKeyAuthenticatorDigestType
     - Returns: Self
     */
    @discardableResult
    public func setDigestType(digestType: SSHPrivateKeyAuthenticatorDigestType)  -> Self {
        self.digestType = digestType
        return self
    }

    /**
     Get the current digest type
     - Returns: SSHPrivateKeyAuthenticatorDigestType
     */
    public func getDigestType() -> SSHPrivateKeyAuthenticatorDigestType {
        return self.digestType
    }

    /**
     Generates the autentication header value
     - Returns: String
     - Throws
     */
    override public func generateAuthenticationHeader(data: String) throws -> String {
        if self.digestType == SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA256 || self.digestType == SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA512 {
            return String.StringFormat(format:"%@ %@:%@",
                SSHPrivateKeyAuthenticatorDigestType.getHeaderValue(type: self.digestType),
                self.username.data(using: .utf8)!.base64EncodedString(),
                try! self.signData(data: data)
            )
        }

        throw SSHPrivateKeyAuthenticatorError.invalidDigest
    }

    /**
     Signs the given data
     - Returns: String
     - Throws
     */
    override public func signData(data: String) throws -> String {
        let message = CryptorRSA.createPlaintext(with: data.data(using: .utf8)!)

        if self.digestType == SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA256 {
            return try! message.signed(with: self.privateKey!, algorithm: .sha256)?.base64String ?? ""
        } else if self.digestType == SSHPrivateKeyAuthenticatorDigestType.SSH_RSA_SHA512 {
            return try! message.signed(with: self.privateKey!, algorithm: .sha512)?.base64String ?? ""
        }

        throw SSHPrivateKeyAuthenticatorError.invalidDigest
    }
}

/**
 Holds the parsed pem data from an encrypted pkcs1 pem file
 */
public struct EncryptedPEM {
    public var algorithm : Optional<Cryptor.Algorithm> = nil

    public var options : Cryptor.Options = Cryptor.Options.none

    public var iv : [UInt8] = [UInt8]()

    public var procType : String = ""

    public var dekInfo : String = ""

    public var encryptedData : Data = Data()
}

public enum PEMParseError: Error {
    case badCipher
    case badIV
    case badData
    case badKey
    case badPassword
}

public class RSAUtil {
    /**
     Derives a compatible key to decrypt the rsa private key blob

     - Parameters:
         - password: String
         - salt: [UInt8]
         - keySize: Int
     - Returns: [UInt8]
     */
    public static func deriveKey(password: String, salt: [UInt8], keySize: Int) -> [UInt8] {
        var digest : Data = Data()
        var key : Data = Data(capacity: keySize)
        let saltData : Data = CryptoUtils.data(from: salt)

        while key.count < keySize {
            let md5 = Digest(using: .md5)

            let iterdigest = md5.update(data: digest)!
                .update(string: password)!
                .update(data: saltData)!
                .final()

            digest = Data(iterdigest)

            if key.count + digest.count > keySize {
                key.append(iterdigest, count: keySize - key.count)
            } else {
                key.append(contentsOf: iterdigest)
            }
        }

        return [UInt8](key)
    }

    /**
     Parses an encrypted pkcs1 pem file

     - Parameters:
         - pemString: String
     - Returns: EncryptedPEM
     - Throws
     */
    public static func parseEncryptedPEM_PKCS1(pemString: String) throws -> EncryptedPEM {
        var parsed = EncryptedPEM()
        var base64Data = ""

        for line in pemString.components(separatedBy: .newlines) {
            if line.isEmpty || line.contains("BEGIN RSA PRIVATE KEY") || line.contains("END RSA PRIVATE KEY") {
               continue
            } else if let match = line.range(of: "Proc-Type:", options: .caseInsensitive) {
                parsed.procType = line
                parsed.procType.removeSubrange(match)
                parsed.procType = parsed.procType.trimmingCharacters(in: .whitespacesAndNewlines)
            } else if let match = line.range(of: "DEK-Info:", options: .caseInsensitive) {
                parsed.dekInfo = line
                parsed.dekInfo.removeSubrange(match)
                parsed.dekInfo = parsed.dekInfo.trimmingCharacters(in: .whitespacesAndNewlines)
            } else {
                base64Data.append(line.trimmingCharacters(in: .whitespacesAndNewlines))
            }
        }

        if (base64Data.count == 0) {
            throw PEMParseError.badData
        }

        parsed.encryptedData = Data(base64Encoded: base64Data)!

        if (parsed.dekInfo.count == 0) {
            throw PEMParseError.badData
        }

        let dekinfoParts = parsed.dekInfo.split(separator: ",")

        if dekinfoParts.count == 1 || dekinfoParts.count > 3 {
            throw PEMParseError.badCipher
        }

        let cipherInfo = String(dekinfoParts[0]).uppercased()

        if cipherInfo.isEmpty {
            throw PEMParseError.badCipher
        }

        if cipherInfo.starts(with: "AES"){
            if cipherInfo.starts(with: "AES-128") {
                parsed.algorithm = Cryptor.Algorithm.aes128
            } else if cipherInfo.starts(with: "AES-192") {
               parsed.algorithm = Cryptor.Algorithm.aes192
           } else if cipherInfo.starts(with: "AES-256") {
               parsed.algorithm = Cryptor.Algorithm.aes256
           }
        }
        else if cipherInfo.starts(with: "DES"){
            parsed.algorithm = Cryptor.Algorithm.des

            if cipherInfo.starts(with: "DES-EDE3") {
                parsed.algorithm = Cryptor.Algorithm.tripleDes
            }
        }

        if cipherInfo.contains("ECB") {
            parsed.options = Cryptor.Options.ecbMode
        }

        if parsed.algorithm == nil {
            throw PEMParseError.badCipher
        }

        let iv = String(dekinfoParts[1])

        if iv.isEmpty {
            throw PEMParseError.badIV
        }

        parsed.iv = CryptoUtils.byteArray(fromHex: iv)

        if parsed.iv.count != parsed.algorithm!.blockSize {
            throw PEMParseError.badIV
        }

        if parsed.encryptedData.count % parsed.algorithm!.blockSize != 0 {
            throw PEMParseError.badData
        }

        return parsed
    }
}
