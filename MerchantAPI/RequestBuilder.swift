/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: RequestBuilder.swift 73830 2019-03-05 23:40:40Z gidriss $
 */

/// Used to build custom requests.
class RequestBuilder : Request {
    /// User supplied request scope
    var uscope : RequestScope = RequestScope.Store
    
    /**
     Gets the scope of the Request.
     
     - Returns: RequestScope
     - Note: This method must be overridden
     - Throws: When method not overridden by inheritor.
     */
    override var scope : RequestScope {
        return self.uscope
    }
    
    /**
     Set the scope of the Request.
     
     - Params:
        - scope: RequestScope
     - Returns: Self
     */
    @discardableResult
    public func setScope(scope: RequestScope) -> Self {
        self.uscope = scope
        return self
    }
    
    /**
     The API function name.
     
     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        let funct = getField("Function")
        
        if let funct = funct {
           return funct.value as? String ?? ""
        }
        
        return ""
    }
    
    /// Holds request data
    var data : [String:AnyEncodable ] = [:]
    
    /**
     Constructor
     
     - Parameters:
         - client: Client
         - data: [String:AnyEncodable]
     - Returns: Self
     */
    public init(client: Client, data: [String:AnyEncodable] = [:]) {
        self.data = data
        super.init(client: client)
    }
    
    /**
     Set the function name.
     
     - Parameters:
         - name: String
     - Returns: Self
     */
    @discardableResult
    public func setFunction(_ name: String) -> Self {
        self.data["Function"] = AnyEncodable(name)
        return self
    }
    
    /**
     Set a field value.
     
     - Parameters:
         - name: String
         - value: Encodable
     - Returns: Self
     */
    @discardableResult
    public func setField<T:Encodable>(_ name: String, _ value: T) -> Self {
        self.data[name] = AnyEncodable(value)
        return self
    }
    
    /**
     Get a field value.
     
     - Parameters:
        - name: String
     - Returns: Optional<AnyEncodable>
     */
    public func getField(_ name: String) -> Optional<AnyEncodable> {
        return self.data[name]
    }
    
    /**
     Set a field value.
     
     - Parameters:
         - name: String
         - value: Encodable
     - Returns: Self
     */
    @discardableResult
    public func setField(_ name: String, _ value: Encodable) -> Self {
        self.data[name] = AnyEncodable(value)
        return self
    }

    /**
     Create a response object by decoding the response data.
     
     - Parameters:
        - encode: A Encoder instance to encode to.
     - Throws: Error when unable to encode the request data.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RuntimeCodingKey.self)
        
        for (key, value) in self.data {
            try container.encode(value, forKey: RuntimeCodingKey(stringValue: key)!)
        }
        
        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.
     
     - Parameters:
        - callback: The callback function with signature (Response?, Error?).
     - Note: Overrides
     */
    public override func send(client: Optional<Client> = nil, callback: @escaping (Response?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response, error)
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
    public override func createResponse(data : Data) throws -> Response {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(OrderCustomFieldListLoadResponse.self, from: data)
    }
    
    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.
     
     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return Response.self
    }
}
