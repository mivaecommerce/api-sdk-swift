/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/**
 Handles API Request PrintQueueJob_Status.

 - SeeAlso: https://docs.miva.com/json-api/functions/printqueuejob_status
 */
public class PrintQueueJobStatusRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PrintQueueJob_Status"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field PrintQueueJob_ID.
    var printQueueJobId : Optional<Int>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case printQueueJobId = "PrintQueueJob_ID"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - printQueueJob: An optional PrintQueueJob instance.
     */
    public init(client: Optional<Client> = nil, printQueueJob: Optional<PrintQueueJob> = nil) {
        super.init(client: client)
        if let printQueueJob = printQueueJob {
            if printQueueJob.id > 0 {
                self.printQueueJobId = printQueueJob.id
            }
        }
    }
    
    /**
     Implementation of Encodable.

     - Parameters:
        - encode: A Encoder instance to encode to.
     - Throws: Error when unable to encode the request data.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if self.printQueueJobId != nil {
            try container.encodeIfPresent(self.printQueueJobId, forKey: .printQueueJobId)
        }

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PrintQueueJobStatusResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (PrintQueueJobStatusResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? PrintQueueJobStatusResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? PrintQueueJobStatusResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(data : Data) throws -> PrintQueueJobStatusResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(PrintQueueJobStatusResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PrintQueueJobStatusResponse.self
    }
    
    /**
     Getter for PrintQueueJob_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getPrintQueueJobId() -> Optional<Int> {
        return self.printQueueJobId
    }
    
    /**
     Setter for PrintQueueJob_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPrintQueueJobId(_ value: Optional<Int>) -> Self {
        self.printQueueJobId = value
        return self
    }
}
