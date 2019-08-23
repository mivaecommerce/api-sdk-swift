/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/**
 API Response for PrintQueueList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/printqueuelist_load_query
 */
public class PrintQueueListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<PrintQueue>

    /// Named computed property for data
    public var printQueues : [PrintQueue] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for printQueues.

     - Returns: [PrintQueue]
     */
    public func getPrintQueues() -> [PrintQueue] {
        return self.printQueues
    }

    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.data = try container.decodeIfPresent(ListQueryResult<PrintQueue>.self, forKey: .data) ?? ListQueryResult<PrintQueue>()
        try super.init(from : decoder)
    }
}