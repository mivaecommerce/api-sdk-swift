/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: PrintQueueJobInsertRequest.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 Handles API Request PrintQueueJob_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/printqueuejob_insert
 */
public class PrintQueueJobInsertRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PrintQueueJob_Insert"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field PrintQueue_ID.
    var printQueueId : Optional<Int>

    /// Request field Edit_PrintQueue.
    var editPrintQueue : Optional<String>

    /// Request field PrintQueue_Description.
    var printQueueDescription : Optional<String>

    /// Request field PrintQueueJob_Description.
    var printQueueJobDescription : Optional<String>

    /// Request field PrintQueueJob_Format.
    var printQueueJobFormat : Optional<String>

    /// Request field PrintQueueJob_Data.
    var printQueueJobData : Optional<String>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case printQueueId = "PrintQueue_ID"
        case editPrintQueue = "Edit_PrintQueue"
        case printQueueDescription = "PrintQueue_Description"
        case printQueueJobDescription = "PrintQueueJob_Description"
        case printQueueJobFormat = "PrintQueueJob_Format"
        case printQueueJobData = "PrintQueueJob_Data"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - printQueue: An optional PrintQueue instance.
     */
    public init(client: Optional<Client> = nil, printQueue: Optional<PrintQueue> = nil) {
        super.init(client: client)
        if let printQueue = printQueue {
            if printQueue.id > 0 {
                self.printQueueId = printQueue.id
            } else if printQueue.description.count > 0 {
                self.editPrintQueue = printQueue.description
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

        if self.printQueueId != nil {
            try container.encodeIfPresent(self.printQueueId, forKey: .printQueueId)
        } else if self.editPrintQueue != nil {
            try container.encode(self.editPrintQueue, forKey: .editPrintQueue)
        } else if self.printQueueDescription != nil {
            try container.encode(self.printQueueDescription, forKey: .printQueueDescription)
        }

        try container.encodeIfPresent(self.printQueueJobDescription, forKey: .printQueueJobDescription)
        try container.encodeIfPresent(self.printQueueJobFormat, forKey: .printQueueJobFormat)
        try container.encodeIfPresent(self.printQueueJobData, forKey: .printQueueJobData)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PrintQueueJobInsertResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (PrintQueueJobInsertResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? PrintQueueJobInsertResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? PrintQueueJobInsertResponse, error)
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
    public override func createResponse(data : Data) throws -> PrintQueueJobInsertResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(PrintQueueJobInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PrintQueueJobInsertResponse.self
    }
    
    /**
     Getter for PrintQueue_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getPrintQueueId() -> Optional<Int> {
        return self.printQueueId
    }
    
    /**
     Getter for Edit_PrintQueue.

     - Returns:  Optional<String> 
     */
    public func getEditPrintQueue() -> Optional<String> {
        return self.editPrintQueue
    }
    
    /**
     Getter for PrintQueue_Description.

     - Returns:  Optional<String> 
     */
    public func getPrintQueueDescription() -> Optional<String> {
        return self.printQueueDescription
    }
    
    /**
     Getter for PrintQueueJob_Description.

     - Returns:  Optional<String> 
     */
    public func getPrintQueueJobDescription() -> Optional<String> {
        return self.printQueueJobDescription
    }
    
    /**
     Getter for PrintQueueJob_Format.

     - Returns:  Optional<String> 
     */
    public func getPrintQueueJobFormat() -> Optional<String> {
        return self.printQueueJobFormat
    }
    
    /**
     Getter for PrintQueueJob_Data.

     - Returns:  Optional<String> 
     */
    public func getPrintQueueJobData() -> Optional<String> {
        return self.printQueueJobData
    }
    
    /**
     Setter for PrintQueue_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPrintQueueId(_ value: Optional<Int>) -> Self {
        self.printQueueId = value
        return self
    }
    
    /**
     Setter for Edit_PrintQueue.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditPrintQueue(_ value: Optional<String>) -> Self {
        self.editPrintQueue = value
        return self
    }
    
    /**
     Setter for PrintQueue_Description.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPrintQueueDescription(_ value: Optional<String>) -> Self {
        self.printQueueDescription = value
        return self
    }
    
    /**
     Setter for PrintQueueJob_Description.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPrintQueueJobDescription(_ value: Optional<String>) -> Self {
        self.printQueueJobDescription = value
        return self
    }
    
    /**
     Setter for PrintQueueJob_Format.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPrintQueueJobFormat(_ value: Optional<String>) -> Self {
        self.printQueueJobFormat = value
        return self
    }
    
    /**
     Setter for PrintQueueJob_Data.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPrintQueueJobData(_ value: Optional<String>) -> Self {
        self.printQueueJobData = value
        return self
    }
}
