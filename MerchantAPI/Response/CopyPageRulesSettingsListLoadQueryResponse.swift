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
 API Response for CopyPageRulesSettingsList_Load_Query.

 - SeeAlso: https://docs.miva.com/json-api/functions/copypagerulessettingslist_load_query
 */
public class CopyPageRulesSettingsListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CopyPageRulesSettings>

    /// Named computed property for data
    public var copyPageRulesSettings : [CopyPageRulesSettings] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for copyPageRulesSettings.

     - Returns: [CopyPageRulesSettings]
     */
    public func getCopyPageRulesSettings() -> [CopyPageRulesSettings] {
        return self.copyPageRulesSettings
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

        self.data = try container.decodeIfPresent(ListQueryResult<CopyPageRulesSettings>.self, forKey: .data) ?? ListQueryResult<CopyPageRulesSettings>()
        try super.init(from : decoder)
    }
}