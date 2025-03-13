/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/// Objects holds constant data related to the version of this library.
public struct Version {
    /// The major version of this release.
    public static var VERSION_MAJOR = 2

    /// The minor version of this release.
    public static var VERSION_MINOR = 7

    /// The patch version of this release.
    public static var VERSION_PATCH = 0

    // The version of this release as a String.
    public static var VERSION_STRING = "2.7.0"
    
    public static func getSwiftVersion() -> String
    {
#if swift(>=6.0)
        return "6.x"
#elseif swift(>=5.0)
#if swift(>=5.10)
        return "5.10"
#elseif swift(>=5.9)
        return "5.9"
#elseif swift(>=5.8)
        return "5.8"
#elseif swift(>=5.7)
        return "5.7"
#elseif swift(>=5.6)
        return "5.6"
#elseif swift(>=5.5)
        return "5.5"
#elseif swift(>=5.4)
        return "5.4"
#elseif swift(>=5.3)
        return "5.3"
#elseif swift(>=5.2)
        return "5.2"
#elseif swift(>=5.1)
        return "5.1"
#else
        return "5.0"
#endif
#elseif swift(>=4.0)
        return "4.x"
#elseif swift(>=3.0)
        return "3.x"
#elseif swift(>=2.0)
        return "2.x"
#else
        return "1.x"
#endif
    }
}
