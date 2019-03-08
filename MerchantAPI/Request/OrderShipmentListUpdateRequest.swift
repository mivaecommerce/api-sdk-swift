/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: OrderShipmentListUpdateRequest.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 Handles API Request OrderShipmentList_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/ordershipmentlist_update
 */
public class OrderShipmentListUpdateRequest : Request {
    /**
     The API function name. 

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderShipmentList_Update"
    }

    /**
     The request scope. 

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }
    
    /// Request field Shipment_Updates.
    var shipmentUpdates : [OrderShipmentUpdate] = []
    
    /**
     CodingKeys used to map the request when encoding.
     
     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case shipmentUpdates = "Shipment_Updates"
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

        try container.encodeIfPresent(self.shipmentUpdates, forKey: .shipmentUpdates)

        try super.encode(to : encoder)
    }
    
    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderShipmentListUpdateResponse?, Error?).
     - Note: Overrides
     */
     public override func send(client: Optional<Client> = nil, callback: @escaping (OrderShipmentListUpdateResponse?, Error?) -> ()) throws {
        if client != nil {
            client!.send(self) { request, response, error in
                callback(response as? OrderShipmentListUpdateResponse, error)
            }
        } else if self.client != nil {
            self.client!.send(self) { request, response, error in
                callback(response as? OrderShipmentListUpdateResponse, error)
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
    public override func createResponse(data : Data) throws -> OrderShipmentListUpdateResponse {
        let decoder = JSONDecoder()
        
        decoder.userInfo[Response.decoderRequestUserInfoKey]      = self
        decoder.userInfo[Response.decoderResponseDataUserInfoKey] = data
        
        return try decoder.decode(OrderShipmentListUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderShipmentListUpdateResponse.self
    }
    
    /**
     Getter for Shipment_Updates.
     
     - Returns:  [OrderShipmentUpdate]
     */
    public func getShipmentUpdates() -> [OrderShipmentUpdate] {
        return self.shipmentUpdates
    }
    
    /**
     Add a OrderShipmentUpdate.

     - Parameters:
        - shipmentUpdate: OrderShipmentUpdate 
     - Returns: Self
     */
    @discardableResult
    public func addShipmentUpdate(_ shipmentUpdate : OrderShipmentUpdate) -> Self {
        self.shipmentUpdates.append(shipmentUpdate)
        return self
    }
    
    /**
     Add an array of OrderShipmentUpdate.

     - Parameters:
        - shipmentUpdates: [OrderShipmentUpdate]
     - Returns: Self 
     */
    @discardableResult
    public func addShipmentUpdates(_ shipmentUpdates: [OrderShipmentUpdate]) -> Self {
        for s in shipmentUpdates {
            self.shipmentUpdates.append(s);
        }       

        return self
    }
}
