/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/**
 API Response for PrintQueueJob_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/printqueuejob_insert
 */
public class PrintQueueJobInsertResponse : Response {

    /// The response model
    public var printQueueJob : Optional<PrintQueueJob> = nil

    /**
     Getter for printQueueJob.

     - Returns: PrintQueueJob
     */
    public func getPrintQueueJob() -> Optional<PrintQueueJob> {
        return self.printQueueJob
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case printQueueJob = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.printQueueJob = try container.decodeIfPresent(PrintQueueJob.self, forKey: .printQueueJob)
        try super.init(from : decoder)
    }
}