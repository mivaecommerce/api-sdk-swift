/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import MerchantAPI

/* Initialize a client */
let client = Client(
  url : "https://www.mystore.com/mm5/json.mvc",
  apiToken : "MY_API_TOKEN",
  signingKey : "MY_SIGNING_KEY",
  signingType : MerchantAPI.ClientSignType.SHA256,
  requireTimestamps: true,
  defaultStoreCode : "STORE_CODE"
)

let productCode = "MySubscriptionProduct"
let productSubscriptionTerm = "MySubscriptionTermDescription"
let customerLogin = "CustomerLogin"

/* Load our subscribing customers addresses */
let addressRequest = MerchantAPI.CustomerAddressListLoadQueryRequest(client: client)

addressRequest.setCustomerLogin(customerLogin)

try! addressRequest.send() { addressResponse, error in
    guard let addressResponse = addressResponse, error == nil else {
        /// Handle Error
        return
    }

    if !addressResponse.isSuccess() {
        print(String(format: "Response Error: %@ - %@", addressResponse.getErrorCode(), addressResponse.getErrorMessage()))
        return
    }
    else if addressResponse.getCustomerAddresses().count == 0 {
        print("Addresses not found")
        return
    }
    
    let address = addressResponse.getCustomerAddresses().first!
    
    /*
     Register a payment card with CustmerPaymentCardRegisterRequest
     Or load an existing card with CustomerPaymentCardListLoadQueryRequest
     In this example we are going to register a payment card
    */
    
    let paymentCardRequest = MerchantAPI.CustomerPaymentCardRegisterRequest(client: client)
    
    paymentCardRequest.setCustomerLogin(customerLogin)
    paymentCardRequest.setFirstName(address.getFirstName())
    paymentCardRequest.setLastName(address.getLastName())
    paymentCardRequest.setCardType("Visa")
    paymentCardRequest.setCardNumber("4111111111111111")
    paymentCardRequest.setExpirationMonth(08)
    paymentCardRequest.setExpirationYear(2025)
    paymentCardRequest.setAddress1(address.getAddress1())
    paymentCardRequest.setAddress2(address.getAddress2())
    paymentCardRequest.setCity(address.getCity())
    paymentCardRequest.setState(address.getState())
    paymentCardRequest.setZip(address.getZip())
    paymentCardRequest.setCountry(address.getCountry())

    try! paymentCardRequest.send() { paymentCardResponse, error in
        guard let paymentCardResponse = paymentCardResponse, error == nil else {
            /// Handle Error
            return
        }

        if !paymentCardResponse.isSuccess() {
            print(String(format: "Response Error: %@ - %@", addressResponse.getErrorCode(), addressResponse.getErrorMessage()))
            return
        }
        
        let paymentCard = paymentCardResponse.getCustomerPaymentCard()!
        
        /* Find a valid shipping method */
        
        let methodRequest = MerchantAPI.SubscriptionShippingMethodListLoadQueryRequest(client: client)

        methodRequest.setProductCode(productCode)
        methodRequest.setCustomerLogin(customerLogin)
        methodRequest.setAddressId(address.getId())
        methodRequest.setPaymentCardId(paymentCard.getId())
        methodRequest.setQuantity(1)
        methodRequest.setProductSubscriptionTermDescription(productSubscriptionTerm)
        
        try! methodRequest.send() { methodResponse, error in
            guard let methodResponse = methodResponse, error == nil else {
                /// Handle Error
                return
            }

            if !methodResponse.isSuccess() {
                print(String(format: "Response Error: %@ - %@", methodResponse.getErrorCode(), methodResponse.getErrorMessage()))
                return
            }
            else if methodResponse.getSubscriptionShippingMethods().count == 0 {
                print("Shipping method not found")
                return
            }
            
            let method = methodResponse.getSubscriptionShippingMethods().first!
            
            /* Create the subscription */
            
            let request = MerchantAPI.SubscriptionInsertRequest(client: client)
            
            request.setProductCode(productCode)
            request.setProductSubscriptionTermDescription(productSubscriptionTerm)
            request.setCustomerLogin(customerLogin)
            request.setCustomerAddressId(address.getId())
            request.setPaymentCardId(paymentCard.getId())
            request.setQuantity(1)
            request.setShipId(method.getModule().getId())   // Supply the shipping module id
            request.setShipData("MyShippingMethodData")     // Supply any required shipping data for this method
            request.setNextDate(Date())                     // Set the next charge date, in this case we are using today

            // If you have attributes, you can specify them here

            let attr1 = SubscriptionAttribute()
            let attr2 = SubscriptionAttribute()

            attr1.setCode("attr1")
            attr1.setValue("attr1val")

            attr2.setCode("attr2")
            attr2.setValue("attr2val")

            request.addAttribute(attr1)
            request.addAttribute(attr2)
            
            try! request.send() { response, error in
                guard let response = response, error == nil else {
                    /// Handle Error
                    return
                }

                if !response.isSuccess() {
                    print(String(format: "Response Error: %@ - %@", methodResponse.getErrorCode(), methodResponse.getErrorMessage()))
                    return
                }
                
                let subscription = response.getSubscription()!
                
                print(String(format: "Created Subscription %d For Customer %@ Product %@ Term %@", subscription.getId(), customerLogin, productCode, productSubscriptionTerm))
            }
        }
    }
}
