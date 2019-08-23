/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id$
 */

import Foundation

/**
 API Response for CustomerPaymentCard_Register.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/customerpaymentcard_register
 */
public class CustomerPaymentCardRegisterResponse : Response {

    /// The response model
    public var customerPaymentCard : Optional<CustomerPaymentCard>
    
    /**
     Getter for customerPaymentCard.

     - Returns: CustomerPaymentCard
     */
    public func getCustomerPaymentCard() -> Optional<CustomerPaymentCard> {
        return self.customerPaymentCard
    }
    
    /**
     CodingKeys used to map the model when decoding.
     
     - SeeAlso: Decodable
     */
    private enum CodingKeys: String, CodingKey {
        case customerPaymentCard = "data"
    }
    
    /**
     Construct an instance from a decoder instance.

     - Throws: Error when unable to decode.
     - SeeAlso: Decodable
     */
    public required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy : CodingKeys.self)

        self.customerPaymentCard = try container.decodeIfPresent(CustomerPaymentCard.self, forKey: .customerPaymentCard)
        try super.init(from : decoder)
    }
}