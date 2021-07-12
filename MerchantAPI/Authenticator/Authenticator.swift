/*
* This file is part of the MerchantAPI package.
*
* (c) Miva Inc <https://www.miva.com/>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

import Foundation

public class Authenticator
{
    /**
     Generates the autentication header value
     - Returns: String
     - Throws
     */
    public func generateAuthenticationHeader(data: String) throws -> String {
        fatalError("Method Authenticator.generateAuthenticationHeader must be overridden")
    }

    /**
     Signs the given data
     - Returns: String
     - Throws
     */
    public func signData(data: String) throws -> String {
        fatalError("Method Authenticator.signData must be overridden")
    }
}
