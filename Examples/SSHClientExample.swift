/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import MerchantAPI

// The URL to your stores json entry point
let url = "https://www.mystore.com/mm5/json.mvc"

// The store username
let username = "MyStoreUsername"

// The local path to your private key file
// See the README for 
let privateKeyFile = "/path/to/private"

// Optional password if your key is encrypted
let privateKeyPassword = "PASSWORD"

let defaultStoreCode = "STORECODE"

/* Initialize a client */
let client = SSHClient(
    url : url,
    username : username,
    privateKeyFile : privateKeyFile,
    privateKeyPassword: privateKeyFile,
    requireTimestamps: true,
    defaultStoreCode: defaultStoreCode
)
