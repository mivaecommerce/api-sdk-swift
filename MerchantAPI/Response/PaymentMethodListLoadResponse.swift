/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: PaymentMethodListLoadResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for PaymentMethodList_Load.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/paymentmethodlist_load
 */
public class PaymentMethodListLoadResponse : Response {

    /// Holds array of PaymentMethod returned by the response
    public var data : [PaymentMethod] = []

    /// Named computed property for data
    public var paymentMethods : [PaymentMethod] {
        get {
            return self.data
        }
    }

    /**
     Getter for paymentMethods.

     - Returns: [PaymentMethod]
     */
    public func getPaymentMethods() -> [PaymentMethod] {
        return self.paymentMethods
    }
    
    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.data = try container.decodeIfPresent([PaymentMethod].self, forKey: .data) ?? []
        try super.init(from : decoder)
    }
}