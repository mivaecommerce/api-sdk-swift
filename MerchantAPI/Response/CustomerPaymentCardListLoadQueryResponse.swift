/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * $Id: CustomerPaymentCardListLoadQueryResponse.swift 73952 2019-03-07 22:36:32Z gidriss $
 */

import Foundation

/**
 API Response for CustomerPaymentCardList_Load_Query.
 
 - SeeAlso: https://docs.miva.com/json-api/functions/customerpaymentcardlist_load_query
 */
public class CustomerPaymentCardListLoadQueryResponse : ListQueryResponse {

    /// Holds a ListQuery result data
    public var data : ListQueryResult<CustomerPaymentCard>

    /// Named computed property for data
    public var customerPaymentCards : [CustomerPaymentCard] {
        get {
            return self.data.records
        }
    }

    /**
     Getter for customerPaymentCards.

     - Returns: [CustomerPaymentCard]
     */
    public func getCustomerPaymentCards() -> [CustomerPaymentCard] {
        return self.customerPaymentCards
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

        self.data = try container.decodeIfPresent(ListQueryResult<CustomerPaymentCard>.self, forKey: .data) ?? ListQueryResult<CustomerPaymentCard>()
        try super.init(from : decoder)
    }
}