/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: MultiCallExample.swift 73830 2019-03-05 23:40:40Z gidriss $
 */

/* Initialize a client */
let client = MerchantAPI.Client(
  url : "https://www.mystore.com/mm5/json.mvc", 
  apiToken : "MY_API_TOKEN", 
  signingKey : "MY_SIGNING_KEY", 
  signingType : ClientSignType.SHA256, 
  requireTimestamps: true, 
  defaultStoreCode : "STORE_CODE" 
)

/* Create a ProductInsert request instance, passing client to the constructor */
let request = MultiCallRequest(client: client)

/*
 * Create a MultiCallRequest and add Request objects to it
 */
request.addRequest(ProductListLoadQueryRequest())
    .addRequest(CategoryListLoadQueryRequest())
    .addRequest(PriceGroupListLoadQueryRequest());

/* Send the request */
try request.send() { response, error in
    guard let response = response, error == nil else {
        /// Handle Error
        return
    }
    
    if !response.isSuccess() {
        print(String(format: "Error Executing MultiCallRequest %@: %@", response.getErrorCode(), response.getErrorMessage())
    } else {
        for resp in response.getResponses() {
            if resp.isSuccess() {
                
            }
        }
    }
}

/*
 * Utilizing the Iterations feature allows you to compact request
 * data by grouping multiple iterations to the same API function
 * in sequence.
 *
 * @see MultiCallOperation
 */

let request = new MultiCallRequest(client: client);

/* Create a new MultiCallOperation and adds it to the Request. */
let operation = request.operation();

/*
 Alternately:
 var operation = MultiCallOperation()
 request.addOperation(operation)
 */

/*  Set shared data between the iterations, for example we can set a shared
 value for Product_Price and update many products without specifying the same
 data for each of the iterations.
 */

operation.setSharedData("Product_Price", 29.99);

/* We now add all the same request types to the operation to make use of iterations */

var update1 = ProductUpdateRequest()

update1.setEditProduct("PROD_1");

var update2 = ProductUpdateRequest()

update2.setEditProduct("PROD_2");

var update3 = ProductUpdateRequest()

update3.setEditProduct("PROD_3");

var update4 = ProductUpdateRequest()

update4.setEditProduct("PROD_4")
    .setProductName("Product 4");

operation.addRequest(update1);
operation.addRequest(update2);
operation.addRequest(update3);
operation.addRequest(update4);

// We can add more requests as well. Add a Product List Load to get the updated products at the end
checkProducts = ProductListLoadQuery()

checkProducts.getFilter().isIn("code", ["PROD_1", "PROD_2", "PROD_3", "PROD_4"])

request.addRequest(checkProducts);

/* Send the request */
try request.send() { response, error in
    guard let response = response, error == nil else {
        /// Handle Error
        return
    }
    
    for resp in response.getResponses() {
        if resp.isSuccess() {
            print(String(format: "%@ Successful", type(of: resp)))
        } else {
            print(String(format: "%@ Error %@: %@", type(of: resp), resp.getErrorCode(), resp.getErrorMessage()))
        }
    }
});
