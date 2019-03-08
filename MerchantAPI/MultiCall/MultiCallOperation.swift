/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: MultiCallOperation.swift 73872 2019-03-06 19:53:14Z gidriss $
 */

/// Used to allow it to be added in with Request types in MutliCallRequest
extension MultiCallOperation: MultiCallRequestType {}

/// Errors thrown from MultiCallOperation
public enum MultiCallOperationError: Error {
    case nestedMultiCall
    case requestNotOfSameType
}

/// Represents a sequence of iterations for the same request type.
public class MultiCallOperation : Encodable {

    /// The request iterations to be sent
    var requests : [Request] = []
    
    /// The data that is shared between iterations
    var sharedData : [String: AnyEncodable] = [:]
    
    /**
     Constructor
     
     - Params:
         - request: Optional<Request>
         - sharedData: [String:Encodable]
     */
    public init(request: Optional<Request> = nil, sharedData: [String:Encodable] = [:]) {
        if let request = request {
            self.requests.append(request)
        }
        
        self.setSharedData(sharedData)
    }
    
    /**
     Encodes the operation into an Encoder instance.
     
     - SeeAlso: Encodable
     - Throws: When unable to encode the request.
     */
    public func encode(to encoder: Encoder) throws {
        if self.requests.count > 0 {
            var container = encoder.container(keyedBy: RuntimeCodingKey.self)
            
            for ( key, value ) in self.sharedData {
               try container.encode(value, forKey: RuntimeCodingKey(stringValue: key)!)
            }
            
            try container.encode(self.requests.first!.getFunction(), forKey: RuntimeCodingKey(stringValue: "Function")! )
            
            var iterations  = container.nestedUnkeyedContainer(forKey: RuntimeCodingKey(stringValue: "Iterations")!)
                        
            for request in self.requests {
                request.isIteration = true
                
                try iterations.encode(request)
            }
        }
    }
    
    /**
     Get the shared data between the iterations.
     
     - Returns: [String:Encodable]
     */
    public func getSharedData() -> [String:AnyEncodable] {
        return self.sharedData
    }
    
    /**
     Add a shared data value for key.
     
     - Params:
        - key: String
        - value: Encodable
     - Returns: Self
     */
    @discardableResult
    public func addSharedData<T:Encodable>(_ key: String, _ value: T) -> Self {
        self.sharedData[key] = AnyEncodable(value)
        return self
    }
    
    /**
     Set the shared data object.
     
     - Params:
         - data: [String:Encodable]
     - Returns: Self
     */
    @discardableResult
    public func setSharedData(_ data: [String:Encodable]) -> Self {
        self.sharedData.removeAll()
        for (k,v) in data {
            if v is AnyEncodable {
                self.sharedData[k] = (v as! AnyEncodable)
            } else {
                self.sharedData[k] = AnyEncodable(v)
            }
        }
        return self
    }
    
    /**
     Get the request iterations.
     
     - Returns: Request
     */
    public func getRequests() -> [Request] {
        return self.requests
    }
    
    /**
     Add a request iteration.
     
     - Params:
        - request: Request
     - Throws: MultiCallOperationError
     - Returns: Self
     */
    @discardableResult
    public func addRequest(_ request: Request) throws -> Self {
        if request is MultiCallRequest {
            throw MultiCallOperationError.nestedMultiCall
        }
        
        if self.requests.count > 0 {
            if self.requests.first!.getFunction() != request.getFunction() {
                throw MultiCallOperationError.requestNotOfSameType
            }
        }
        
        self.requests.append(request)
        
        return self
    }
    
    /**
     Add a request iterations.
     
     - Params:
        - requests: [Request]
     - Throws: MultiCallOperationError
     - Returns: Self
     */
    @discardableResult
    public func addRequests(_ requests: [Request]) throws -> Self {
        for request in requests {
            try addRequest(request)
        }
        
        return self
    }
    
    /**
     Set and overwrite a request iterations.
     
     - Params:
        - requests: [Request]
     - Throws: MultiCallOperationError
     - Returns: Self
     */
    @discardableResult
    public func setRequests(_ requests: [Request]) throws -> Self {
        self.requests.removeAll()
        
        try addRequests(requests)
        
        return self
    }
}
