/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: MultiCallResponse.swift 73766 2019-03-05 17:33:13Z gidriss $
 */

/**
 API Response for MultiCallRequest.
 
 - SeeAlso: https://docs.miva.com/json-api/multicall
 */
public class MultiCallResponse : Response {
    
    /// Array of responses received
    var responses : [Response] = []
    
    /**
     Decodable Constructor.
     
     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    required public init(from decoder: Decoder) throws
    {
        let request : MultiCallRequest = decoder.userInfo[MultiCallRequest.decoderMultiCallUserInfoKey] as! MultiCallRequest
        
        var container = try decoder.unkeyedContainer()

        for r in request.getRequests() {
            if r is MultiCallOperation {
                let operations = r as! MultiCallOperation
                
                var opcontainer = try container.nestedUnkeyedContainer()
                
                for request in operations.getRequests() {
                    let response = try opcontainer.decode(request.getResponseType())
                    
                    self.responses.append(response)
                }
            } else {
                let request = r as! Request
                
                let response = try container.decode(request.getResponseType())
                
                self.responses.append(response)
            }
        }
        
        try super.init(from: decoder)
    }
    
    /**
     Check if the response was successful.
     
     - Returns: Bool
     */
    override public func isSuccess() -> Bool {
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
}
