/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: ClientExample.swift 73172 2019-02-01 22:05:55Z gidriss $
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
