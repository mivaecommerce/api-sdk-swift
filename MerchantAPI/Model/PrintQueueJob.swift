/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// PrintQueueJob data model.
public class PrintQueueJob : Model {

    /// Model field id.
    var id : Int

    /// Model field queue_id.
    var queueId : Int

    /// Model field store_id.
    var storeId : Int

    /// Model field user_id.
    var userId : Int

    /// Model field descrip.
    var description : String

    /// Model field job_fmt.
    var jobFormat : String

    /// Model field job_data.
    var jobData : String

    /// Model field dt_created.
    var dateTimeCreated : Date

    /// Model field user_name.
    var userName : String

    /// Model field store_code.
    var storeCode : String

    /// Model field store_name.
    var storeName : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case queueId = "queue_id"
        case storeId = "store_id"
        case userId = "user_id"
        case description = "descrip"
        case jobFormat = "job_fmt"
        case jobData = "job_data"
        case dateTimeCreated = "dt_created"
        case userName = "user_name"
        case storeCode = "store_code"
        case storeName = "store_name"
    }

    /**
     PrintQueueJob Constructor.
     */
    public override init() {
        self.id = 0
        self.queueId = 0
        self.storeId = 0
        self.userId = 0
        self.description = ""
        self.jobFormat = ""
        self.jobData = ""
        self.dateTimeCreated = Date(timeIntervalSince1970: 0)
        self.userName = ""
        self.storeCode = ""
        self.storeName = ""

        super.init()
    }

    /**
     PrintQueueJob Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.queueId = try container.decodeIfPresent(Int.self, forKey: .queueId) ?? 0
        self.storeId = try container.decodeIfPresent(Int.self, forKey: .storeId) ?? 0
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.jobFormat = try container.decodeIfPresent(String.self, forKey: .jobFormat) ?? ""
        self.jobData = try container.decodeIfPresent(String.self, forKey: .jobData) ?? ""
        self.dateTimeCreated = Date(timeIntervalSince1970: Double(try container.decodeIfPresent(Int64.self, forKey: .dateTimeCreated) ?? 0))
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName) ?? ""
        self.storeCode = try container.decodeIfPresent(String.self, forKey: .storeCode) ?? ""
        self.storeName = try container.decodeIfPresent(String.self, forKey: .storeName) ?? ""

        try super.init(from : decoder)
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encoder: The Encoder instance.
     - Throws: error when unable to encode.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.queueId, forKey: .queueId)
        try container.encodeIfPresent(self.storeId, forKey: .storeId)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.jobFormat, forKey: .jobFormat)
        try container.encodeIfPresent(self.jobData, forKey: .jobData)
        try container.encodeIfPresent(Int64(self.dateTimeCreated.timeIntervalSince1970), forKey: .dateTimeCreated)
        try container.encodeIfPresent(self.userName, forKey: .userName)
        try container.encodeIfPresent(self.storeCode, forKey: .storeCode)
        try container.encodeIfPresent(self.storeName, forKey: .storeName)

        try super.encode(to: encoder)
    }

    /**
     Getter for id.

     - Returns:  Int

     */
    public func getId() -> Int {
        return self.id
    }

    /**
     Getter for queue_id.

     - Returns:  Int

     */
    public func getQueueId() -> Int {
        return self.queueId
    }

    /**
     Getter for store_id.

     - Returns:  Int

     */
    public func getStoreId() -> Int {
        return self.storeId
    }

    /**
     Getter for user_id.

     - Returns:  Int

     */
    public func getUserId() -> Int {
        return self.userId
    }

    /**
     Getter for descrip.

     - Returns:  String

     */
    public func getDescription() -> String {
        return self.description
    }

    /**
     Getter for job_fmt.

     - Returns:  String

     */
    public func getJobFormat() -> String {
        return self.jobFormat
    }

    /**
     Getter for job_data.

     - Returns:  String

     */
    public func getJobData() -> String {
        return self.jobData
    }

    /**
     Getter for dt_created.

     - Returns:  Date     */
    public func getDateTimeCreated() -> Date {
        return self.dateTimeCreated
    }

    /**
     Getter for user_name.

     - Returns:  String

     */
    public func getUserName() -> String {
        return self.userName
    }

    /**
     Getter for store_code.

     - Returns:  String

     */
    public func getStoreCode() -> String {
        return self.storeCode
    }

    /**
     Getter for store_name.

     - Returns:  String

     */
    public func getStoreName() -> String {
        return self.storeName
    }
}
