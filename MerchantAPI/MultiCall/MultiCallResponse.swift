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

/**
 API Response for MultiCallRequest.

 - SeeAlso: https://docs.miva.com/json-api/multicall
 */
public class MultiCallResponse : Response {

    /// Array of responses received
    var responses : [Response] = []

    /// Flag set when response was a timeout
    var timeout : Bool = false

    /// Used for processing auto continue feature
    var completed : Int = 0

    /// Used for processing auto continue feature
    var total : Int = 0

    /// Contains the last encountered error when running auto timeout continue
    var continueError : Error? = nil

    /**
     Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    required public init(from decoder: Decoder) throws
    {
        try super.init(from: decoder)

        let request : MultiCallRequest = decoder.userInfo[MultiCallRequest.decoderMultiCallUserInfoKey] as! MultiCallRequest
        var index = 0
        var container = try decoder.unkeyedContainer()

        self.request = request

        if request._initialResponse != nil {
            index = request._initialResponse!.responses.count - 1
        }

        while(index >= 0 && index <= request.getRequests().count - 1)
        {
            do {
                if let operations = request.getRequests()[index] as? MultiCallOperation {
                    var opcontainer = try container.nestedUnkeyedContainer()

                    for req in operations.getRequests() {
                        let response = try opcontainer.decode(req.getResponseType())
                                                
                        self.responses.append(response)

                        if let initRequest = request._initialResponse {
                            initRequest.responses.append(response)
                        }
                    }
                } else if let req = request.getRequests()[index] as? Request {
                    let response = try container.decode(req.getResponseType())
                                        
                    self.responses.append(response)

                    if let initRequest = request._initialResponse {
                        initRequest.responses.append(response)
                    }
                }

                index = index + 1
            } catch {
                break
            }
        }
    }

    /**
     Check if the response was successful.

     - Returns: Bool
     */
    override public func isSuccess() -> Bool {
        if self.isTimeout() {
            return false
        }

        if self.responses.count > 0 {
            for response in self.responses {
                if response.isError() {
                    return false
                }
            }
        }

        return true
    }

    /**
     Check if the response was an error.

     - Returns: Bool
     */
    override public func isError() -> Bool {
        return !self.isSuccess()
    }

    /**
     Check if the response timed out.

     - Returns: Bool
     */
    public func isTimeout() -> Bool {
        return self.timeout
    }

    /**
     Process the auto continue timeout process

     - Returns: void
     */
    public func processContinue() {
        if let mcrequest = self.request as? MultiCallRequest {
            if mcrequest._initialResponse == nil {
                return
            }

            if self.continueError == nil && self.completed != self.total {
                try? mcrequest.send() { cresponse, cerror in
                    if cerror != nil {
                        self.continueError = cerror
                        self.processContinue()
                        return
                    }

                    let httpResponse = cresponse!.httpResponse as! HTTPURLResponse

                    if let rangeValue = httpResponse.allHeaderFields["Content-Range"] {
                        let range = self.readContentRange(range: rangeValue as! String)

                        if range.0 > 0 {
                            self.completed = self.completed + range.0
                        }
                    }

                    if let cb = mcrequest.getAutoCompleteCallback() {
                        cb(self, nil, false)
                    }

                    if (self.completed >= self.total) || mcrequest._initialResponse?.responses.count == self.total {
                        self.completed = self.total
                    }

                    self.processContinue()
                }
            } else {
                if self.continueError == nil {
                    self.timeout = false;
                    mcrequest._initialResponse = nil
                }

                if let cb = mcrequest.getAutoCompleteCallback() {
                    cb(self, self.continueError, self.continueError == nil)
                }

                if let cb = mcrequest._storedCallback {
                   cb(self, nil)
                }

                return
            }
        }
    }

    /**
      Read the content range header and parase out its parts

      - Returns: Tuple(Int, Int)
      */
    public func readContentRange(range: String) -> (Int, Int) {
        let ranges = range.split(separator: "/")

        if ranges.count == 2 {
            let completed = NumberFormatter().number(from: String(ranges[0]))
            let total = NumberFormatter().number(from: String(ranges[1]))

            return (completed?.intValue ?? 0, total?.intValue ?? 0)
        }

        return (0, 0)
    }
}
