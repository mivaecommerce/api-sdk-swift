# Upgrade Guide from 2.1.0 to 2.2.0

Issue **MMAPI-62** added the inserted object into the response. ProductVariantInsertResponse has had its original response data moved and all calling code should be updated to reflect this change.

***Example usage from 2.1.x***

	response.getProductId();
	response.getVariantId();

***Should be updated to for 2.2.x***
	
	response.getProductVariant().getProductId()
	response.getProductVariant().getVariantId()

Issue **MMAPI-67** renamed some model getter functions and all calling code should be updated. Use the following list to rename all usage in your applications:

	CustomerSubscription.getAddressDescrip() 		-> CustomerSubscription.getAddressDescription()
	CustomerSubscription.getAddressAdress() 		-> CustomerSubscription.getAddressAddress()
	CustomerSubscription.getAddressAddress_1()		-> CustomerSubscription.getAddressAddress1()
	CustomerSubscription.getAddressAddress_2()		-> CustomerSubscription.getAddressAddress2()
	ProductAndSubscriptionTerm.getTermDescrip()		-> ProductAndSubscriptionTerm.getTermDescription()

# Upgrade Guide from 2.0.X - 2.1.0+

The class `TemplateVersionSettings` has been renamed to `VersionSettings`.

If you are utilizing this class within your code then you will need to be renamed in their type declarations. Usage has stayed the same.

# Upgrade Guide from 1.x to 2.x

## Swift 5.x

Swift 5.x is now required. You will need to update XCode to a version which includes it.

## Usage of OrderItemOption

Usage of OrderItemOption will need to be updated to support the change to the member `attribute` to `attribute_code`.

Replace all usage of `OrderItemOption` models that call either `getAttribute()` or `set_attribute(str)` with `getAttributeCode()` and `setAttributeCode(str)`.

**Example usage from 1.x:**

    let itemOption = OrderItemOption();
    itemOption.setAttribute("code");

**Should be updated for 2.x:**

    itemOption = merchantapi.model.OrderItemOption();
    itemOption.setAttributeCode('code');

**Example usage from 1.x:**

	var itemOption; // A OrderItemOption model loaded from an OrderListLoadQuery, for example
	itemOption.getAttribute();

**Should be updated for 2.x:**

	var itemOption; // A OrderItemOption model loaded from an OrderListLoadQuery, for example
	itemOption.getAttributeCode();

## Timestamp fields now represented as Date objects

 Previously, all timestamps were represented as integer values, they are now represented as Date objects.

The following Models and fields that are in use within your code will need to be updated to be used as a Date object:

| Model | Fields  |
|--|--|
| Customer | createdOn, lastLogin |
| Coupon | dateTimeStart, dateTimeEnd |
| Note | dateTimeStamp |
| Customer | dateTimeStamp, lastLogin |
| PriceGroup | dateTimeStart, dateTimeEnd |
| Product | dateTimeCreated, dateTimeUpdate |
| RelatedProduct | dateTimeCreated, dateTimeUpdated |
| Category | dateTimeCreated, dateTimeUpdated |
| Order | dateInStock |
| OrderItem | rmaDataTimeIssued, rmaDateTimeReceived, dateInStock |
| OrderPayment | dateTimeStamp |
| PrintQueueJob | dateTimeCreated |
	

The following Requests and fields that are in use within your code will need to be updated to be used as a Date object:

| Request | Fields  |
|--|--|
| CouponInsertRequest | dateTimeStart, dateTimeEnd |
| CouponUpdateRequest | dateTimeStart, dateTimeEnd |
| OrderItemListBackOrderRequest | dateInStock |
