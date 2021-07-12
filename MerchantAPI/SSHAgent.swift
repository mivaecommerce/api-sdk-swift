/*
* This file is part of the MerchantAPI package.
*
* (c) Miva Inc <https://www.miva.com/>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

import Foundation
import Socket

public class SSHAgentRequest {
    public func pack() throws -> Data {
        fatalError("Must be implemented from inheritor")
    }
}

public class SSHAgentResponse {
    public func unpack(from packet: Data) throws {
        if packet.count == 0 {
            throw SSHAgentSignClientError.InvalidResponseSize
        }

        var totalSize : UInt32 = 0
        _ = withUnsafeMutableBytes(of: &totalSize, { packet.copyBytes(to: $0) })

        if Socket.isLittleEndian {
            totalSize = totalSize.byteSwapped
        }

        if totalSize != packet.count - 4 {
            throw SSHAgentSignClientError.InvalidResponseSize
        }
    }

    required public init() {  }
}

public class SSHAgentKeyListRequest : SSHAgentRequest {
    override public func pack() throws -> Data {
        var packet = Data()

        packet.append(SSHAgentSignClient.SSH_AGENTC_REQUEST_IDENTITIES)

        return packet
    }
}

public class SSHAgentKeyListResponse : SSHAgentResponse {

    public var keys : [SSHAgentKey] = []

    override public func unpack(from packet: Data) throws {
        try super.unpack(from: packet)

        var responseCode : UInt8 = 0
        _ = withUnsafeMutableBytes(of: &responseCode, {
            packet.copyBytes(to: $0, from: Range<Data.Index>(uncheckedBounds: (4, 5)))
        })

        if responseCode != SSHAgentSignClient.SSH_AGENT_IDENTITIES_ANSWER {
            throw SSHAgentSignClientError.InvalidResponse
        }

        var keyCount : UInt32 = 0
        _ = withUnsafeMutableBytes(of: &keyCount, {
            packet.copyBytes(to: $0, from: Range<Data.Index>(uncheckedBounds: (5, 9)))
        })

        if Socket.isLittleEndian {
            keyCount = keyCount.byteSwapped
        }

        var offset = 9

        for _ in 1...keyCount {
            var keyBlob : Data = Data()
            var keyBlobLen : UInt32 = 0
            var comment : Data = Data()
            var commentLen : UInt32 = 0

            _ = withUnsafeMutableBytes(of: &keyBlobLen, {
                packet.copyBytes(to: $0, from: Range<Data.Index>(uncheckedBounds: (offset, offset + 4)))
            })

            if Socket.isLittleEndian {
                keyBlobLen = keyBlobLen.byteSwapped
            }

            offset += 4

            if keyBlobLen > (packet.count - offset) {
                throw SSHAgentSignClientError.InvalidResponse
            }

            keyBlob = Data(repeating: 0, count: Int(keyBlobLen))

            _ = keyBlob.withUnsafeMutableBytes { (ptr: UnsafeMutableRawBufferPointer) in
                packet.copyBytes(to: ptr, from: Range<Data.Index>(uncheckedBounds: (offset, offset + Int(keyBlobLen))))
            }

            if keyBlob.count != keyBlobLen {
                throw SSHAgentSignClientError.InvalidResponse
            }

            offset += Int(keyBlobLen)

            _ = withUnsafeMutableBytes(of: &commentLen, {
                packet.copyBytes(to: $0, from: Range<Data.Index>(uncheckedBounds: (offset, offset + 4)))
            })

            if Socket.isLittleEndian {
                commentLen = commentLen.byteSwapped
            }

            offset += 4

            if commentLen > (packet.count - offset) {
                throw SSHAgentSignClientError.InvalidResponse
            }

            comment = Data(repeating: 0, count: Int(commentLen))

            _ = comment.withUnsafeMutableBytes { (ptr: UnsafeMutableRawBufferPointer) in
                packet.copyBytes(to: ptr, from: Range<Data.Index>(uncheckedBounds: (offset, offset + Int(commentLen))))
            }

            offset += Int(commentLen)

            self.keys.append(SSHAgentKey(keyBlob: keyBlob, comment: String(data: comment, encoding: .utf8) ?? ""))
        }
    }
}

public class SSHAgentSignRequest : SSHAgentRequest {
    public var publicKey : Data = Data()

    public var signData : Data = Data()

    public var digestType : UInt8 = SSHAgentSignClient.SSH_AGENT_RSA_SHA2_256

    override public func pack() -> Data {
        var packet = Data()

        var publicKeyLen : UInt32 = UInt32(self.publicKey.count).bigEndian
        var signDataLen : UInt32 = UInt32(self.signData.count).bigEndian
        var digestType : UInt32 = UInt32(self.digestType).bigEndian

        packet.append(UInt8(SSHAgentSignClient.SSH_AGENTC_SIGN_REQUEST))
        packet.append(Data(bytes: &publicKeyLen, count: MemoryLayout.size(ofValue: publicKeyLen)))
        packet.append(self.publicKey)
        packet.append(Data(bytes: &signDataLen, count: MemoryLayout.size(ofValue: signDataLen)))
        packet.append(self.signData)
        packet.append(Data(bytes: &digestType, count: MemoryLayout.size(ofValue: digestType)))

        return packet
    }

    @discardableResult
    public func setPublicKey(data: Data)  -> Self {
        self.publicKey = data
        return self
    }

    public func getPublicKey() -> Data {
        return self.publicKey
    }

    @discardableResult
    public func setSignData(data: Data)  -> Self {
        self.signData = data
        return self
    }

    public func getSignData() -> Data {
        return self.signData
    }

    @discardableResult
    public func setDigestType(type: UInt8)  -> Self {
        self.digestType = type
        return self
    }

    public func getDigestType() -> UInt8 {
        return self.digestType
    }
}

public class SSHAgentSignResponse : SSHAgentResponse {
    public var signatureType : Data = Data()
    public var signature : Data = Data()

    override public func unpack(from packet: Data) throws {
        try super.unpack(from: packet)

        var responseCode : UInt8 = 0
        _ = withUnsafeMutableBytes(of: &responseCode, {
            packet.copyBytes(to: $0, from: Range<Data.Index>(uncheckedBounds: (4, 5)))
        })

        if responseCode != SSHAgentSignClient.SSH_AGENT_SIGN_RESPONSE {
            throw SSHAgentSignClientError.InvalidResponse
        }

        var totalLen : UInt32 = 0
        var signatureTypeLen : UInt32 = 0
        var signatureLen : UInt32 = 0

        _ = withUnsafeMutableBytes(of: &totalLen, {
            packet.copyBytes(to: $0, from: Range<Data.Index>(uncheckedBounds: (5, 9)))
        })

        if Socket.isLittleEndian {
            totalLen = totalLen.bigEndian
        }

        if totalLen != (packet.count - 9) {
            throw SSHAgentSignClientError.InvalidResponseSize
        }

        var offset = 9

        _ = withUnsafeMutableBytes(of: &signatureTypeLen, {
            packet.copyBytes(to: $0, from: Range<Data.Index>(uncheckedBounds: (offset, offset + 4)))
        })

        if Socket.isLittleEndian {
            signatureTypeLen = signatureTypeLen.bigEndian
        }

        offset += 4

        if signatureTypeLen >= packet.count - offset {
            throw SSHAgentSignClientError.InvalidResponseSize
        }

        self.signatureType = Data(repeating: 0, count: Int(signatureTypeLen))

        _ = self.signatureType.withUnsafeMutableBytes { (ptr: UnsafeMutableRawBufferPointer) in
            packet.copyBytes(to: ptr, from: Range<Data.Index>(uncheckedBounds: (offset, offset + Int(signatureTypeLen))))
        }

        offset += Int(signatureTypeLen)

        _ = withUnsafeMutableBytes(of: &signatureLen, {
            packet.copyBytes(to: $0, from: Range<Data.Index>(uncheckedBounds: (offset, offset + 4)))
        })

        if Socket.isLittleEndian {
            signatureLen = signatureLen.bigEndian
        }

        offset += 4

        if signatureLen > packet.count - offset {
            throw SSHAgentSignClientError.InvalidResponseSize
        }

        self.signature = Data(repeating: 0, count: Int(signatureLen))

        _ = self.signature.withUnsafeMutableBytes { (_signature: UnsafeMutableRawBufferPointer) in
            packet.copyBytes(to: _signature, from: Range<Data.Index>(uncheckedBounds: (offset, offset + Int(signatureLen))))
        }
    }

    public func getSignatureType() -> Data {
        return self.signatureType
    }

    public func getSignature() -> Data {
        return self.signature
    }
}

public class SSHAgentKey
{
    public var keyBlob : Data

    public var comment : String

    public init(keyBlob: Data, comment: String)
    {
        self.keyBlob = keyBlob
        self.comment = comment
    }
}

public enum SSHAgentSignClientError: Error {
    case InvalidSocketPath
    case NotWritable
    case NotReadable
    case InvalidResponse
    case InvalidResponseSize
    case SocketError
    case SocketInterrupted
}

public class SSHAgentSignClient {
    public static let SSH_AGENTC_REQUEST_IDENTITIES : UInt8 = 11
    public static let SSH_AGENTC_SIGN_REQUEST : UInt8 = 13
    public static let SSH_AGENT_FAILURE : UInt8 = 5
    public static let SSH_AGENT_SUCCESS : UInt8 = 5
    public static let SSH_AGENT_IDENTITIES_ANSWER : UInt8 = 12
    public static let SSH_AGENT_SIGN_RESPONSE : UInt8 = 14
    public static let SSH_AGENT_RSA_SHA2_256 : UInt8 = 2
    public static let SSH_AGENT_RSA_SHA2_512 : UInt8 = 4

    public var agentSocketPath : String

    public var signature : Socket.Signature

    public var socket : Socket

    public init(agentSocketPath: Optional<String> = nil) throws {
        if let userPath = agentSocketPath, userPath.count > 0 {
            self.agentSocketPath = userPath
        } else {
            self.agentSocketPath = ProcessInfo.processInfo.environment["SSH_AUTH_SOCK"] ?? ""
        }

        if self.agentSocketPath.count == 0 {
            throw SSHAgentSignClientError.InvalidSocketPath
        }

        self.signature = try Socket.Signature(socketType: .stream, proto: .unix, path: self.agentSocketPath)!
        self.socket = try Socket.create(family: .unix)
    }

    public func connect() throws {
        if self.isConnected() {
            return
        }

        try self.socket.connect(using: self.signature)
        try self.socket.setBlocking(mode: false)
        try self.socket.setWriteTimeout(value: 2000)
        try self.socket.setReadTimeout(value: 2000)
        try self.socket.setReadTimeout(value: 2000)
    }

    public func disconnect() {
        if self.socket.isConnected {
            self.socket.close()
        }
    }

    public func isConnected() -> Bool {
        return self.socket.isConnected
    }

    public func send<T:SSHAgentResponse>(request: SSHAgentRequest) throws -> T {
        let response : T = T()
        let packedRequest = try request.pack()
        var packet = Data()
        var packetDataSize = UInt32(packedRequest.count).bigEndian

        packet.append(Data(bytes: &packetDataSize, count: MemoryLayout.size(ofValue: packetDataSize)))
        packet.append(packedRequest)

        try! self.send(data: packet)

        let receivedData = try self.receive()

        try response.unpack(from: receivedData)

        return response
    }

    @discardableResult
    public func send(data: Data) throws -> Int {
        var writable = false

        (_, writable) = try self.socket.isReadableOrWritable(waitForever: false, timeout: 2000)

        if !writable {
            throw SSHAgentSignClientError.NotWritable
        }

        return try! self.socket.write(from: data)
    }

    public func receive() throws -> Data {
        var data = Data()
        var temp = Data()
        temp.reserveCapacity(8096)

        let maxInterrupts = 4
        var interrupts = 0

        while true {
            do {
                let readable = try self.isSocketReadable(timeout: 2000)

                if (!readable)
                {
                    throw SSHAgentSignClientError.NotReadable
                }

                let bytesRead = try self.socket.read(into: &temp)

                if bytesRead > 0 {
                    data.append(temp)

                    if bytesRead < 8096 {
                        break
                    } else {
                        temp.removeAll(keepingCapacity: true)
                    }
                } else {
                    break
                }
            } catch SSHAgentSignClientError.SocketInterrupted {
                interrupts += 1
                if interrupts < maxInterrupts {
                    continue
                }

                throw SSHAgentSignClientError.SocketError
            }
        }

        return data
    }

    public func isSocketReadable(timeout: UInt = 0) throws -> Bool {
        var count : Int32 = 0
        var readfds = fd_set()
        var timer = timeval()

        if self.socket.socketfd == Socket.SOCKET_INVALID_DESCRIPTOR {
            throw SSHAgentSignClientError.SocketError
        }

        if !self.isConnected() {
            throw SSHAgentSignClientError.SocketError
        }

        readfds.zero()
        readfds.set(self.socket.socketfd)

        if timeout > 0 {
            timer.tv_sec = Int(Double(timeout / 1000))

            let uSecs = Int32(Double(timeout % 1000)) * 1000

            #if os(Linux)
                timer.tv_usec = Int(uSecs)
            #else
                timer.tv_usec = Int32(uSecs)
            #endif
        }

        count = select(self.socket.socketfd + Int32(1), &readfds, nil, nil, &timer)

        if count < 0 {
            if errno == EINTR {
                throw SSHAgentSignClientError.SocketInterrupted
            }

            throw SSHAgentSignClientError.SocketError
        }

        return readfds.isSet(self.socket.socketfd)
    }
}
