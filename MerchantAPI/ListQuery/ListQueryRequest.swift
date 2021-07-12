/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

/// Abstract class which all List_Load_Query API functions must inherit.
public class ListQueryRequest : Request {

    /// Available sort directions
    public enum SortDirection : String {
        case Ascending  = "asc"
        case Descending = "desc"
    }

    /**
     The sort field to sort results by.

     - SeeAlso: availableSortFields
     */
    var sort : Optional<String> = nil

    /// The set on demand columns for request.
    var onDemandColumns : [String] = []

    /// The set custom filters for request.
    var customFilters : [String : AnyEncodable] = [:]

    /// The available search fields. Override this if needed.
    var availableSearchFields : [String] {
        get {
            return []
        }
    }

    /// The available sort fields. Override this if needed.
    var availableSortFields : [String] {
        get {
            return []
        }
    }

    /// The available on demand columns. Override this if needed.
    var availableOnDemandColumns : [String] {
        get {
            return []
        }
    }

    /// The available on custom filters. Override this if needed.
    var availableCustomFilters : [String] {
        get {
            return []
        }
    }

    /// The optional result offset to request.
    var offset : Optional<Int> = nil

    /// The optional number of results to return back.
    var count : Optional<Int> = nil

    /// The filter expression instance to filter results with.
    var filter : FilterExpression = FilterExpression()

    /**
     CodingKeys used for encoding the request.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey
    {
        case offset  = "Offset"
        case count   = "Count"
        case sort    = "Sort"
        case filter  = "Filter"
    }

    /**
     CodingKeys used for encoding the custom filters in the request.

     - SeeAlso: Encodable
     */
    private enum CustomFilterCodingKeys: String, CodingKey
    {
        case name
        case value
    }

    /**
     Constructor.

     - Parameters:
        - client: The Client to send the request from.
     */
    public override init(client: Optional<BaseClient> = nil) {
        super.init(client: client)
        self.filter.request = self
    }

    /**
     Encodes the request into an Encoder instance.

     - SeeAlso: Encodable
     - Throws: When unable to encode the request.
     */
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to : encoder)

        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.offset, forKey: .offset)
        try container.encodeIfPresent(self.count, forKey: .count)
        try container.encodeIfPresent(self.sort, forKey: .sort)

        var filtersContainer = container.nestedUnkeyedContainer(forKey: .filter)

        if self.onDemandColumns.count > 0 {
            var onDemandContainer = filtersContainer.nestedContainer(keyedBy: CustomFilterCodingKeys.self)
            try onDemandContainer.encode("ondemandcolumns", forKey: .name)
            try onDemandContainer.encode(self.onDemandColumns, forKey: .value)
        }

        for filter in self.filter.getEntries() {
            try filtersContainer.encode(filter)
        }

        if self.customFilters.count > 0 {
            for (k, v) in customFilters {
                var onDemandContainer = filtersContainer.nestedContainer(keyedBy: CustomFilterCodingKeys.self)
                try onDemandContainer.encode(k, forKey: .name)
                try onDemandContainer.encode(v, forKey: .value)
            }
        }
    }

    /**
     Get the available serach fields for the request.

     - Returns: [String]
     */

    public func getAvailableSearchFields() -> [String] {
        return self.availableSearchFields
    }

    /**
     Get the available sort fields for the request.

     - Returns: [String]
     */
    public func getAvailableSortFields() -> [String] {
        return self.availableSortFields
    }

    /**
     Get the available on demand columns for the request.

     - Returns: [String]
     */
    public func getAvailableOnDemandColumns() -> [String] {
        return self.availableOnDemandColumns
    }

    /**
     Get the available custom filters for the request.

     - Returns: [String]
     */
    public func getAvailableCustomFilters() -> [String] {
        return self.availableCustomFilters
    }

    /**
     Add an on demand column to request.

     - Parameters:
        - column: The column name.
     - Returns: Self
     */
    @discardableResult
    public func addOnDemandColumn(_ column: String) -> Self {
        self.onDemandColumns.append(column)

        return self
    }

    /**
     Add an array of on demand column to request.

     - Parameters:
        - columns: The column names.
     - Returns: Self
     */
    @discardableResult
    public func addOnDemandColumns(_ columns: [String]) -> Self {
        for column in columns {
            self.onDemandColumns.append(column)
        }

        return self
    }

    /**
     Set and replace the on demand column to request with the passed array of column names.

     - Parameters:
        - columns: The column names.
     - Returns: Self
     */
    @discardableResult
    public func setOnDemandColumns(_ columns: [String]) -> Self {
        self.onDemandColumns.removeAll()

        for column in columns {
            self.onDemandColumns.append(column)
        }

        return self
    }

    /**
     Add/Set a custom filter with any encodable value to the request.

     - Parameters:
     - field: The column name.
     - value: The column value.
     - Returns: Self
     */
    @discardableResult
    public func setCustomFilter<T:Encodable>(_ field: String, _ value: T) -> Self {
        self.customFilters[field] = AnyEncodable(value)
        return self
    }

    /**
     Set and replace the on demand column to request with the passed array of column names.

     - Parameters:
         - field: The field name to sort on.
         - direction: SortDirection
     - Returns: Self
     */
    @discardableResult
    public func setSort(_ field: String, _ direction: SortDirection = SortDirection.Ascending) -> Self {
        var field = field

        if direction == SortDirection.Descending && !field.starts(with: "-") {
            field = "-" + field
        }

        self.sort = field

        return self
    }

    /**
     Get the sort value.

     - Returns: String
     */
    public func getSort() -> Optional<String> {
        return self.sort
    }

    /**
     Get the filter instance.

     - Returns: FilterExpression
     */
    public func getFilter() -> FilterExpression {
        return self.filter
    }

    /**
     Set the filter instance.

     - Parameters:
        - filter: FilterExpression
     - Returns: Self
     */
    @discardableResult
    public func setFilter(_ filter: FilterExpression) -> Self {
        self.filter = filter
        return self
    }

    /**
     Set the record offset to request.

     - Parameters:
        - offset: Optional<Int>
     - Returns: Self
     */
    @discardableResult
    public func setOffset(_ offset: Optional<Int>) -> Self {
        self.offset = offset
        return self
    }

    /**
     Get the record offset to request.

     - Returns: Optional<Int>
     */
    public func getOffset() -> Optional<Int> {
        return self.offset
    }

    /**
     Set the record count to request.

     - Parameters:
     - offset: Optional<Int>
     - Returns: Self
     */
    @discardableResult
    public func setCount(_ count: Optional<Int>) -> Self {
        self.count = count
        return self
    }

    /**
     Get the record count to request.

     - Returns: Optional<Int>
     */
    public func getCount() -> Optional<Int> {
        return self.count
    }

    /**
     Create a response object by decoding the response data.

     - Parameters:
         - httpResponse: The underlying HTTP response object
         - data: The response data to decode.
     - Throws: When method not overridden by inheritor.
     - Note: Overrides
     */
    override public func createResponse(httpResponse: URLResponse, data : Data) throws -> ListQueryResponse {
        fatalError("Method must be overridden")
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (ListQueryResponse?, Error?).
     - Throws: When method not overridden by inheritor.
     - Note: Overrides
     */
    public override func send(client: Optional<BaseClient> = nil, callback: @escaping (ListQueryResponse?, Error?) -> ()) throws {
        fatalError("Method must be overridden")
    }
}
