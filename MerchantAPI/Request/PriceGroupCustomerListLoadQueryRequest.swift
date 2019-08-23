/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: PriceGroupCustomerListLoadQueryRequest.swift 77298 2019-08-07 22:16:46Z gidriss $
 */

import Foundation

/**
 Handles API Request PriceGroupCustomerList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegroupcustomerlist_load_query
 */
public class PriceGroupCustomerListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PriceGroupCustomerList_Load_Query"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field PriceGroup_ID.
    var priceGroupId : Optional<Int>

    /// Request field PriceGroup_Name.
    var priceGroupName : Optional<String>

    /// Request field Assigned.
    var assigned : Optional<Bool>

    /// Request field Unassigned.
    var unassigned : Optional<Bool>
    
    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "id",
                "login",
                "pw_email",
                "ship_fname",
                "ship_lname",
                "ship_email",
                "ship_comp",
                "ship_phone",
                "ship_fax",
                "ship_addr1",
                "ship_addr2",
                "ship_city",
                "ship_state",
                "ship_zip",
                "ship_cntry",
                "ship_res",
                "bill_fname",
                "bill_lname",
                "bill_email",
                "bill_comp",
                "bill_phone",
                "bill_fax",
                "bill_addr1",
                "bill_addr2",
                "bill_city",
                "bill_state",
                "bill_zip",
                "bill_cntry",
                "business_title",
                "note_count",
                "dt_created",
                "dt_login",
                "credit"
            ]
        }
    }
    
    /**
     The available sort fields applicable to the request.
     
     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSortFields : [ String ] {
        get {
            return [
                "id",
                "login",
                "pw_email",
                "ship_fname",
                "ship_lname",
                "ship_email",
                "ship_comp",
                "ship_phone",
                "ship_fax",
                "ship_addr1",
                "ship_addr2",
                "ship_city",
                "ship_state",
                "ship_zip",
                "ship_cntry",
                "ship_res",
                "bill_fname",
                "bill_lname",
                "bill_email",
                "bill_comp",
                "bill_phone",
                "bill_fax",
                "bill_addr1",
                "bill_addr2",
                "bill_city",
                "bill_state",
                "bill_zip",
                "bill_cntry",
                "business_title",
                "note_count",
                "dt_created",
                "dt_login",
                "credit"
            ]
        }
    }
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case priceGroupId = "PriceGroup_ID"
        case priceGroupName = "PriceGroup_Name"
        case assigned = "Assigned"
        case unassigned = "Unassigned"
    }
    
    /**
     Request constructor.

     - Parameters:
        - client: A Client instance.
        - priceGroup: An optional PriceGroup instance.
     */
    public init(client: Optional<Client> = nil, priceGroup: Optional<PriceGroup> = nil) {
        super.init(client: client)
        if let priceGroup = priceGroup {
            if priceGroup.id > 0 {
                self.priceGroupId = priceGroup.id
            } else if priceGroup.name.count > 0 {
                self.priceGroupName = priceGroup.name
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

        if self.priceGroupId != nil {
            try container.encodeIfPresent(self.priceGroupId, forKey: .priceGroupId)
        } else if self.priceGroupName != nil {
            try container.encode(self.priceGroupName, forKey: .priceGroupName)
        }

        try container.encodeIfPresent(self.assigned, forKey: .assigned)
        try container.encodeIfPresent(self.unassigned, forKey: .unassigned)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PriceGroupCustomerListLoadQueryResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (PriceGroupCustomerListLoadQueryResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? PriceGroupCustomerListLoadQueryResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? PriceGroupCustomerListLoadQueryResponse, error)
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
    public override func createResponse(data : Data) throws -> PriceGroupCustomerListLoadQueryResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(PriceGroupCustomerListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PriceGroupCustomerListLoadQueryResponse.self
    }
    
    /**
     Getter for PriceGroup_ID.
     
     - Returns:  Optional<Int> 
     */
    public func getPriceGroupId() -> Optional<Int> {
        return self.priceGroupId
    }
    
    /**
     Getter for PriceGroup_Name.

     - Returns:  Optional<String> 
     */
    public func getPriceGroupName() -> Optional<String> {
        return self.priceGroupName
    }
    
    /**
     Getter for Assigned.
     
     - Returns:  Optional<Bool> 
     */
    public func getAssigned() -> Optional<Bool> {
        return self.assigned
    }
    
    /**
     Getter for Unassigned.
     
     - Returns:  Optional<Bool> 
     */
    public func getUnassigned() -> Optional<Bool> {
        return self.unassigned
    }
    
    /**
     Setter for PriceGroup_ID.
     
     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupId(_ value: Optional<Int>) -> Self {
        self.priceGroupId = value
        return self
    }
    
    /**
     Setter for PriceGroup_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupName(_ value: Optional<String>) -> Self {
        self.priceGroupName = value
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
    
    /**
     Setter for Unassigned.
     
     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setUnassigned(_ value: Optional<Bool>) -> Self {
        self.unassigned = value
        return self
    }
}
