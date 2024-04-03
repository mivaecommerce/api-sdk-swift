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
 Handles API Request Page_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/page_insert
 */
public class PageInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Page_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Page_Code.
    var pageCode : Optional<String> = nil

    /// Request field Page_Name.
    var pageName : Optional<String> = nil

    /// Request field Page_Title.
    var pageTitle : Optional<String> = nil

    /// Request field Page_Template.
    var pageTemplate : Optional<String> = nil

    /// Request field Page_Layout.
    var pageLayout : Optional<Bool> = nil

    /// Request field Page_Secure.
    var pageSecure : Optional<Bool> = nil

    /// Request field Page_Cache.
    var pageCache : Optional<String> = nil

    /// Request field Changeset_Notes.
    var changesetNotes : Optional<String> = nil

    /// Request field Page_URI.
    var pageUri : Optional<String> = nil

    /// Request field CustomField_Values.
    var customFieldValues : CustomFieldValues

    /// Request field Branch_ID.
    var branchId : Optional<Int> = nil

    /// Request field Edit_Branch.
    var editBranch : Optional<String> = nil

    /// Request field Branch_Name.
    var branchName : Optional<String> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case pageCode = "Page_Code"
        case pageName = "Page_Name"
        case pageTitle = "Page_Title"
        case pageTemplate = "Page_Template"
        case pageLayout = "Page_Layout"
        case pageSecure = "Page_Secure"
        case pageCache = "Page_Cache"
        case changesetNotes = "Changeset_Notes"
        case pageUri = "Page_URI"
        case customFieldValues = "CustomField_Values"
        case branchId = "Branch_ID"
        case editBranch = "Edit_Branch"
        case branchName = "Branch_Name"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
     */
    public override init(client: Optional<BaseClient> = nil) {
        self.customFieldValues = CustomFieldValues()
        super.init(client: client)
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

        if self.branchId != nil {
            try container.encodeIfPresent(self.branchId, forKey: .branchId)
        } else if self.editBranch != nil {
            try container.encode(self.editBranch, forKey: .editBranch)
        } else if self.branchName != nil {
            try container.encode(self.branchName, forKey: .branchName)
        }

        try container.encodeIfPresent(self.pageCode, forKey: .pageCode)
        try container.encodeIfPresent(self.pageName, forKey: .pageName)
        try container.encodeIfPresent(self.pageTitle, forKey: .pageTitle)
        try container.encodeIfPresent(self.pageTemplate, forKey: .pageTemplate)
        try container.encodeIfPresent(self.pageLayout, forKey: .pageLayout)
        try container.encodeIfPresent(self.pageSecure, forKey: .pageSecure)
        try container.encodeIfPresent(self.pageCache, forKey: .pageCache)
        try container.encodeIfPresent(self.changesetNotes, forKey: .changesetNotes)
        try container.encodeIfPresent(self.pageUri, forKey: .pageUri)
        try container.encodeIfPresent(self.customFieldValues, forKey: .customFieldValues)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (PageInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (PageInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? PageInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> PageInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(PageInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return PageInsertResponse.self
    }

    /**
     Getter for Page_Code.

     - Returns:  Optional<String>
     */
    public func getPageCode() -> Optional<String> {
        return self.pageCode
    }

    /**
     Getter for Page_Name.

     - Returns:  Optional<String>
     */
    public func getPageName() -> Optional<String> {
        return self.pageName
    }

    /**
     Getter for Page_Title.

     - Returns:  Optional<String>
     */
    public func getPageTitle() -> Optional<String> {
        return self.pageTitle
    }

    /**
     Getter for Page_Template.

     - Returns:  Optional<String>
     */
    public func getPageTemplate() -> Optional<String> {
        return self.pageTemplate
    }

    /**
     Getter for Page_Layout.

     - Returns:  Optional<Bool>
     */
    public func getPageLayout() -> Optional<Bool> {
        return self.pageLayout
    }

    /**
     Getter for Page_Secure.

     - Returns:  Optional<Bool>
     */
    public func getPageSecure() -> Optional<Bool> {
        return self.pageSecure
    }

    /**
     Getter for Page_Cache.

     - Returns:  Optional<String>
     */
    public func getPageCache() -> Optional<String> {
        return self.pageCache
    }

    /**
     Enum Getter for Page_Cache.

     - Returns:  Optional<Page.PageCacheType>
     */
    public func getPageCache() -> Optional<Page.PageCacheType> {
        if let v = self.pageCache {
            return Page.PageCacheType(rawValue: v) ?? nil
        }
        return nil;
    }

    /**
     Getter for Changeset_Notes.

     - Returns:  Optional<String>
     */
    public func getChangesetNotes() -> Optional<String> {
        return self.changesetNotes
    }

    /**
     Getter for Page_URI.

     - Returns:  Optional<String>
     */
    public func getPageUri() -> Optional<String> {
        return self.pageUri
    }

    /**
     Getter for CustomField_Values.

     - Returns:  CustomFieldValues
     */
    public func getCustomFieldValues() -> CustomFieldValues {
        return self.customFieldValues
    }

    /**
     Getter for Branch_ID.

     - Returns:  Optional<Int>
     */
    public func getBranchId() -> Optional<Int> {
        return self.branchId
    }

    /**
     Getter for Edit_Branch.

     - Returns:  Optional<String>
     */
    public func getEditBranch() -> Optional<String> {
        return self.editBranch
    }

    /**
     Getter for Branch_Name.

     - Returns:  Optional<String>
     */
    public func getBranchName() -> Optional<String> {
        return self.branchName
    }

    /**
     Setter for Page_Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPageCode(_ value: Optional<String>) -> Self {
        self.pageCode = value
        return self
    }

    /**
     Setter for Page_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPageName(_ value: Optional<String>) -> Self {
        self.pageName = value
        return self
    }

    /**
     Setter for Page_Title.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPageTitle(_ value: Optional<String>) -> Self {
        self.pageTitle = value
        return self
    }

    /**
     Setter for Page_Template.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPageTemplate(_ value: Optional<String>) -> Self {
        self.pageTemplate = value
        return self
    }

    /**
     Setter for Page_Layout.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setPageLayout(_ value: Optional<Bool>) -> Self {
        self.pageLayout = value
        return self
    }

    /**
     Setter for Page_Secure.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setPageSecure(_ value: Optional<Bool>) -> Self {
        self.pageSecure = value
        return self
    }

    /**
     Setter for Page_Cache.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPageCache(_ value: Optional<String>) -> Self {
        self.pageCache = value
        return self
    }

    /**
     Enum Setter for Page_Cache.

     - Parameters:
        - value: Page.PageCacheType
     - Returns:  Self
     */
    @discardableResult
    public func setPageCache(_ value: Page.PageCacheType) -> Self {
        self.pageCache = value.rawValue
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

    /**
     Setter for Page_URI.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setPageUri(_ value: Optional<String>) -> Self {
        self.pageUri = value
        return self
    }

    /**
     Setter for Branch_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setBranchId(_ value: Optional<Int>) -> Self {
        self.branchId = value
        return self
    }

    /**
     Setter for Edit_Branch.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setEditBranch(_ value: Optional<String>) -> Self {
        self.editBranch = value
        return self
    }

    /**
     Setter for Branch_Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setBranchName(_ value: Optional<String>) -> Self {
        self.branchName = value
        return self
    }
}
