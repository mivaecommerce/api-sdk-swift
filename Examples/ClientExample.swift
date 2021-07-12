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

/// Request Logging can be enabled by assigning a Logger instance to the client

/// Currently, we provide two logger types:
//       FileLogger - logs to a local file
//       ConsoleLogger - logs to std out/err

// Setting up a FileLogger
client.setLogger(ConsoleLogger(filePath: "/path/to/my/logfile.log"))

// Setting up a ConsoleLogger to log to stdout
client.setLogger(ConsoleLogger(destination: ConsoleLogger.OutputDestination.StdOut))

// Setting up a ConsoleLogger to log to stderr
client.setLogger(ConsoleLogger(destination: ConsoleLogger.OutputDestination.StdErr))