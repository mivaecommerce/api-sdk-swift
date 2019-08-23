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
 API Response for OrderCustomFieldList_Load.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/ordercustomfieldlist_load
 */
public class OrderCustomFieldListLoadResponse : Response {

    /// Holds array of OrderCustomField returned by the response
    public var data : [OrderCustomField] = []

    /// Named computed property for data
    public var orderCustomFields : [OrderCustomField] {
        get {
            return self.data
        }
    }

    /**
     Getter for orderCustomFields.

     - Returns: [OrderCustomField]
     */
    public func getOrderCustomFields() -> [OrderCustomField] {
        return self.orderCustomFields
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

        self.data = try container.decodeIfPresent([OrderCustomField].self, forKey: .data) ?? []
        try super.init(from : decoder)
    }
}