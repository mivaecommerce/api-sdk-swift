/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/**
 Handles API Request OrderList_Archive.

 - SeeAlso: https://docs.miva.com/json-api/functions/orderlist_archive
 */
public class OrderListArchiveRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "OrderList_Archive"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Delete_Payment_Data.
    var deletePaymentData : Optional<Bool> = nil

    /// Request field Delete_Shipping_Labels.
    var deleteShippingLabels : Optional<Bool> = nil

    /// Request field Order_IDs.
    var orderIds : [Int] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case deletePaymentData = "Delete_Payment_Data"
        case deleteShippingLabels = "Delete_Shipping_Labels"
        case orderIds = "Order_IDs"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
     */
    public override init(client: Optional<BaseClient> = nil) {
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

        try container.encodeIfPresent(self.deletePaymentData, forKey: .deletePaymentData)
        try container.encodeIfPresent(self.deleteShippingLabels, forKey: .deleteShippingLabels)
        try container.encodeIfPresent(self.orderIds, forKey: .orderIds)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (OrderListArchiveResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (OrderListArchiveResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? OrderListArchiveResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - httpResponse: The underlying HTTP response object
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> OrderListArchiveResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(OrderListArchiveResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return OrderListArchiveResponse.self
    }

    /**
     Getter for Delete_Payment_Data.

     - Returns:  Optional<Bool>
     */
    public func getDeletePaymentData() -> Optional<Bool> {
        return self.deletePaymentData
    }

    /**
     Getter for Delete_Shipping_Labels.

     - Returns:  Optional<Bool>
     */
    public func getDeleteShippingLabels() -> Optional<Bool> {
        return self.deleteShippingLabels
    }

    /**
     Setter for Delete_Payment_Data.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setDeletePaymentData(_ value: Optional<Bool>) -> Self {
        self.deletePaymentData = value
        return self
    }

    /**
     Setter for Delete_Shipping_Labels.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setDeleteShippingLabels(_ value: Optional<Bool>) -> Self {
        self.deleteShippingLabels = value
        return self
    }

    /**
     Add Order_IDs.

     - Parameters:
        - orderId: Int
     - Returns: Self
     */
    @discardableResult
    public func addOrderId(_ orderId : Int) -> Self {
        self.orderIds.append(orderId);
        return self
    }

    /**
     Add Order model.

     - Parameters:
        - order: Order
     - Returns: Self
     */
    @discardableResult
    public func addOrder(_ order: Order) -> Self {
        if order.id > 0 {
            self.orderIds.append(order.id)
        }

        return self
    }
}
