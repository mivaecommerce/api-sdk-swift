/*
* (c) Miva Inc <https://www.miva.com/>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

import Foundation

public extension String
{
    static func StringFormat(format: String, _ vargs: String...) -> String {
#if os(Linux)
        return LinuxStringFormat(withFormat: format, argumentsArray: vargs)
#else
        return String(format: format, arguments: vargs)
#endif
    }
}

#if os(Linux)
// See https://bugs.swift.org/browse/SR-957
public func LinuxStringFormat(withFormat format: String, argumentsArray args:[String]) -> String {
    var index = 0
    var format = format
    while let match = format.range(of: "%@", options: .literal) {
        if index >= args.count {
            break
        }
        format = format.replacingOccurrences(of: "%@", with: args[index], options: .literal, range: match)
        index += 1
    }
    return format
}

#endif

