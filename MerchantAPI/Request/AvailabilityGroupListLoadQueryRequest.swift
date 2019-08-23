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
 Handles API Request AvailabilityGroupList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/availabilitygrouplist_load_query
 */
public class AvailabilityGroupListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "AvailabilityGroupList_Load_Query"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /**
     The available search fields applicable to the request.

     - Returns: An array of strings.
     - Note: Overrides
     */
    override var availableSearchFields : [ String ] {
        get {
            return [
                "id",
                "name"
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
                "name"
            ]
        }
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
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (AvailabilityGroupListLoadQueryResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (AvailabilityGroupListLoadQueryResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? AvailabilityGroupListLoadQueryResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? AvailabilityGroupListLoadQueryResponse, error)
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
    public override func createResponse(data : Data) throws -> AvailabilityGroupListLoadQueryResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(AvailabilityGroupListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return AvailabilityGroupListLoadQueryResponse.self
    }
}
