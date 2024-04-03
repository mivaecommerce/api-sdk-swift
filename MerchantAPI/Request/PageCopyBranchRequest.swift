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
 Handles API Request Page_Copy_Branch.

 - SeeAlso: https://docs.miva.com/json-api/functions/page_copy_branch
 */
public class PageCopyBranchRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Page_Copy_Branch"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Source_Page_ID.
    var sourcePageId : Optional<Int> = nil

    /// Request field Source_Edit_Page.
    var sourceEditPage : Optional<String> = nil

    /// Request field Source_Page_Code.
    var sourcePageCode : Optional<String> = nil

    /// Request field Dest_Branch_ID.
    var destinationBranchId : Optional<Int> = nil

    /// Request field Dest_Edit_Branch.
    var destinationEditBranch : Optional<String> = nil

    /// Request field Dest_Branch_Name.
    var destinationBranchName : Optional<String> = nil

    /// Request field CopyPageRules_ID.
    var copyPageRulesId : Optional<Int> = nil

    /// Request field CopyPageRules_Name.
    var copyPageRulesName : Optional<String> = nil

    /// Request field Changeset_Notes.
    var changesetNotes : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case sourcePageId = "Source_Page_ID"
        case sourceEditPage = "Source_Edit_Page"
        case sourcePageCode = "Source_Page_Code"
        case destinationBranchId = "Dest_Branch_ID"
        case destinationEditBranch = "Dest_Edit_Branch"
        case destinationBranchName = "Dest_Branch_Name"
        case copyPageRulesId = "CopyPageRules_ID"
        case copyPageRulesName = "CopyPageRules_Name"
        case changesetNotes = "Changeset_Notes"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - page: An optional Page instance.
     */
    public init(client: Optional<BaseClient> = nil, page: Optional<Page> = nil) {
        super.init(client: client)
        if let page = page {
            if page.id > 0 {
                self.sourcePageId = page.id
            } else if page.code.count > 0 {
                self.sourceEditPage = page.code
            }
        }
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encode: A Encoder instance to encode to.
     - Throws: Error when unable to encode the request data.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if self.sourcePageId != nil {
            try container.encodeIfPresent(self.sourcePageId, forKey: .sourcePageId)
        } else if self.sourceEditPage != nil {
            try container.encode(self.sourceEditPage, forKey: .sourceEditPage)
        } else if self.sourcePageCode != nil {
            try container.encode(self.sourcePageCode, forKey: .sourcePageCode)
        }

        if self.destinationBranchId != nil {
            try container.encodeIfPresent(self.destinationBranchId, forKey: .destinationBranchId)
        } else if self.destinationEditBranch != nil {
            try container.encode(self.destinationEditBranch, forKey: .destinationEditBranch)
        } else if self.destinationBranchName != nil {
            try container.encode(self.destinationBranchName, forKey: .destinationBranchName)
        }

        if self.copyPageRulesId != nil {
            try container.encodeIfPresent(self.copyPageRulesId, forKey: .copyPageRulesId)
        } else if self.copyPageRulesName != nil {
            try container.encode(self.copyPageRulesName, forKey: .copyPageRulesName)
        }

        try container.encodeIfPresent(self.changesetNotes, forKey: .changesetNotes)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PageCopyBranchResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PageCopyBranchResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PageCopyBranchResponse, error)
            }
        } else {
            throw RequestError.noClientAssigned
        }
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
        - httpResponse: The underlying HTTP response object
        - data: The response data to decode.
     - Throws: Error when unable to decode the response data.
     - Note: Overrides
     */
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PageCopyBranchResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PageCopyBranchResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PageCopyBranchResponse.self
    }

    /**
     Getter for Source_Page_ID.

     - Returns:  Optional<Int>
     */
    public func getSourcePageId() -> Optional<Int> {
        return self.sourcePageId
    }

    /**
     Getter for Source_Edit_Page.

     - Returns:  Optional<String>
     */
    public func getSourceEditPage() -> Optional<String> {
        return self.sourceEditPage
    }

    /**
     Getter for Source_Page_Code.

     - Returns:  Optional<String>
     */
    public func getSourcePageCode() -> Optional<String> {
        return self.sourcePageCode
    }

    /**
     Getter for Dest_Branch_ID.

     - Returns:  Optional<Int>
     */
    public func getDestinationBranchId() -> Optional<Int> {
        return self.destinationBranchId
    }

    /**
     Getter for Dest_Edit_Branch.

     - Returns:  Optional<String>
     */
    public func getDestinationEditBranch() -> Optional<String> {
        return self.destinationEditBranch
    }

    /**
     Getter for Dest_Branch_Name.

     - Returns:  Optional<String>
     */
    public func getDestinationBranchName() -> Optional<String> {
        return self.destinationBranchName
    }

    /**
     Getter for CopyPageRules_ID.

     - Returns:  Optional<Int>
     */
    public func getCopyPageRulesId() -> Optional<Int> {
        return self.copyPageRulesId
    }

    /**
     Getter for CopyPageRules_Name.

     - Returns:  Optional<String>
     */
    public func getCopyPageRulesName() -> Optional<String> {
        return self.copyPageRulesName
    }

    /**
     Getter for Changeset_Notes.

     - Returns:  Optional<String>
     */
    public func getChangesetNotes() -> Optional<String> {
        return self.changesetNotes
    }

    /**
     Setter for Source_Page_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setSourcePageId(_ value: Optional<Int>) -> Self {
        self.sourcePageId = value
        return self
    }

    /**
     Setter for Source_Edit_Page.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setSourceEditPage(_ value: Optional<String>) -> Self {
        self.sourceEditPage = value
        return self
    }

    /**
     Setter for Source_Page_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setSourcePageCode(_ value: Optional<String>) -> Self {
        self.sourcePageCode = value
        return self
    }

    /**
     Setter for Dest_Branch_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationBranchId(_ value: Optional<Int>) -> Self {
        self.destinationBranchId = value
        return self
    }

    /**
     Setter for Dest_Edit_Branch.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationEditBranch(_ value: Optional<String>) -> Self {
        self.destinationEditBranch = value
        return self
    }

    /**
     Setter for Dest_Branch_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationBranchName(_ value: Optional<String>) -> Self {
        self.destinationBranchName = value
        return self
    }

    /**
     Setter for CopyPageRules_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyPageRulesId(_ value: Optional<Int>) -> Self {
        self.copyPageRulesId = value
        return self
    }

    /**
     Setter for CopyPageRules_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCopyPageRulesName(_ value: Optional<String>) -> Self {
        self.copyPageRulesName = value
        return self
    }

    /**
     Setter for Changeset_Notes.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setChangesetNotes(_ value: Optional<String>) -> Self {
        self.changesetNotes = value
        return self
    }
}
