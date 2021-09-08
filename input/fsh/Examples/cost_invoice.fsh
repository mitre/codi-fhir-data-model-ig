Instance: Invoice1
InstanceOf: Invoice
Title: "Invoice"
Usage: #example
* identifier.value = "invoice1"
* subject = Reference(Demographic1)
* status = #balanced
* date = "2020-04-15"
* lineItem.chargeItemReference = Reference(ChargeItem1)
* lineItem.priceComponent.amount.value = 83.25
* lineItem.priceComponent.amount.currency = #USD
* lineItem.priceComponent.type = #base