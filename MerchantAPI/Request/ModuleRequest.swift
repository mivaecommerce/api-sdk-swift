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
 Handles API Request Module.

 - SeeAlso: https://docs.miva.com/json-api/functions/module
 */
public class ModuleRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Module"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field Module_Code.
    var moduleCode : Optional<String>

    /// Request field Module_Function.
    var moduleFunction : Optional<String>

    /// User set request fields
    var moduleFields : [String:AnyEncodable] = [:]
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case moduleCode = "Module_Code"
        case moduleFunction = "Module_Function"
    }
    
    /**
     Request constructor.
     
     - Parameters:
        - client: A Client instance.
     */
    public override init(client: Optional<Client> = nil) {
        super.init(client: client)
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

        try container.encodeIfPresent(self.moduleCode, forKey: .moduleCode)
        try container.encodeIfPresent(self.moduleFunction, forKey: .moduleFunction)
        
        var moduleFieldsContainer = encoder.container(keyedBy: RuntimeCodingKey.self)

        for (key,value) in self.moduleFields {
            try moduleFieldsContainer.encode(value, forKey: RuntimeCodingKey(stringValue: key)!)
        }

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ModuleResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (ModuleResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? ModuleResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? ModuleResponse, error)
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
    public override func createResponse(data : Data) throws -> ModuleResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(ModuleResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ModuleResponse.self
    }
    
    /**
     Getter for Module_Code.

     - Returns:  Optional<String> 
     */
    public func getModuleCode() -> Optional<String> {
        return self.moduleCode
    }
    
    /**
     Getter for Module_Function.

     - Returns:  Optional<String> 
     */
    public func getModuleFunction() -> Optional<String> {
        return self.moduleFunction
    }
    
    /**
     Get user set request fields.
     
     - Returns:  [String:AnyEncodable]
     */
    public func getModuleFields() -> [String:AnyEncodable] {
        return self.moduleFields
    }
    
    /**
     Setter for Module_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setModuleCode(_ value: Optional<String>) -> Self {
        self.moduleCode = value
        return self
    }
    
    /**
     Setter for Module_Function.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setModuleFunction(_ value: Optional<String>) -> Self {
        self.moduleFunction = value
        return self
    }
    
    /**
     Set user request data.
     
     - Parameters:
        - name: String
        - value: Encodable
     - Returns:  Self
     */
    @discardableResult
    public func setModuleField<T:Encodable>(_ name: String, _ value: T) -> Self {
        self.moduleFields[name] = AnyEncodable(value)
        return self
    }
}
