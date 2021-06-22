Instance: AssetDelivery1
InstanceOf: ServiceRequest
Title: "AssetDelivery1"
Usage: #example
* identifier.value = "child1_asset_delivery"
* instantiatesCanonical = "http://codi.nc.mitre.org/Program/GotR_Triangle"
* status = #completed
* intent = #plan
* code.coding = http://teminology.hl7.org/CodeSystem/CODI-asset-delivery#fo "fo"
* subject = Reference(Patient/child1)
* quantityQuantity.value = 55.86
* quantityQuantity.system = "http://hl7.org/fhir/ValueSet/currencies"
* quantityQuantity.code = #USD
* occurrenceTiming.repeat.boundsPeriod.start = "2020-02-01"
* occurrenceTiming.repeat.boundsPeriod.end = "2020-06-15"
* occurrenceTiming.repeat.frequency = 1
* occurrenceTiming.repeat.period = 1
* occurrenceTiming.repeat.periodUnit = #wk