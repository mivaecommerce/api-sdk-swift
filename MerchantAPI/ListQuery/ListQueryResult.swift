/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// Template class for accessing List_Load_Query result data.
public class ListQueryResult<T:Decodable> : Decodable {
    // The total records returned
    var totalCount  : Int = 0

    // The starting offset of the records
    var startOffset : Int = 0

    // The record container
    var records     : [T] = []

    /**
     CodingKeys used for decoding the response.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case totalCount  = "total_count"
        case startOffset = "start_offset"
        case records     = "data"
    }

    /**
     Constructor.
     */
    public init() {
        self.totalCount  = 0
        self.startOffset = 0
        self.records     = []
    }

    /**
     Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy : CodingKeys.self)

        self.totalCount  = try container.decodeIfPresent(Int.self, forKey: .totalCount)   ?? 0
        self.startOffset = try container.decodeIfPresent(Int.self, forKey: .startOffset)  ?? 0
        self.records     = try container.decodeIfPresent([T].self, forKey: .records)      ?? []
    }
}
