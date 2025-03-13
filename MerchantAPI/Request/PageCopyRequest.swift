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
 Handles API Request Page_Copy.

 - SeeAlso: https://docs.miva.com/json-api/functions/page_copy
 */
public class PageCopyRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Page_Copy"
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

    /// Request field CopyPageRules_ID.
    var copyPageRulesId : Optional<Int> = nil

    /// Request field CopyPageRules_Name.
    var copyPageRulesName : Optional<String> = nil

    /// Request field Dest_Page_ID.
    var destinationPageId : Optional<Int> = nil

    /// Request field Dest_Edit_Page.
    var destinationEditPage : Optional<String> = nil

    /// Request field Dest_Page_Code.
    var destinationPageCode : Optional<String> = nil

    /// Request field Dest_Page_Create.
    var destinationPageCreate : Optional<Bool> = nil

    /// Request field Changeset_Notes.
    var changesetNotes : Optional<String> = nil

    /// Request field Dest_Page_Name.
    var destinationPageName : Optional<String> = nil

    /// Request field Dest_Page_Layout.
    var destinationPageLayout : Optional<Bool> = nil

    /// Request field Dest_Page_Fragment.
    var destinationPageFragment : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case sourcePageId = "Source_Page_ID"
        case sourceEditPage = "Source_Edit_Page"
        case sourcePageCode = "Source_Page_Code"
        case copyPageRulesId = "CopyPageRules_ID"
        case copyPageRulesName = "CopyPageRules_Name"
        case destinationPageId = "Dest_Page_ID"
        case destinationEditPage = "Dest_Edit_Page"
        case destinationPageCode = "Dest_Page_Code"
        case destinationPageCreate = "Dest_Page_Create"
        case changesetNotes = "Changeset_Notes"
        case destinationPageName = "Dest_Page_Name"
        case destinationPageLayout = "Dest_Page_Layout"
        case destinationPageFragment = "Dest_Page_Fragment"
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
            } else if page.code.count > 0 {
                self.sourcePageCode = page.code
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

        if self.destinationPageId != nil {
            try container.encodeIfPresent(self.destinationPageId, forKey: .destinationPageId)
        } else if self.destinationEditPage != nil {
            try container.encode(self.destinationEditPage, forKey: .destinationEditPage)
        }

        if self.copyPageRulesId != nil {
            try container.encodeIfPresent(self.copyPageRulesId, forKey: .copyPageRulesId)
        } else if self.copyPageRulesName != nil {
            try container.encode(self.copyPageRulesName, forKey: .copyPageRulesName)
        }

        try container.encodeIfPresent(self.destinationPageCode, forKey: .destinationPageCode)
        try container.encodeIfPresent(self.destinationPageCreate, forKey: .destinationPageCreate)
        try container.encodeIfPresent(self.changesetNotes, forKey: .changesetNotes)
        try container.encodeIfPresent(self.destinationPageName, forKey: .destinationPageName)
        try container.encodeIfPresent(self.destinationPageLayout, forKey: .destinationPageLayout)
        try container.encodeIfPresent(self.destinationPageFragment, forKey: .destinationPageFragment)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PageCopyResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PageCopyResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PageCopyResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PageCopyResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PageCopyResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PageCopyResponse.self
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
     Getter for Dest_Page_ID.

     - Returns:  Optional<Int>
     */
    public func getDestinationPageId() -> Optional<Int> {
        return self.destinationPageId
    }

    /**
     Getter for Dest_Edit_Page.

     - Returns:  Optional<String>
     */
    public func getDestinationEditPage() -> Optional<String> {
        return self.destinationEditPage
    }

    /**
     Getter for Dest_Page_Code.

     - Returns:  Optional<String>
     */
    public func getDestinationPageCode() -> Optional<String> {
        return self.destinationPageCode
    }

    /**
     Getter for Dest_Page_Create.

     - Returns:  Optional<Bool>
     */
    public func getDestinationPageCreate() -> Optional<Bool> {
        return self.destinationPageCreate
    }

    /**
     Getter for Changeset_Notes.

     - Returns:  Optional<String>
     */
    public func getChangesetNotes() -> Optional<String> {
        return self.changesetNotes
    }

    /**
     Getter for Dest_Page_Name.

     - Returns:  Optional<String>
     */
    public func getDestinationPageName() -> Optional<String> {
        return self.destinationPageName
    }

    /**
     Getter for Dest_Page_Layout.

     - Returns:  Optional<Bool>
     */
    public func getDestinationPageLayout() -> Optional<Bool> {
        return self.destinationPageLayout
    }

    /**
     Getter for Dest_Page_Fragment.

     - Returns:  Optional<Bool>
     */
    public func getDestinationPageFragment() -> Optional<Bool> {
        return self.destinationPageFragment
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
     Setter for Dest_Page_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationPageId(_ value: Optional<Int>) -> Self {
        self.destinationPageId = value
        return self
    }

    /**
     Setter for Dest_Edit_Page.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationEditPage(_ value: Optional<String>) -> Self {
        self.destinationEditPage = value
        return self
    }

    /**
     Setter for Dest_Page_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationPageCode(_ value: Optional<String>) -> Self {
        self.destinationPageCode = value
        return self
    }

    /**
     Setter for Dest_Page_Create.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationPageCreate(_ value: Optional<Bool>) -> Self {
        self.destinationPageCreate = value
        return self
    }

    /**
     Setter for Dest_Page_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationPageName(_ value: Optional<String>) -> Self {
        self.destinationPageName = value
        return self
    }

    /**
     Setter for Dest_Page_Layout.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationPageLayout(_ value: Optional<Bool>) -> Self {
        self.destinationPageLayout = value
        return self
    }

    /**
     Setter for Dest_Page_Fragment.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setDestinationPageFragment(_ value: Optional<Bool>) -> Self {
        self.destinationPageFragment = value
        return self
    }
}
