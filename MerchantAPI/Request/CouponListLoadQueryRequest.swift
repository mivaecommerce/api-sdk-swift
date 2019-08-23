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
 Handles API Request CouponList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/couponlist_load_query
 */
public class CouponListLoadQueryRequest : ListQueryRequest {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CouponList_Load_Query"
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
                "code",
                "descrip",
                "custscope",
                "dt_start",
                "dt_end",
                "max_use",
                "max_per",
                "active",
                "use_count"
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
                "code",
                "descrip",
                "custscope",
                "dt_start",
                "dt_end",
                "max_use",
                "max_per",
                "active",
                "use_count"
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
        - callback: The callback function with signature (CouponListLoadQueryResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (CouponListLoadQueryResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? CouponListLoadQueryResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? CouponListLoadQueryResponse, error)
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
    public override func createResponse(data : Data) throws -> CouponListLoadQueryResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(CouponListLoadQueryResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CouponListLoadQueryResponse.self
    }
}
