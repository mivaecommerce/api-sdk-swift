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
  signingType : MerchantAPI.ClientSignType.SHA256,
  requireTimestamps: true,
  defaultStoreCode : "STORE_CODE"
)

/* Create a ProductInsert request instance, passing client to the constructor */
let request = MerchantAPI.ProductInsertRequest(client: client)

/* Setup our request variables */
request.setProductCode("NEW_PRODUCT")
  .setProductName("My New Product")
  .setProductPrice(29.99)
  .setProductWeight(1.50);

try request.send() { response, error in
    guard let response = response, error == nil else {
    	/// Handle Error
    	return
    }

    if !response.isSuccess() {
    	print(String(format: "Response Error: %@ - %@", response.getErrorCode(), response.getErrorMessage()))
    } else {
    	print("Successfully inserted product")
    }
}
