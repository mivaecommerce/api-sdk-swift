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
 Handles API Request PriceGroupList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/pricegrouplist_load_query
 */
public class PriceGroupListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "PriceGroupList_Load_Query"
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
                "name",
                "type",
                "module_id",
                "custscope",
                "rate",
                "discount",
                "markup",
                "dt_start",
                "dt_end",
                "priority",
                "exclusion",
                "descrip",
                "display",
                "qmn_subtot",
                "qmx_subtot",
                "qmn_quan",
                "qmx_quan",
                "qmn_weight",
                "qmx_weight",
                "bmn_subtot",
                "bmx_subtot",
                "bmn_quan",
                "bmx_quan",
                "bmn_weight",
                "bmx_weight"
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
                "name",
                "type",
                "module_id",
                "custscope",
                "rate",
                "discount",
                "markup",
                "dt_start",
                "dt_end",
                "priority",
                "exclusion",
                "descrip",
                "display",
                "qmn_subtot",
                "qmx_subtot",
                "qmn_quan",
                "qmx_quan",
                "qmn_weight",
                "qmx_weight",
                "bmn_subtot",
                "bmx_subtot",
                "bmn_quan",
                "bmx_quan",
                "bmn_weight",
                "bmx_weight"
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
        - callback: The callback function with signature (PriceGroupListLoadQueryResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (PriceGroupListLoadQueryResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? PriceGroupListLoadQueryResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? PriceGroupListLoadQueryResponse, error)
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
    public override func createResponse(data : Data) throws -> PriceGroupListLoadQueryResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(PriceGroupListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PriceGroupListLoadQueryResponse.self
    }
}
