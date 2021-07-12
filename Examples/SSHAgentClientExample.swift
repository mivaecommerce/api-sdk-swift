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

// The local path to your public key file
// See the README for compatible formats
let publicKeyFile = "/path/to/private"

// The path to your agent socket
// Can be left empty in most cases, defaults to environment variable SSH_AUTH_SOCK
let agentSocketPath = ""

// Default store code
let defaultStoreCode = "STORECODE"

/* Initialize a client */
let client = SSHAgentClient(
    url : url,
    username : username,
    publicKeyFile : publicKeyFile,
    agentSocketPath: agentSocketPath,
    requireTimestamps: true,
    defaultStoreCode: defaultStoreCode
)
