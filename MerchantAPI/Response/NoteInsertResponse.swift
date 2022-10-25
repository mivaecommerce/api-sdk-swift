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
 API Response for Note_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/note_insert
 */
public class NoteInsertResponse : Response {

    /// The response model
    public var note : Optional<Note> = nil

    /**
     Getter for note.

     - Returns: Note
     */
    public func getNote() -> Optional<Note> {
        return self.note
    }

    /**
     CodingKeys used to map the model when decoding.

     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case note = "data"
    }

    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.note = try container.decodeIfPresent(Note.self, forKey: .note)
        try super.init(from : decoder)
    }
}