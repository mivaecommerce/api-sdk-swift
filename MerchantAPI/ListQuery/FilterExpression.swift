/*
 * This file is part of the MerchantAPI package.
 *
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

// Used internally in FilterExpression
public struct FilterExpressionOperation {
    var left   : String
    var right  : Optional<String>
    var op     : FilterExpression.SearchOperator
    var type   : FilterExpression.SearchType
}

// Used internally in FilterExpression
public class FilterExpressionEntry : Encodable {
    /// The owner of the entry
    var parent      : FilterExpression

    /// The type of search
    var type        : FilterExpression.SearchType

    // The operation details, for operation entries
    var operation   : Optional<FilterExpressionOperation>

    // The nested expression for expression entries
    var expression  : Optional<FilterExpression>

    /**
     Construct as an operation entry.

     - Parameters:
         - parent: FilterExpression
         - type: FilterExpression.SearchType
         - operation: FilterExpressionOperation
     */
    public init(parent: FilterExpression, type: FilterExpression.SearchType, operation: FilterExpressionOperation) {
        self.parent     = parent
        self.type       = type
        self.operation  = operation
        self.expression = nil
    }

    /**
     Construct as a nested expression entry.

     - Parameters:
         - parent: FilterExpression
         - type: FilterExpression.SearchType
         - expression: FilterExpression
     */
    public init(parent: FilterExpression, type: FilterExpression.SearchType, expression: FilterExpression) {
        self.parent     = parent
        self.type       = type
        self.operation  = nil
        self.expression = expression
    }

    /**
     CodingKeys used for encoding the request.

     - SeeAlso: Encodable
     */
    enum CodingKeys: String, CodingKey {
        case field
        case op = "operator"
        case value
        case name
    }

    /**
     Encodes the expression into an Encoder instance as an array.

     - SeeAlso: Encodable
     - Throws: When unable to encode the filters.
     */
    public func encode(to encoder: Encoder) throws {
        if let expression = self.expression {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(self.type.rawValue, forKey: .name)

            var subwhereContainer = container.nestedUnkeyedContainer(forKey: .value)

            for subwhere in expression.getEntries() {
                try subwhereContainer.encode(subwhere)
            }
        } else if let operation = self.operation {
            if self.parent.isChild() {
                var container = encoder.container(keyedBy: CodingKeys.self)

                try container.encode(self.type.rawValue, forKey: .field)
                try container.encode(FilterExpression.SearchOperator.SUBWHERE.rawValue, forKey: .op)

                var valueContainer = container.nestedUnkeyedContainer(forKey: .value)

                var valueEntry = valueContainer.nestedContainer(keyedBy: CodingKeys.self)

                try valueEntry.encode(operation.left, forKey: .field)
                try valueEntry.encode(operation.op.rawValue, forKey: .op)
                try valueEntry.encode(operation.right, forKey: .value)
            } else {
                var container = encoder.container(keyedBy: CodingKeys.self)

                try container.encode(operation.type.rawValue, forKey: .name)

                var valueContainer  = container.nestedUnkeyedContainer(forKey: .value)
                var valueEntry      = valueContainer.nestedContainer(keyedBy: CodingKeys.self)

                try valueEntry.encode(operation.left, forKey: .field)
                try valueEntry.encode(operation.op.rawValue, forKey: .op)
                try valueEntry.encode(operation.right, forKey: .value)
            }
        }
    }
}

/// The allowed types of values must enforce this protocol.
public protocol FilterValue {
    func toFilterValue() -> String
}

/// The allowed types of numeric values for related operators.
public protocol FilterNumericValue : FilterValue {}

// Floats are a valid FilterValue as well as a valid FilterNumericValue
extension Float: FilterValue, FilterNumericValue {
    public func toFilterValue() -> String {
        return String(self)
    }
}

// Doubles are a valid FilterValue as well as a valid FilterNumericValue
extension Double: FilterValue, FilterNumericValue {
    public func toFilterValue() -> String {
        return String(self)
    }
}

// Ints are a valid FilterValue as well as a valid FilterNumericValue
extension Int: FilterValue, FilterNumericValue {
    public func toFilterValue() -> String {
        return String(self)
    }
}

// Strings are a valid FilterValue
extension String: FilterValue {
    public func toFilterValue() -> String {
        return self
    }
}

/**
 Used for building search filter expressions.

 - SeeAlso: ListQueryRequest
 */
public class FilterExpression {

    /// Available search types.
    public enum SearchType : String {
        case FilterSearch       = "search"
        case FilterSearchAnd    = "search_AND"
        case FilterSearchOr     = "search_OR"
    }

    /// Available search operators.
    public enum SearchOperator : String {
        /// Operator Equals
        case EQ         = "EQ"
        /// Operator Greater Than
        case GT         = "GT"
        /// Operator Greater Than or Equal
        case GE         = "GE"
        /// Operator Less Than
        case LT         = "LT"
        /// Operator Less Than or Equal
        case LE         = "LE"
        /// Operator Contains
        case CO         = "CO"
        /// Operator Does Not Contain
        case NC         = "NC"
        /// Operator Like
        case LIKE       = "LIKE"
        /// Operator Not Like
        case NOTLIKE    = "NOTLIKE"
        /// Operator Not Equal
        case NE         = "NE"
        /// Operator True
        case TRUE       = "TRUE"
        /// Operator False
        case FALSE      = "FALSE"
        /// Operator Is Null
        case NULL       = "NULL"
        /// Operator In Set (comma separated list)
        case IN         = "IN"
        /// Operator Not In Set (comma separated list)
        case NOT_IN     = "NOT_IN"
        /// Operator SUBWHERE
        case SUBWHERE   = "SUBWHERE"
    }

    /// The ListQueryRequest instance to get meta information from.
    var request : Optional<ListQueryRequest> = nil

    /// The parent instance used in nesting expressions.
    var parent : Optional<FilterExpression> = nil

    /// The assigned operations or nested expressions for the instance.
    var entries : [ FilterExpressionEntry ] = []

    /**
     Constructor.

     - Parameters:
        - request: Optional<ListQueryRequest>
     */
    public init(request : Optional<ListQueryRequest> = nil) {
        self.request = request
    }

    /**
     Get the operation/nested expression entries.

     - Returns: [FilterExpressionEntry]
     */
    public func getEntries() -> [FilterExpressionEntry] {
        return self.entries
    }

    /**
     Check if this is a nested expression.

     - Returns: Bool
     */
    public func isChild() -> Bool {
        return self.parent != nil
    }

    /**
     Create a new FilterExpression instance.

     - Returns: FilterExpression
     - SeeAlso: andX() orX() methods.
     */
    public func expr() -> FilterExpression {
        return FilterExpression(request: self.request)
    }

    /**
     Add a search operation into the expression container.

     - Parameters:
         - field: The field name
         - op: The operator type
         - value: The value
         - type: The search type
     - Returns: Self
     */
    @discardableResult
    public func add<T:FilterValue>(field : String, op : SearchOperator, value : Optional<T>, type : SearchType) -> Self {
        var type  = type

        if self.entries.count == 0 {
            type = SearchType.FilterSearch
        } else if self.entries.count > 0 && type == SearchType.FilterSearch {
            type = SearchType.FilterSearchOr
        }

        self.entries.append(FilterExpressionEntry(
            parent: self,
            type: SearchType.FilterSearchAnd,
            operation: FilterExpressionOperation(left: field, right: value?.toFilterValue(), op: op, type: type)
        ))

        return self
    }

    /**
     Add a search operation into the expression container whose value takes an array.

     - Parameters:
         - field: The field name
         - op: The operator type
         - values: The values
         - type: The search type
     - Returns: Self
     */
    @discardableResult
    public func add<T:FilterValue>(field : String, op : SearchOperator, values : [T], type : SearchType) -> Self {
        var type = type
        var _values : [String] = []

        if self.entries.count == 0 {
            type = SearchType.FilterSearch
        } else if self.entries.count > 0 && type == SearchType.FilterSearch {
            type = SearchType.FilterSearchOr
        }

        for value in values {
            _values.append(value.toFilterValue())
        }

        self.entries.append(FilterExpressionEntry(
            parent: self,
            type: SearchType.FilterSearchAnd,
            operation: FilterExpressionOperation(left: field, right: _values.joined(separator: ","), op: op, type: type)
       ))

        return self
    }

    /**
     Nest a FilterExpression as an AND caluse.

     - Parameters:
         - expression: The FilterExpression to insert.
     - Returns: Self
     */
    @discardableResult
    public func andX(_ expression : FilterExpression) -> Self {
        expression.parent = self

        self.entries.append(FilterExpressionEntry(parent: self, type: SearchType.FilterSearchAnd, expression: expression))

        return self
    }

    /**
     Nest a FilterExpression as an OR caluse.

     - Parameters:
        - expression: The FilterExpression to insert.
     - Returns: Self
     */
    @discardableResult
    public func orX(_ expression : FilterExpression) -> Self {
        expression.parent = self

        self.entries.append(FilterExpressionEntry(
            parent: expression,
            type: SearchType.FilterSearchOr,
            expression: expression
        ))

        return self
    }

    /**
     Add a equal (x EQ y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func equal<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.EQ, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a equal (AND x EQ y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andEqual<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.EQ, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a equal (OR x EQ y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orEqual<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.EQ, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a not equal (x NE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func notEqual<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NE, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a not equal (AND x NE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andNotEqual<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NE, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a not equal (OR x NE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orNotEqual<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NE, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a greater than (x GT y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func greaterThan<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.GT, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a greater than (AND x GT y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andGreaterThan<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.GT, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a greater than (OR x GT y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orGreaterThan<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.GT, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a greater than or equal (x GE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func greaterThanEqual<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.GE, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a greater than or equal (AND x GE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andGreaterThanEqual<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.GE, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a greater than or equal (OR x GE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orGreaterThanEqual<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.GE, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a less than (x LT y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func lessThan<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LT, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a less than (AND x LT y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andLessThan<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LT, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a less than (OR x LT y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orLessThan<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LT, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a less than or equal (x LE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func lessThanEqual<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LE, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a less than or equal (AND x LE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andLessThanEqual<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LE, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a less than or equal (OR x LE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterNumericValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orLessThanEqual<T:FilterNumericValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LE, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a contains (x CO y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func contains<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.CO, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a contains (AND x CO y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andContains<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.CO, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a contains (OR x CO y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orContains<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.CO, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a does not contains (x NC y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func doesNotContain<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NC, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a does not contains (AND x NC y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andDoesNotContain<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NC, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a does not contains (OR x NC y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    public func orDoesNotContain<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NC, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a like (x LIKE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func like<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LIKE, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a like (AND x LIKE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andLike<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LIKE, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a like (OR x LIKE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orLike<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.LIKE, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a not like (x NOTLIKE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func notLike<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NOTLIKE, value : value, type : SearchType.FilterSearch)
    }

    /**
     Add a not like (AND x NOTLIKE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func andNotLike<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NOTLIKE, value : value, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a not like (OR x NOTLIKE y) filter for specified field.

     - Parameters:
         - field: String
         - value: FilterValue compatible type.
     - Returns: Self
     */
    @discardableResult
    public func orNotLike<T:FilterValue>(_ field: String, _ value: T) -> Self {
        return self.add(field : field, op : SearchOperator.NOTLIKE, value : value, type : SearchType.FilterSearchOr)
    }

    /**
     Add a true (x == true) filter for specified field.

     - Parameters:
         - field: String
     - Returns: Self
     */
    @discardableResult
    public func isTrue(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.TRUE, value : Optional<String>.none, type : SearchType.FilterSearch)
    }

    /**
     Add a true (AND x == true) filter for specified field.

     - Parameters:
        - field: String
     - Returns: Self
     */
    @discardableResult
    public func andIsTrue(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.TRUE, value: Optional<String>.none, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a true (OR x == true) filter for specified field.

     - Parameters:
        - field: String
     - Returns: Self
     */
    @discardableResult
    public func orIsTrue(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.TRUE, value : Optional<String>.none, type : SearchType.FilterSearchOr)
    }

    /**
     Add a false (x == false) filter for specified field.

     - Parameters:
        - field: String
     - Returns: Self
     */
    @discardableResult
    public func isFalse(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.FALSE, value : Optional<String>.none, type : SearchType.FilterSearch)
    }

    /**
     Add a false (AND x == false) filter for specified field.

     - Parameters:
        - field: String
     - Returns: Self
     */
    @discardableResult
    public func andIsFalse(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.FALSE, value : Optional<String>.none, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a false (OR x == false) filter for specified field.

     - Parameters:
        - field: String
     - Returns: Self
     */
    @discardableResult
    public func orIsFalse(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.FALSE, value : Optional<String>.none, type : SearchType.FilterSearchOr)
    }

    /**
     Add a is null (x == null) filter for specified field.

     - Parameters:
        - field: String
     - Returns: Self
     */
    @discardableResult
    public func null(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.NULL, value : Optional<String>.none, type : SearchType.FilterSearch)
    }

    /**
     * Add a is null (AND x == null) filter for specified field.

     - Parameters:
        - field: String
     - Returns: Self
     */
    @discardableResult
    public func andNull(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.NULL, value : Optional<String>.none, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a is null (OR x == null) filter for specified field.

     - Parameters:
        - field: String
     - Returns: Self
     */
    @discardableResult
    public func orNull(_ field: String) -> Self {
        return self.add(field : field, op : SearchOperator.NULL, value : Optional<String>.none, type : SearchType.FilterSearchOr)
    }

    /**
     Add a in (x IN y,z,.. ) filter for specified field.

     - Parameters:
         - field: String
         - values: [FilterValue] Array of compatible types.
     - Returns: Self
     */
    @discardableResult
    public func isIn<T:FilterValue>(_ field: String, _ values: [T]) -> Self {
        return self.add(field : field, op : SearchOperator.IN, values : values, type : SearchType.FilterSearch)
    }

    /**
     Add a in (AND x IN y,z,.. ) filter for specified field.

     - Parameters:
         - field: String
         - values: [FilterValue] Array of compatible types.
     - Returns: Self
     */
    @discardableResult
    public func andIsIn<T:FilterValue>(_ field: String, _ values: [T]) -> Self {
        return self.add(field : field, op : SearchOperator.IN, values : values, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a in (OR x IN y,z,.. ) filter for specified field.

     - Parameters:
         - field: String
         - values: [FilterValue] Array of compatible types.
     - Returns: Self
     */
    public func orIsIn<T:FilterValue>(_ field: String, _ values: [T]) -> Self {
        return self.add(field : field, op : SearchOperator.IN, values : values, type : SearchType.FilterSearchOr)
    }

    /**
     Add a not in (x NOTIN y,z,.. ) filter for specified field.

     - Parameters:
         - field: String
         - values: [FilterValue] Array of compatible types.
     - Returns: Self
     */
    @discardableResult
    public func notIn<T:FilterValue>(_ field: String, values: [T]) -> Self {
        return self.add(field : field, op : SearchOperator.NOT_IN, values : values, type : SearchType.FilterSearch)
    }

    /**
     Add a not in (AND x NOTIN y,z,.. ) filter for specified field.

     - Parameters:
         - field: String
         - values: [FilterValue] Array of compatible types.
     - Returns: Self
     */
    @discardableResult
    public func andNotIn<T:FilterValue>(_ field: String, values: [T]) -> Self {
        return self.add(field : field, op : SearchOperator.NOT_IN, values : values, type : SearchType.FilterSearchAnd)
    }

    /**
     Add a not in (OR x NOTIN y,z,.. ) filter for specified field.

     - Parameters:
         - field: String
         - values: [FilterValue] Array of compatible types.
     - Returns: Self
     */
    @discardableResult
    public func orNotIn<T:FilterValue>(_ field: String, values: [T]) -> Self {
        return self.add(field : field, op : SearchOperator.NOT_IN, values : values, type : SearchType.FilterSearchOr)
    }
}
