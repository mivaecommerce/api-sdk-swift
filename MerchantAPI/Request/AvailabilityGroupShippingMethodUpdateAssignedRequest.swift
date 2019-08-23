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
 Handles API Request AvailabilityGroupShippingMethod_Update_Assigned.

 - SeeAlso: https://docs.miva.com/json-api/functions/availabilitygroupshippingmethod_update_assigned
 */
public class AvailabilityGroupShippingMethodUpdateAssignedRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AvailabilityGroupShippingMethod_Update_Assigned"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field AvailabilityGroup_ID.
    var availabilityGroupId : Optional<Int>

    /// Request field Edit_AvailabilityGroup.
    var editAvailabilityGroup : Optional<String>

    /// Request field AvailabilityGroup_Name.
    var availabilityGroupName : Optional<String>

    /// Request field Module_Code.
    var moduleCode : Optional<String>

    /// Request field Method_Code.
    var methodCode : Optional<String>

    /// Request field Assigned.
    var assigned : Optional<Bool>
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case availabilityGroupId = "AvailabilityGroup_ID"
        case editAvailabilityGroup = "Edit_AvailabilityGroup"
        case availabilityGroupName = "AvailabilityGroup_Name"
        case moduleCode = "Module_Code"
        case methodCode = "Method_Code"
        case assigned = "Assigned"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - availabilityGroup: An optional AvailabilityGroup instance.
     */
    public init(client: Optional<Client> = nil, availabilityGroup: Optional<AvailabilityGroup> = nil) {
        super.init(client: client)
        if let availabilityGroup = availabilityGroup {
            if availabilityGroup.id > 0 {
                self.availabilityGroupId = availabilityGroup.id
            } else if availabilityGroup.name.count > 0 {
                self.editAvailabilityGroup = availabilityGroup.name
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

        if self.availabilityGroupId != nil {
            try container.encodeIfPresent(self.availabilityGroupId, forKey: .availabilityGroupId)
        } else if self.editAvailabilityGroup != nil {
            try container.encode(self.editAvailabilityGroup, forKey: .editAvailabilityGroup)
        } else if self.availabilityGroupName != nil {
            try container.encode(self.availabilityGroupName, forKey: .availabilityGroupName)
        }

        try container.encodeIfPresent(self.moduleCode, forKey: .moduleCode)
        try container.encodeIfPresent(self.methodCode, forKey: .methodCode)
        try container.encodeIfPresent(self.assigned, forKey: .assigned)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AvailabilityGroupShippingMethodUpdateAssignedResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (AvailabilityGroupShippingMethodUpdateAssignedResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? AvailabilityGroupShippingMethodUpdateAssignedResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? AvailabilityGroupShippingMethodUpdateAssignedResponse, error)
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
    public override func createResponse(data : Data) throws -> AvailabilityGroupShippingMethodUpdateAssignedResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(AvailabilityGroupShippingMethodUpdateAssignedResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AvailabilityGroupShippingMethodUpdateAssignedResponse.self
    }
    
    /**
     Getter for AvailabilityGroup_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getAvailabilityGroupId() -> Optional<Int> {
        return self.availabilityGroupId
    }
    
    /**
     Getter for Edit_AvailabilityGroup.

     - Returns:  Optional<String> 
     */
    public func getEditAvailabilityGroup() -> Optional<String> {
        return self.editAvailabilityGroup
    }
    
    /**
     Getter for AvailabilityGroup_Name.

     - Returns:  Optional<String> 
     */
    public func getAvailabilityGroupName() -> Optional<String> {
        return self.availabilityGroupName
    }
    
    /**
     Getter for Module_Code.

     - Returns:  Optional<String> 
     */
    public func getModuleCode() -> Optional<String> {
        return self.moduleCode
    }
    
    /**
     Getter for Method_Code.

     - Returns:  Optional<String> 
     */
    public func getMethodCode() -> Optional<String> {
        return self.methodCode
    }
    
    /**
     Getter for Assigned.
     
     - Returns:  Optional<Bool> 
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
    }
    
    /**
     Setter for AvailabilityGroup_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setAvailabilityGroupId(_ value: Optional<Int>) -> Self {
        self.availabilityGroupId = value
        return self
    }
    
    /**
     Setter for Edit_AvailabilityGroup.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditAvailabilityGroup(_ value: Optional<String>) -> Self {
        self.editAvailabilityGroup = value
        return self
    }
    
    /**
     Setter for AvailabilityGroup_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setAvailabilityGroupName(_ value: Optional<String>) -> Self {
        self.availabilityGroupName = value
        return self
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
     Setter for Method_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setMethodCode(_ value: Optional<String>) -> Self {
        self.methodCode = value
        return self
    }
    
    /**
     Setter for Assigned.
     
     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setAssigned(_ value: Optional<Bool>) -> Self {
        self.assigned = value
        return self
    }
}
