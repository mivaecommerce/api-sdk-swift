/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: PrintQueueJobStatusResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for PrintQueueJob_Status.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/printqueuejob_status
 */
public class PrintQueueJobStatusResponse : Response {
    /// Response field status.
    var status : Optional<String>

    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case status
        case data
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        if container.contains(.data) {
            let datacontainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
            self.status = try datacontainer.decodeIfPresent(String.self, forKey: .status)
        }

        try super.init(from : decoder)
    }

    /**
     Get status.

     - Returns: string
    */
    func getStatus() -> String {
        return self.status ?? ""
    }
}