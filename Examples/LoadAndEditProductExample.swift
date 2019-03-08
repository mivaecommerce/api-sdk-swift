/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: LoadAndEditProductExample.swift 73950 2019-03-07 21:14:58Z gidriss $
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

/* Load the product first */
let loadProductRequest = ProductListLoadQueryRequest(client: client)

/*
 * apply filtering to match a specific product
 *
 * @see ListQueryExample.swift
 */
loadProductRequest.getFilter().equal("code", "MY_PRODUCT")

/* include all custom fields */
loadProductRequest.addOnDemandColumn('CustomField_Values:*');

/* Send the request */
try loadProductRequest.send() { loadProductResponse, error in
    guard let loadProductResponse = loadProductResponse, error == nil else {
        /// Handle Error
        return
    }
    
    if !loadProductResponse.isSuccess() {
        print(String(format: "Load Product Error", loadProductResponse.getErrorCode(), loadProductResponse.getErrorMessage()))
        return
    } else if loadProductResponse.getProducts().count == 0 {
        print("Product Not Found")
        return
    }
    
    var product = loadProductResponse.getProducts().first
    
    print(String(format: "Loaded Product %s Code %s Name %s", product.getId(), product.getCode(), product.getName()))
    
    /*
     * You can access the custom fields of the product from the CustomFieldValues model
     */
    let myCustomFieldValue = product.getCustomFieldValues().getValue("MyField")
    
    /*
     * to get a specific module field, specify the optional 2rd argument with the module code.
     */
    let myModuleCustomFieldValue = product.getCustomFieldValues().getValue("MyField", "MyModule");
    
    /*
     * Some requests accept a Model object in their constructor
     * which will allow the Request object to inherit data from.
     * ProductUpdate accepts a Product model.
     */
    var request = ProductUpdateRequest(client: client, product: product)
    
    request.setProductName("The New Product Name")
        .setProductDescription("New Product Description")
        .setProductPrice(39.99)
        .setProductCost(29.99)
        .setProductWeight(2.5);
    
    /*
     * You can update custom field values using the CustomFieldValues model.
     */
    request.getCustomFieldValues().addValue("MyField", "MyValue");
    
    /*
     * to update a specific module field, specify the optional 3rd argument with the module code.
     */
    request.getCustomFieldValues().addValue("MyField", "MyValue", "MyModule");
    
    try request.send() { response, error in
        guard let response = response, error == nil else {
            /// Handle Error
            return
        }
        
        if !response.isSuccess() {
            print(String(format: "Load Product Error", response.getErrorCode(), response.getErrorMessage()))
        } else {
            print("Product Updated");
        }
    }
}
