/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import Foundation

/// PaymentMethod data model.
public class PaymentMethod : Model {

    /// Model field module_id.
    var moduleId : Int

    /// Model field module_api.
    var moduleApi : Decimal

    /// Model field method_code.
    var methodCode : String

    /// Model field method_name.
    var methodName : String

    /// Model field mivapay.
    var mivapay : Bool

    /// Model field paymentcard
    var paymentCard : Optional<CustomerPaymentCard> = nil

    /// Model field orderpaymentcard
    var orderPaymentCard : Optional<OrderPaymentCard> = nil

    /// Model field paymentcardtype
    var paymentCardType : Optional<PaymentCardType> = nil

    /**
     CodingKeys used to map the model when encoding and decoding.

     - SeeAlso: Codable
     */
    private enum CodingKeys: String, CodingKey {
        case moduleId = "module_id"
        case moduleApi = "module_api"
        case methodCode = "method_code"
        case methodName = "method_name"
        case mivapay
        case paymentCard = "paymentcard"
        case orderPaymentCard = "orderpaymentcard"
        case paymentCardType = "paymentcardtype"
    }

    /**
     PaymentMethod Constructor.
     */
    public override init() {
        self.moduleId = 0
        self.moduleApi = Decimal(0.00)
        self.methodCode = ""
        self.methodName = ""
        self.mivapay = false
        self.paymentCard = CustomerPaymentCard()
        self.orderPaymentCard = OrderPaymentCard()
        self.paymentCardType = PaymentCardType()

        super.init()
    }

    /**
     PaymentMethod Decodable Constructor.

     - Parameters:
        - decoder: The Decoder instance.
     - Throws: error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)

        self.moduleId = try container.decodeIfPresent(Int.self, forKey: .moduleId) ?? 0
        self.moduleApi = try container.decodeIfPresent(Decimal.self, forKey: .moduleApi) ?? Decimal(0.00)
        self.methodCode = try container.decodeIfPresent(String.self, forKey: .methodCode) ?? ""
        self.methodName = try container.decodeIfPresent(String.self, forKey: .methodName) ?? ""
        self.mivapay = try container.decodeIfPresent(Bool.self, forKey: .mivapay) ?? false
        self.paymentCard = try container.decodeIfPresent(CustomerPaymentCard.self, forKey: .paymentCard) ?? nil
        self.orderPaymentCard = try container.decodeIfPresent(OrderPaymentCard.self, forKey: .orderPaymentCard) ?? nil
        self.paymentCardType = try container.decodeIfPresent(PaymentCardType.self, forKey: .paymentCardType) ?? nil

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

        try container.encodeIfPresent(self.moduleId, forKey: .moduleId)
        try container.encodeIfPresent(Decimal.roundForEncoding(value: self.moduleApi, precision: 2), forKey: .moduleApi)
        try container.encodeIfPresent(self.methodCode, forKey: .methodCode)
        try container.encodeIfPresent(self.methodName, forKey: .methodName)
        try container.encodeIfPresent(self.mivapay, forKey: .mivapay)
        try container.encodeIfPresent(self.paymentCard, forKey: .paymentCard)
        try container.encodeIfPresent(self.orderPaymentCard, forKey: .orderPaymentCard)
        try container.encodeIfPresent(self.paymentCardType, forKey: .paymentCardType)

        try super.encode(to: encoder)
    }

    /**
     Getter for module_id.

     - Returns:  Int

     */
    public func getModuleId() -> Int {
        return self.moduleId
    }

    /**
     Getter for module_api.

     - Returns:  Decimal     */
    public func getModuleApi() -> Decimal {
        return self.moduleApi
    }

    /**
     Getter for method_code.

     - Returns:  String

     */
    public func getMethodCode() -> String {
        return self.methodCode
    }

    /**
     Getter for method_name.

     - Returns:  String

     */
    public func getMethodName() -> String {
        return self.methodName
    }

    /**
     Getter for mivapay.

     - Returns:  Bool     */
    public func getMivapay() -> Bool {
        return self.mivapay
    }

    /**
     Getter for paymentcard.

     - Returns:  Optional<CustomerPaymentCard>
     */
    public func getPaymentCard() -> Optional<CustomerPaymentCard> {
        return self.paymentCard
    }

    /**
     Getter for orderpaymentcard.

     - Returns:  Optional<OrderPaymentCard>
     */
    public func getOrderPaymentCard() -> Optional<OrderPaymentCard> {
        return self.orderPaymentCard
    }

    /**
     Getter for paymentcardtype.

     - Returns:  Optional<PaymentCardType>
     */
    public func getPaymentCardType() -> Optional<PaymentCardType> {
        return self.paymentCardType
    }
}
