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

public class Logger
{
    public func logRequest(request: Request, headers: Dictionary<String, String>, content: String) {
        if headers.count > 0 {
            self.writeLine(data: String.StringFormat(format:"\r\n============= Request: %@ [HEADERS] =============\r\n", request.getFunction()))

            for (k,v) in headers {
                self.writeLine(data: String.StringFormat(format: "%@ = %@", k, v))
            }
        }
        self.writeLine(data: String.StringFormat(format:"\r\n============= Request: %@ [BODY] =============\r\n", request.getFunction()))
        self.writeLine(data: content)
    }

    public func logResponse(response: Response, content: Data) {
        if let request = response.getRequest() {
            self.writeLine(data: String.StringFormat(format:"\r\n============= Response: %@ [HEADERS] =============\r\n", request.getFunction()))

            if let httpResponse = response.httpResponse as? HTTPURLResponse {
                 for header in httpResponse.allHeaderFields {
                     self.writeLine(data: String.StringFormat(format:"%@ = %@", header.key as? String ?? "", header.value as? String ?? ""))
                 }
             }

            self.writeLine(data: String.StringFormat(format:"\r\n============= Response: %@ [BODY] =============\r\n", request.getFunction()))
            self.writeLine(data: String(data: content, encoding: .utf8) ?? "")
        }
    }
    
    public func logResponse(response: HTTPURLResponse, content: Data) {
        for header in response.allHeaderFields {
            self.writeLine(data: String.StringFormat(format:"%@ = %@", header.key as? String ?? "", header.value as? String ?? ""))
        }

        self.writeLine(data: "\r\n============= Response: [BODY] =============\r\n")
        self.writeLine(data: String(data: content, encoding: .utf8) ?? "")
    }
    
    public func write(data: String) {
        fatalError("Method Logger.write must be overridden")
    }

    public func writeLine(data: String) {
        fatalError("Method Logger.writeLine must be overridden")
    }
}

public class ConsoleLogger : Logger
{
    public enum OutputDestination {
        case StdOut
        case StdErr
    }

    public var destination : OutputDestination = OutputDestination.StdOut

    public init(destination: OutputDestination = OutputDestination.StdOut) {
        self.destination = destination
    }

    public override func write(data: String) {
        if self.destination == OutputDestination.StdErr {
            FileHandle.standardError.write(Data(data.utf8))
        } else {
            FileHandle.standardOutput.write(Data(data.utf8))
        }
    }

    public override func writeLine(data: String) {
        self.write(data: data + "\r\n")
    }
}

public class FileLogger : Logger
{
    var filePath : String
    var handle : FileHandle?

    public init(filePath: String) {
        self.filePath = filePath
        self.handle = FileHandle(forWritingAtPath: filePath)

        if let handle = self.handle {
            handle.seekToEndOfFile()
        }
    }

    public override func write(data: String) {
        if let handle = self.handle {
            handle.write(data.data(using: .utf8) ?? Data())
        }
    }

    public override func writeLine(data: String) {
        self.write(data: data + "\r\n")
    }
}
