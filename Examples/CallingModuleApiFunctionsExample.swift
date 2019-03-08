/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CallingModuleApiFunctionsExample.swift 73830 2019-03-05 23:40:40Z gidriss $
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

/*
 * If you create a custom module or want to hook into an existing modules API functionality it exposes you can
 * use the Module request class to call into the module.
 */

let request = ModuleRequest(client: client)

request.setModuleCode("MyModuleCode")
    .setModuleFunction("MyModuleFunction")

/* Add custom parameters to the request using the setModuleField method */

request.setModuleField("MyModuleField", "Foo")
    .setModuleField("MyModuleField_Int", 1)
    .setModuleField("MyModuleField_Decimal", Decimal(2.99))
    .setModuleField("MyModuleField_Array", [ "foo", "bar" ]);

/*
 * It is best practice to create a custom class for your Module
 * by extending the Module or the Request class.
 */

/* Send the request */
try request.send() { response, error in
    guard let response = response, error == nil else {
        /// Handle Error
        return
    }
    
    if (!response.isSuccess()) {
        print(String(format: "Error: %@: %@", response.getErrorCode(), response.getErrorMessage()))
    } else {
        print("Success");
    }
}
