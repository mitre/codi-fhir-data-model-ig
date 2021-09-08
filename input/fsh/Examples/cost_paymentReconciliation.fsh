Instance: PaymentReconciliation1
InstanceOf: PaymentReconciliation
Title: "PaymentReconciliation1"
Usage: #example
* identifier.value = "paymentReconciliation1"
* status = #active
* created = "2020-04-15"
* paymentDate = "2020-04-15"
* paymentAmount.value = 83.25
* paymentAmount.currency = #USD
* detail.request = Reference(Invoice1)
* detail.type = #payment