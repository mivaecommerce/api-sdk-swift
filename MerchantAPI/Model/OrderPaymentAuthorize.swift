/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// OrderPaymentAuthorize data model.
public class OrderPaymentAuthorize : Model {

    /// Model field valid.
    var valid : Bool

    /// Model field total_auth.
    var totalAuthorized : Decimal

    /// Model field formatted_total_auth.
    var formattedTotalAuthorized : String

    /// Model field total_capt.
    var totalCaptured : Decimal

    /// Model field formatted_total_capt.
    var formattedTotalCaptured : String

    /// Model field total_rfnd.
    var totalRefunded : Decimal

    /// Model field formatted_total_rfnd.
    var formattedTotalRefunded : String

    /// Model field net_capt.
    var netCaptured : Decimal

    /// Model field formatted_net_capt.
    var formattedNetCaptured : String

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case valid
        case totalAuthorized = "total_auth"
        case formattedTotalAuthorized = "formatted_total_auth"
        case totalCaptured = "total_capt"
        case formattedTotalCaptured = "formatted_total_capt"
        case totalRefunded = "total_rfnd"
        case formattedTotalRefunded = "formatted_total_rfnd"
        case netCaptured = "net_capt"
        case formattedNetCaptured = "formatted_net_capt"
    }

    /**
     OrderPaymentAuthorize Constructor.
     */
    public override init() {
        self.valid = false
        self.totalAuthorized = Decimal(0.00)
        self.formattedTotalAuthorized = ""
        self.totalCaptured = Decimal(0.00)
        self.formattedTotalCaptured = ""
        self.totalRefunded = Decimal(0.00)
        self.formattedTotalRefunded = ""
        self.netCaptured = Decimal(0.00)
        self.formattedNetCaptured = ""

        super.init()
    }

    /**
     OrderPaymentAuthorize Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.valid = try container.decodeIfPresent(Bool.self, forKey: .valid) ?? false
        self.totalAuthorized = try container.decodeIfPresent(Decimal.self, forKey: .totalAuthorized) ?? Decimal(0.00)
        self.formattedTotalAuthorized = try container.decodeIfPresent(String.self, forKey: .formattedTotalAuthorized) ?? ""
        self.totalCaptured = try container.decodeIfPresent(Decimal.self, forKey: .totalCaptured) ?? Decimal(0.00)
        self.formattedTotalCaptured = try container.decodeIfPresent(String.self, forKey: .formattedTotalCaptured) ?? ""
        self.totalRefunded = try container.decodeIfPresent(Decimal.self, forKey: .totalRefunded) ?? Decimal(0.00)
        self.formattedTotalRefunded = try container.decodeIfPresent(String.self, forKey: .formattedTotalRefunded) ?? ""
        self.netCaptured = try container.decodeIfPresent(Decimal.self, forKey: .netCaptured) ?? Decimal(0.00)
        self.formattedNetCaptured = try container.decodeIfPresent(String.self, forKey: .formattedNetCaptured) ?? ""

        try super.init(from : decoder)
    }

    /**
     Implementation of Encodable.

     - Parameters:
        - encoder: The Encoder instance.
     - Throws: error when unable to encode.
     - SeeAlso: Encodable
     */
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(self.valid, forKey: .valid)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.totalAuthorized, precision: 2), forKey: .totalAuthorized)
        try container.encodeIfPresent(self.formattedTotalAuthorized, forKey: .formattedTotalAuthorized)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.totalCaptured, precision: 2), forKey: .totalCaptured)
        try container.encodeIfPresent(self.formattedTotalCaptured, forKey: .formattedTotalCaptured)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.totalRefunded, precision: 2), forKey: .totalRefunded)
        try container.encodeIfPresent(self.formattedTotalRefunded, forKey: .formattedTotalRefunded)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.netCaptured, precision: 2), forKey: .netCaptured)
        try container.encodeIfPresent(self.formattedNetCaptured, forKey: .formattedNetCaptured)

        try super.encode(to: encoder)
    }

    /**
     Getter for valid.

     - Returns:  Bool     */
    public func getValid() -> Bool {
        return self.valid
    }

    /**
     Getter for total_auth.

     - Returns:  Decimal     */
    public func getTotalAuthorized() -> Decimal {
        return self.totalAuthorized
    }

    /**
     Getter for formatted_total_auth.

     - Returns:  String

     */
    public func getFormattedTotalAuthorized() -> String {
        return self.formattedTotalAuthorized
    }

    /**
     Getter for total_capt.

     - Returns:  Decimal     */
    public func getTotalCaptured() -> Decimal {
        return self.totalCaptured
    }

    /**
     Getter for formatted_total_capt.

     - Returns:  String

     */
    public func getFormattedTotalCaptured() -> String {
        return self.formattedTotalCaptured
    }

    /**
     Getter for total_rfnd.

     - Returns:  Decimal     */
    public func getTotalRefunded() -> Decimal {
        return self.totalRefunded
    }

    /**
     Getter for formatted_total_rfnd.

     - Returns:  String

     */
    public func getFormattedTotalRefunded() -> String {
        return self.formattedTotalRefunded
    }

    /**
     Getter for net_capt.

     - Returns:  Decimal     */
    public func getNetCaptured() -> Decimal {
        return self.netCaptured
    }

    /**
     Getter for formatted_net_capt.

     - Returns:  String

     */
    public func getFormattedNetCaptured() -> String {
        return self.formattedNetCaptured
    }
}
