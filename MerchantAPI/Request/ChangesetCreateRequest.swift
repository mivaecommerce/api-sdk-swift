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
 Handles API Request Changeset_Create.

 - SeeAlso: https://docs.miva.com/json-api/functions/changeset_create
 */
public class ChangesetCreateRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Changeset_Create"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Branch_ID.
    var branchId : Optional<Int> = nil

    /// Request field Branch_Name.
    var branchName : Optional<String> = nil

    /// Request field Edit_Branch.
    var editBranch : Optional<String> = nil

    /// Request field Notes.
    var notes : Optional<String> = nil

    /// Request field Tags.
    var tags : Optional<String> = nil

    /// Request field Template_Changes.
    var templateChanges : [TemplateChange] = []

    /// Request field ResourceGroup_Changes.
    var resourceGroupChanges : [ResourceGroupChange] = []

    /// Request field CSSResource_Changes.
    var CSSResourceChanges : [CSSResourceChange] = []

    /// Request field JavaScriptResource_Changes.
    var javaScriptResourceChanges : [JavaScriptResourceChange] = []

    /// Request field Property_Changes.
    var propertyChanges : [PropertyChange] = []

    /// Request field Module_Changes.
    var moduleChanges : [ModuleChange] = []

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case branchId = "Branch_ID"
        case branchName = "Branch_Name"
        case editBranch = "Edit_Branch"
        case notes = "Notes"
        case tags = "Tags"
        case templateChanges = "Template_Changes"
        case resourceGroupChanges = "ResourceGroup_Changes"
        case CSSResourceChanges = "CSSResource_Changes"
        case javaScriptResourceChanges = "JavaScriptResource_Changes"
        case propertyChanges = "Property_Changes"
        case moduleChanges = "Module_Changes"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - branch: An optional Branch instance.
     */
    public init(client: Optional<BaseClient> = nil, branch: Optional<Branch> = nil) {
        super.init(client: client)
        if let branch = branch {
            if branch.id > 0 {
                self.branchId = branch.id
            }

            self.branchName = branch.name
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

        if self.branchId != nil {
            try container.encodeIfPresent(self.branchId, forKey: .branchId)
        } else if self.branchName != nil {
            try container.encode(self.branchName, forKey: .branchName)
        } else if self.editBranch != nil {
            try container.encode(self.editBranch, forKey: .editBranch)
        }

        try container.encodeIfPresent(self.branchName, forKey: .branchName)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encodeIfPresent(self.tags, forKey: .tags)
        try container.encodeIfPresent(self.templateChanges, forKey: .templateChanges)
        try container.encodeIfPresent(self.resourceGroupChanges, forKey: .resourceGroupChanges)
        try container.encodeIfPresent(self.CSSResourceChanges, forKey: .CSSResourceChanges)
        try container.encodeIfPresent(self.javaScriptResourceChanges, forKey: .javaScriptResourceChanges)
        try container.encodeIfPresent(self.propertyChanges, forKey: .propertyChanges)
        try container.encodeIfPresent(self.moduleChanges, forKey: .moduleChanges)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ChangesetCreateResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ChangesetCreateResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? ChangesetCreateResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> ChangesetCreateResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(ChangesetCreateResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return ChangesetCreateResponse.self
    }

    /**
     Getter for Branch_ID.

     - Returns:  Optional<Int>
     */
    public func getBranchId() -> Optional<Int> {
        return self.branchId
    }

    /**
     Getter for Branch_Name.

     - Returns:  Optional<String>
     */
    public func getBranchName() -> Optional<String> {
        return self.branchName
    }

    /**
     Getter for Edit_Branch.

     - Returns:  Optional<String>
     */
    public func getEditBranch() -> Optional<String> {
        return self.editBranch
    }

    /**
     Getter for Notes.

     - Returns:  Optional<String>
     */
    public func getNotes() -> Optional<String> {
        return self.notes
    }

    /**
     Getter for Tags.

     - Returns:  Optional<String>
     */
    public func getTags() -> Optional<String> {
        return self.tags
    }

    /**
     Getter for Template_Changes.

     - Returns:  [TemplateChange]
     */
    public func getTemplateChanges() -> [TemplateChange] {
        return self.templateChanges
    }

    /**
     Getter for ResourceGroup_Changes.

     - Returns:  [ResourceGroupChange]
     */
    public func getResourceGroupChanges() -> [ResourceGroupChange] {
        return self.resourceGroupChanges
    }

    /**
     Getter for CSSResource_Changes.

     - Returns:  [CSSResourceChange]
     */
    public func getCSSResourceChanges() -> [CSSResourceChange] {
        return self.CSSResourceChanges
    }

    /**
     Getter for JavaScriptResource_Changes.

     - Returns:  [JavaScriptResourceChange]
     */
    public func getJavaScriptResourceChanges() -> [JavaScriptResourceChange] {
        return self.javaScriptResourceChanges
    }

    /**
     Getter for Property_Changes.

     - Returns:  [PropertyChange]
     */
    public func getPropertyChanges() -> [PropertyChange] {
        return self.propertyChanges
    }

    /**
     Getter for Module_Changes.

     - Returns:  [ModuleChange]
     */
    public func getModuleChanges() -> [ModuleChange] {
        return self.moduleChanges
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
     Setter for Notes.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setNotes(_ value: Optional<String>) -> Self {
        self.notes = value
        return self
    }

    /**
     Setter for Tags.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setTags(_ value: Optional<String>) -> Self {
        self.tags = value
        return self
    }

    /**
     Add a TemplateChange.

     - Parameters:
        - templateChange: TemplateChange
     - Returns: Self
     */
    @discardableResult
    public func addTemplateChange(_ templateChange : TemplateChange) -> Self {
        self.templateChanges.append(templateChange)
        return self
    }

    /**
     Add an array of TemplateChange.

     - Parameters:
        - templateChanges: [TemplateChange]
     - Returns: Self
     */
    @discardableResult
    public func addTemplateChanges(_ templateChanges: [TemplateChange]) -> Self {
        for t in templateChanges {
            self.templateChanges.append(t);
        }

        return self
    }

    /**
     Add a ResourceGroupChange.

     - Parameters:
        - resourceGroupChange: ResourceGroupChange
     - Returns: Self
     */
    @discardableResult
    public func addResourceGroupChange(_ resourceGroupChange : ResourceGroupChange) -> Self {
        self.resourceGroupChanges.append(resourceGroupChange)
        return self
    }

    /**
     Add an array of ResourceGroupChange.

     - Parameters:
        - resourceGroupChanges: [ResourceGroupChange]
     - Returns: Self
     */
    @discardableResult
    public func addResourceGroupChanges(_ resourceGroupChanges: [ResourceGroupChange]) -> Self {
        for r in resourceGroupChanges {
            self.resourceGroupChanges.append(r);
        }

        return self
    }

    /**
     Add a CSSResourceChange.

     - Parameters:
        - CSSResourceChange: CSSResourceChange
     - Returns: Self
     */
    @discardableResult
    public func addCSSResourceChange(_ CSSResourceChange : CSSResourceChange) -> Self {
        self.CSSResourceChanges.append(CSSResourceChange)
        return self
    }

    /**
     Add an array of CSSResourceChange.

     - Parameters:
        - CSSResourceChanges: [CSSResourceChange]
     - Returns: Self
     */
    @discardableResult
    public func addCSSResourceChanges(_ CSSResourceChanges: [CSSResourceChange]) -> Self {
        for C in CSSResourceChanges {
            self.CSSResourceChanges.append(C);
        }

        return self
    }

    /**
     Add a JavaScriptResourceChange.

     - Parameters:
        - javaScriptResourceChange: JavaScriptResourceChange
     - Returns: Self
     */
    @discardableResult
    public func addJavaScriptResourceChange(_ javaScriptResourceChange : JavaScriptResourceChange) -> Self {
        self.javaScriptResourceChanges.append(javaScriptResourceChange)
        return self
    }

    /**
     Add an array of JavaScriptResourceChange.

     - Parameters:
        - javaScriptResourceChanges: [JavaScriptResourceChange]
     - Returns: Self
     */
    @discardableResult
    public func addJavaScriptResourceChanges(_ javaScriptResourceChanges: [JavaScriptResourceChange]) -> Self {
        for j in javaScriptResourceChanges {
            self.javaScriptResourceChanges.append(j);
        }

        return self
    }

    /**
     Add a PropertyChange.

     - Parameters:
        - propertyChange: PropertyChange
     - Returns: Self
     */
    @discardableResult
    public func addPropertyChange(_ propertyChange : PropertyChange) -> Self {
        self.propertyChanges.append(propertyChange)
        return self
    }

    /**
     Add an array of PropertyChange.

     - Parameters:
        - propertyChanges: [PropertyChange]
     - Returns: Self
     */
    @discardableResult
    public func addPropertyChanges(_ propertyChanges: [PropertyChange]) -> Self {
        for p in propertyChanges {
            self.propertyChanges.append(p);
        }

        return self
    }

    /**
     Add a ModuleChange.

     - Parameters:
        - moduleChange: ModuleChange
     - Returns: Self
     */
    @discardableResult
    public func addModuleChange(_ moduleChange : ModuleChange) -> Self {
        self.moduleChanges.append(moduleChange)
        return self
    }

    /**
     Add an array of ModuleChange.

     - Parameters:
        - moduleChanges: [ModuleChange]
     - Returns: Self
     */
    @discardableResult
    public func addModuleChanges(_ moduleChanges: [ModuleChange]) -> Self {
        for m in moduleChanges {
            self.moduleChanges.append(m);
        }

        return self
    }
}
