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
 Handles API Request CopyPageRules_Update.

 - SeeAlso: https://docs.miva.com/json-api/functions/copypagerules_update
 */
public class CopyPageRulesUpdateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "CopyPageRules_Update"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field CopyPageRules_ID.
    var copyPageRulesId : Optional<Int> = nil

    /// Request field CopyPageRules_Name.
    var copyPageRulesName : Optional<String> = nil

    /// Request field Name.
    var name : Optional<String> = nil

    /// Request field Secure.
    var secure : Optional<Bool> = nil

    /// Request field Title.
    var title : Optional<Bool> = nil

    /// Request field Template.
    var template : Optional<Bool> = nil

    /// Request field Items.
    var items : Optional<Bool> = nil

    /// Request field Public.
    var isPublic : Optional<Bool> = nil

    /// Request field Settings.
    var settings : Optional<String> = nil

    /// Request field JavaScriptResourceAssignments.
    var javaScriptResourceAssignments : Optional<Bool> = nil

    /// Request field CSSResourceAssignments.
    var CSSResourceAssignments : Optional<Bool> = nil

    /// Request field CacheSettings.
    var cacheSettings : Optional<Bool> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case copyPageRulesId = "CopyPageRules_ID"
        case copyPageRulesName = "CopyPageRules_Name"
        case name = "Name"
        case secure = "Secure"
        case title = "Title"
        case template = "Template"
        case items = "Items"
        case isPublic = "Public"
        case settings = "Settings"
        case javaScriptResourceAssignments = "JavaScriptResourceAssignments"
        case CSSResourceAssignments = "CSSResourceAssignments"
        case cacheSettings = "CacheSettings"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - copyPageRule: An optional CopyPageRule instance.
     */
    public init(client: Optional<BaseClient> = nil, copyPageRule: Optional<CopyPageRule> = nil) {
        super.init(client: client)
        if let copyPageRule = copyPageRule {
            if copyPageRule.id > 0 {
                self.copyPageRulesId = copyPageRule.id
            } else if copyPageRule.name.count > 0 {
                self.copyPageRulesName = copyPageRule.name
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

        if self.copyPageRulesId != nil {
            try container.encodeIfPresent(self.copyPageRulesId, forKey: .copyPageRulesId)
        } else if self.copyPageRulesName != nil {
            try container.encode(self.copyPageRulesName, forKey: .copyPageRulesName)
        }

        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.secure, forKey: .secure)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.template, forKey: .template)
        try container.encodeIfPresent(self.items, forKey: .items)
        try container.encodeIfPresent(self.isPublic, forKey: .isPublic)
        try container.encodeIfPresent(self.settings, forKey: .settings)
        try container.encodeIfPresent(self.javaScriptResourceAssignments, forKey: .javaScriptResourceAssignments)
        try container.encodeIfPresent(self.CSSResourceAssignments, forKey: .CSSResourceAssignments)
        try container.encodeIfPresent(self.cacheSettings, forKey: .cacheSettings)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CopyPageRulesUpdateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CopyPageRulesUpdateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CopyPageRulesUpdateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CopyPageRulesUpdateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CopyPageRulesUpdateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CopyPageRulesUpdateResponse.self
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
     Getter for Name.

     - Returns:  Optional<String>
     */
    public func getName() -> Optional<String> {
        return self.name
    }

    /**
     Getter for Secure.

     - Returns:  Optional<Bool>
     */
    public func getSecure() -> Optional<Bool> {
        return self.secure
    }

    /**
     Getter for Title.

     - Returns:  Optional<Bool>
     */
    public func getTitle() -> Optional<Bool> {
        return self.title
    }

    /**
     Getter for Template.

     - Returns:  Optional<Bool>
     */
    public func getTemplate() -> Optional<Bool> {
        return self.template
    }

    /**
     Getter for Items.

     - Returns:  Optional<Bool>
     */
    public func getItems() -> Optional<Bool> {
        return self.items
    }

    /**
     Getter for Public.

     - Returns:  Optional<Bool>
     */
    public func getIsPublic() -> Optional<Bool> {
        return self.isPublic
    }

    /**
     Getter for Settings.

     - Returns:  Optional<String>
     */
    public func getSettings() -> Optional<String> {
        return self.settings
    }

    /**
     Enum Getter for Settings.

     - Returns:  Optional<CopyPageRule.PageRuleSettings>
     */
    public func getSettings() -> Optional<CopyPageRule.PageRuleSettings> {
        if let v = self.settings {
            return CopyPageRule.PageRuleSettings(rawValue: v) ?? nil
        }
        return nil;
    }

    /**
     Getter for JavaScriptResourceAssignments.

     - Returns:  Optional<Bool>
     */
    public func getJavaScriptResourceAssignments() -> Optional<Bool> {
        return self.javaScriptResourceAssignments
    }

    /**
     Getter for CSSResourceAssignments.

     - Returns:  Optional<Bool>
     */
    public func getCSSResourceAssignments() -> Optional<Bool> {
        return self.CSSResourceAssignments
    }

    /**
     Getter for CacheSettings.

     - Returns:  Optional<Bool>
     */
    public func getCacheSettings() -> Optional<Bool> {
        return self.cacheSettings
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
     Setter for Name.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setName(_ value: Optional<String>) -> Self {
        self.name = value
        return self
    }

    /**
     Setter for Secure.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setSecure(_ value: Optional<Bool>) -> Self {
        self.secure = value
        return self
    }

    /**
     Setter for Title.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setTitle(_ value: Optional<Bool>) -> Self {
        self.title = value
        return self
    }

    /**
     Setter for Template.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setTemplate(_ value: Optional<Bool>) -> Self {
        self.template = value
        return self
    }

    /**
     Setter for Items.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setItems(_ value: Optional<Bool>) -> Self {
        self.items = value
        return self
    }

    /**
     Setter for Public.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setIsPublic(_ value: Optional<Bool>) -> Self {
        self.isPublic = value
        return self
    }

    /**
     Setter for Settings.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setSettings(_ value: Optional<String>) -> Self {
        self.settings = value
        return self
    }

    /**
     Enum Setter for Settings.

     - Parameters:
        - value: CopyPageRule.PageRuleSettings
     - Returns:  Self
     */
    @discardableResult
    public func setSettings(_ value: CopyPageRule.PageRuleSettings) -> Self {
        self.settings = value.rawValue
        return self
    }

    /**
     Setter for JavaScriptResourceAssignments.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setJavaScriptResourceAssignments(_ value: Optional<Bool>) -> Self {
        self.javaScriptResourceAssignments = value
        return self
    }

    /**
     Setter for CSSResourceAssignments.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCSSResourceAssignments(_ value: Optional<Bool>) -> Self {
        self.CSSResourceAssignments = value
        return self
    }

    /**
     Setter for CacheSettings.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setCacheSettings(_ value: Optional<Bool>) -> Self {
        self.cacheSettings = value
        return self
    }
}
