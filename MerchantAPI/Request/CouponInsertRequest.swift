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
 Handles API Request Coupon_Insert.

 - SeeAlso: https://docs.miva.com/json-api/functions/coupon_insert
 */
public class CouponInsertRequest : Request {
    /**
     The API function name.

     - Note: Overrides
     - Returns: String
     */
    override var function : String {
        return "Coupon_Insert"
    }

    /**
     The request scope.

     - Note: Overrides
     - Returns: RequestScope
     */
    override var scope : RequestScope {
        return RequestScope.Store;
    }

    /// Request field Code.
    var code : Optional<String> = nil

    /// Request field Description.
    var description : Optional<String> = nil

    /// Request field CustomerScope.
    var customerScope : Optional<String> = nil

    /// Request field DateTime_Start.
    var dateTimeStart : Optional<Date> = nil

    /// Request field DateTime_End.
    var dateTimeEnd : Optional<Date> = nil

    /// Request field Max_Use.
    var maxUse : Optional<Int> = nil

    /// Request field Max_Per.
    var maxPer : Optional<Int> = nil

    /// Request field Active.
    var active : Optional<Bool> = nil

    /// Request field PriceGroup_ID.
    var priceGroupId : Optional<Int> = nil

    /**
     CodingKeys used to map the request when encoding.

     - SeeAlso: Encodable
     */
    private enum CodingKeys: String, CodingKey {
        case function = "Function"
        case code = "Code"
        case description = "Description"
        case customerScope = "CustomerScope"
        case dateTimeStart = "DateTime_Start"
        case dateTimeEnd = "DateTime_End"
        case maxUse = "Max_Use"
        case maxPer = "Max_Per"
        case active = "Active"
        case priceGroupId = "PriceGroup_ID"
    }

    /**
     Request constructor.

     - Parameters:
        - client: A BaseClient instance.
        - coupon: An optional Coupon instance.
     */
    public init(client: Optional<BaseClient> = nil, coupon: Optional<Coupon> = nil) {
        super.init(client: client)
        if let coupon = coupon {
            self.code = coupon.code
            self.description = coupon.description
            self.customerScope = coupon.customerScope
            self.dateTimeStart = coupon.dateTimeStart
            self.dateTimeEnd = coupon.dateTimeEnd
            self.maxUse = coupon.maxUse
            self.maxPer = coupon.maxPer
            self.active = coupon.active
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

        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.customerScope, forKey: .customerScope)
        if let dateTimeStart = self.dateTimeStart {
            try container.encodeIfPresent(Int64(dateTimeStart.timeIntervalSince1970), forKey: .dateTimeStart)
        }
        if let dateTimeEnd = self.dateTimeEnd {
            try container.encodeIfPresent(Int64(dateTimeEnd.timeIntervalSince1970), forKey: .dateTimeEnd)
        }
        try container.encodeIfPresent(self.maxUse, forKey: .maxUse)
        try container.encodeIfPresent(self.maxPer, forKey: .maxPer)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(self.priceGroupId, forKey: .priceGroupId)

        try super.encode(to : encoder)
    }

    /**
     Send the request for a response.

     - Parameters:
        - callback: The callback function with signature (CouponInsertResponse?, Error?).
     - Note: Overrides
     */

     public override func send(client: Optional<BaseClient> = nil, callback: @escaping (CouponInsertResponse?, Error?) -> ()) throws {
        if let client = client ?? self.client {
            client.send(self) { request, response, error in
                callback(response as? CouponInsertResponse, error)
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
    public override func createResponse(httpResponse: URLResponse, data : Data) throws -> CouponInsertResponse {
        let decoder = JSONDecoder()

        decoder.userInfo[Response.decoderRequestUserInfoKey]            = self
        decoder.userInfo[Response.decoderHttpResponseDataUserInfoKey]   = httpResponse
        decoder.userInfo[Response.decoderResponseDataUserInfoKey]       = data

        return try decoder.decode(CouponInsertResponse.self, from: data)
    }

    /**
     Get the Type of the Response this Request expects. Used in decoding MultiCall.

     - Returns: Response.Type
     - Note: Overrides
     */
    override public func getResponseType() -> Response.Type {
        return CouponInsertResponse.self
    }

    /**
     Getter for Code.

     - Returns:  Optional<String>
     */
    public func getCode() -> Optional<String> {
        return self.code
    }

    /**
     Getter for Description.

     - Returns:  Optional<String>
     */
    public func getDescription() -> Optional<String> {
        return self.description
    }

    /**
     Getter for CustomerScope.

     - Returns:  Optional<String>
     */
    public func getCustomerScope() -> Optional<String> {
        return self.customerScope
    }

    /**
     Enum Getter for CustomerScope.

     - Returns:  Optional<Coupon.CustomerScope>
     */
    public func getCustomerScope() -> Optional<Coupon.CustomerScope> {
        if let v = self.customerScope {
            return Coupon.CustomerScope(rawValue: v) ?? nil
        }
        return nil;
    }

    /**
     Getter for DateTime_Start.

     - Returns:  Optional<Date>
     */
    public func getDateTimeStart() -> Optional<Date> {
        return self.dateTimeStart
    }

    /**
     Getter for DateTime_End.

     - Returns:  Optional<Date>
     */
    public func getDateTimeEnd() -> Optional<Date> {
        return self.dateTimeEnd
    }

    /**
     Getter for Max_Use.

     - Returns:  Optional<Int>
     */
    public func getMaxUse() -> Optional<Int> {
        return self.maxUse
    }

    /**
     Getter for Max_Per.

     - Returns:  Optional<Int>
     */
    public func getMaxPer() -> Optional<Int> {
        return self.maxPer
    }

    /**
     Getter for Active.

     - Returns:  Optional<Bool>
     */
    public func getActive() -> Optional<Bool> {
        return self.active
    }

    /**
     Getter for PriceGroup_ID.

     - Returns:  Optional<Int>
     */
    public func getPriceGroupId() -> Optional<Int> {
        return self.priceGroupId
    }

    /**
     Setter for Code.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCode(_ value: Optional<String>) -> Self {
        self.code = value
        return self
    }

    /**
     Setter for Description.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setDescription(_ value: Optional<String>) -> Self {
        self.description = value
        return self
    }

    /**
     Setter for CustomerScope.

     - Parameters:
        - value: Optional<String>
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerScope(_ value: Optional<String>) -> Self {
        self.customerScope = value
        return self
    }

    /**
     Enum Setter for CustomerScope.

     - Parameters:
        - value: Coupon.CustomerScope
     - Returns:  Self
     */
    @discardableResult
    public func setCustomerScope(_ value: Coupon.CustomerScope) -> Self {
        self.customerScope = value.rawValue
        return self
    }

    /**
     Setter for DateTime_Start.

     - Parameters:
        - value: Optional<Date>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeStart(_ value: Optional<Date>) -> Self {
        self.dateTimeStart = value
        return self
    }

    /**
     Setter for DateTime_End.

     - Parameters:
        - value: Optional<Date>
     - Returns:  Self
     */
    @discardableResult
    public func setDateTimeEnd(_ value: Optional<Date>) -> Self {
        self.dateTimeEnd = value
        return self
    }

    /**
     Setter for Max_Use.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setMaxUse(_ value: Optional<Int>) -> Self {
        self.maxUse = value
        return self
    }

    /**
     Setter for Max_Per.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setMaxPer(_ value: Optional<Int>) -> Self {
        self.maxPer = value
        return self
    }

    /**
     Setter for Active.

     - Parameters:
        - value: Optional<Bool>
     - Returns:  Self
     */
    @discardableResult
    public func setActive(_ value: Optional<Bool>) -> Self {
        self.active = value
        return self
    }

    /**
     Setter for PriceGroup_ID.

     - Parameters:
        - value: Optional<Int>
     - Returns:  Self
     */
    @discardableResult
    public func setPriceGroupId(_ value: Optional<Int>) -> Self {
        self.priceGroupId = value
        return self
    }
}
