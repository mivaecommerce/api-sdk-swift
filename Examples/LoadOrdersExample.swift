/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: LoadOrdersExample.swift 73830 2019-03-05 23:40:40Z gidriss $
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

/* Create a OrderListLoadQuery request instance, passing client to the constructor */
var request = OrderListLoadQueryRequest(client: client)

/* include additional order information by including ondemandcolumns */
request.setOnDemandColumns([
    "ship_method",              // include the shipping method
    "cust_login",               // include the customers login
    "cust_pw_email",            // include the customers email address
    "business_title",           // include the customers business account title
    "payment_module",           // include the payment module information
    "customer",                 // include the customer information
    "items",                    // include the orders items
    "charges",                  // include the orders charges
    "coupons",                  // include the orders coupons
    "discounts",                // include the orders discounts
    "payments"                  // include the orders payments
])

request.addOnDemandColumn("notes"); // include the orders notes

/* Include all custom fields */
request.addOnDemandColumn("CustomField_Values:*");

/* Set the list sorting */
request.setSort("id", OrderListLoadQueryRequest.SortDirection.Descending)

/* If you wish to decrypt payment data, you must provide the passphrase used by your encryption key */
request.setPassphrase("MY_ENCRYPTION_KEYS_PASSPHRASE")

/* Send the request */
try request.send() { response, error in
    guard let response = response, error == nil else {
        /// Handle Error
        return
    }
    
    if (!response.isSuccess()) {
        print(String(format: "Error Loading Order List", response.getErrorCode(), response.getErrorMessage()))
    } else {
        for order in response.getOrders() {
            print(String(format: "Order ID %d With %d Items, %d Charges Total %s",
                 order.getId(),
                 order.getItems().count,
                 order.getCharges().count,
                 order.getFormattedTotal()))
        }
    }
}
