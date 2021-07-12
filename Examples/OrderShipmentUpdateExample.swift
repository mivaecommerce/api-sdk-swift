
/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * This example will load an order by its ID from the from a constant 
 * then proceed to create a shipment for all items in the order 
 * and then finally update the shipment with tracking information and 
 * mark it as shipped.
 */

import MerchantAPI

/* Initialize a client */
let client = Client(
    url : "https://www.mystore.com/mm5/json.mvc",
    apiToken : "MY_API_TOKEN",
    signingKey : "MY_SIGNING_KEY",
    signingType : ClientSignType.SHA256,
    requireTimestamps: true,
    defaultStoreCode : "STORE_CODE"
)


let orderRequest = OrderListLoadQueryRequest(client: client)

orderRequest.filter.equal("id", 10000)

try orderRequest.send() { orderResponse, error in
    guard let orderResponse = orderResponse, error == nil else {
        /// Handle Error
        return
    }

    if (!orderResponse.isSuccess()) {
        print(String(format: "Error Loading Order %s - %s", orderResponse.getErrorCode(), orderResponse.getErrorMessage()))
    } else {
        if !orderResponse!.getOrders().count {
            print("Order Not Found")
            return
        }

        // Create a shipment for all items in the order that do not have a shipment

        let order = orderResponse!.getOrders().first!
        let createShipmentRequest = OrderItemListCreateShipmentRequest(client: client)

        for item in order.items {
            if !item.shipmentId {
                createShipmentRequest.addOrderItem(item)
            }
        }

        try createShipmentRequest.send() { createShipmentResponse, error in
            guard let createShipmentResponse = createShipmentResponse, error == nil else {
                /// Handle Error
                return
            }

            if (!createShipmentResponse.isSuccess()) {
                print(String(format: "Error Creating Order Shipment %s - %s", createShipmentResponse.getErrorCode(), createShipmentResponse.getErrorMessage()))
            } else {
                let shipment = createShipmentResponse!.getShipment()!

                // Now that we have created a shipment for the items in the order we can
                // assign a tracking number and mark it shipped
                
                let trackingNumber = "Z1111111111"
                let shipmentUpdateRequest = OrderShipmentListUpdateRequest(client: client)
                let shipmentUpdate = ShipmentUpdate()

                shipmentUpdate.setCost(1.00)
                    .setMarkedShipped(true)
                    .setShipmentId(shipment.id)
                    .setTrackingNumner(trackingNumber)
                    .setTrackingType("UPS")

                shipmentUpdateRequest.addShipmentUpdate(shipmentUpdate)

                try shipmentUpdateRequest.send() { shipmentUpdateResponse, error in
                    guard let shipmentUpdateResponse = shipmentUpdateResponse, error == nil else {
                        /// Handle Error
                        return
                    }

                    if (!shipmentUpdateResponse.isSuccess()) {
                        print(String(format: "Error Updating Order Shipment %s - %s", shipmentUpdateResponse.getErrorCode(), shipmentUpdateResponse.getErrorMessage()))
                    } else {
                        print(String(format: "Order % Shipment %d Updated With Tracking %s", order.id, shipment.id, trackingNumber))
                    }
                }
            }
        }
    }
}
