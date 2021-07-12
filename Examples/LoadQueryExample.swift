
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

/*
 * All Request objects which inherit from ListQueryRequest
 * can utilize the FilterExpression class to fluently add
 * search filters to the *List_Load_Query requests.
 *
 * @see ListQueryRequest
 * @see FilterExpression
 */

let request = ProductListLoadQueryRequest(client: client)

/*
 * Get the FilterExpression object for the request.
 * This will enforce only adding search filters to
 * defined fields in ProductListLoadQuery. Trying to
 * filter against undefined fields throws an exception.
 *
 * @see ProductListLoadQueryRequest::availableSearchFields
 * @see ProductListLoadQueryRequest::getAvailableSearchFields()
 * @see FilterExpression
 */

let filters = request.getFilter()

/*
 * Alternately, you can just create a FilterExpression object
 * directly.
 *
 * filters = new FilterExpression()
 *
 * This will not enforce a requests available search fields.
 *
 * var filters = FilterExpression(request: request)
 *
 * This will enforce a requests available search fields.
 */

filters.equal("code", "foo")
    .orEqual("code", "bar")

/*
 * You can nest additional expressions to create
 * more complex search queries:
 */

filters.orX(
    filters.expr()
        .like("code", "BAZ%")
        .andGreaterThan("price", 9.99)
)

/*
 * This would result in a query along the lines of:
 *
 * [...] WHERE code = "foo" OR code = "bar" OR ( code LIKE "BAZ%" AND price > 9.99 )
 */

/* You can get an array of available search fields for a ListQueryRequest */
let availableSearchFields = request.getAvailableSearchFields()

/*
 * Some *List_Load_Query functions allow you to include additional data in the response
 * by specifying additional on demand columns
 */

/* You can add a single column */
request.addOnDemandColumn("column")

/* You can set (and replace) an array columns */
request.setOnDemandColumns(["column","column2","column3"])

/* You can get an array of supported columns from the Request */
let availableColumns = request.getAvailableOnDemandColumns()

/* You can set all supported on demand columns the request supports like this */
request.setOnDemandColumns(request.getAvailableOnDemandColumns())

/*
 * Lists which include Custom Fields (Product,Category,Order) you must explicitly specify
 * the custom field module and code as an on demand column or using wildcards
 */

request.addOnDemandColumn("CustomField_Values:*") // Includes ALL custom fields
request.addOnDemandColumn("CustomField_Values:customfields:*") // Includes all fields provided by the customfields module
request.addOnDemandColumn("CustomField_Values:customfields:MyFieldCode") // includes only the MyFieldCode provided by the customfields module

/* You can sort the result list by using  the setSort method on the Request */
request.setSort("field", ProductListLoadQueryRequest.SortDirection.Descending)

/* Get an array of available sort fields */
let availableSortFields = request.getAvailableSortFields()

/*
 * Some *List_Load_Query functions support custom filters specific to the request.
 * You can add custom filters using the setCustomFilter method. The value type will
 * vary for each custom field.
 */

request.setCustomFilter("Custom_Filter_Name", "Custom_Filter_Value")

/* Send the request */
try request.send() { response, error in
    guard let response = response, error == nil else {
        /// Handle Error
        return
    }

    if (!response.isSuccess()) {
        print(String(format: "Error Loading Order List", response.getErrorCode(), response.getErrorMessage()))
    } else {
        for product in response.getProducts() {
            print(String(format: "Product ID: %d Code: %s Name: %s", product.getId(), product.getCode(), product.getName()))

            /*
             * Custom Field Values can be accessed via the CustomFieldValues model object
             * @see CustomFieldValues
             */

            var myCustomField       = product.getCustomFieldValues().getValue("MyFieldCode");

            var myModuleCustomField = product.getCustomFieldValues().getValue("MyModuleFieldCode", "MyModule");
        }
    }
}
