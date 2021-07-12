/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
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

/* Create a ProductListAdjustInventory request instance, passing client to the constructor */
let request = ProductListAdjustInventoryRequest(client: client)

/* Create instances of ProductInventoryAdjustment for each adjustment we want to make */

/* Add 100 to inventory count by product code */
let adjustment1 = ProductInventoryAdjustment()
let adjustment2 = ProductInventoryAdjustment()
let adjustment3 = ProductInventoryAdjustment()
let adjustment4 = ProductInventoryAdjustment()

adjustment1.setProductCode("PRODUCT_1")
    .setAdjustment(100)

/* Subtract 25 from inventory count by product code */
adjustment2.setProductCode("PRODUCT_2")
    .setAdjustment(-25)

/* Add 10 to inventory count by product id */
adjustment3.setProductId(10248)
    .setAdjustment(10)

/* Add 30 to inventory count by product sku */
adjustment4.setProductSku("ProductSku1")
    .setAdjustment(30)

/* Add the ProductInventoryAdjustment object to the Request */
request.addInventoryAdjustment(adjustment1);

/* You can also add an array of ProductInventoryAdjustment */
request.addInventoryAdjustments([
    adjustment2,
    adjustment3,
    adjustment4
]);

/* Send the request */
try request.send() { response, error in
    guard let response = response, error == nil else {
        /// Handle Error
        return
    }

    if (!response.isSuccess()) {
        print(String(format: "Error Updating Product Inventory", response.getErrorCode(), response.getErrorMessage()))
    } else {
        print("Successfully Updated Product Inventory")
    }
}
