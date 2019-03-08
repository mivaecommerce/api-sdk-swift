/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: NoteListLoadQueryResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for NoteList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/notelist_load_query
 */
public class NoteListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<Note>

    /// Named computed property for data
    public var notes : [Note] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for notes.

     - Returns: [Note]
     */
    public func getNotes() -> [Note] {
        return self.notes
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

        self.data = try container.decodeIfPresent(ListQueryResult<Note>.self, forKey: .data) ?? ListQueryResult<Note>()
        try super.init(from : decoder)
    }
}