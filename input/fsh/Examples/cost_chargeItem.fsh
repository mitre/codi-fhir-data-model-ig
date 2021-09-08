Instance: ChargeItem1
InstanceOf: ChargeItem
Title: "ChargeItem1"
Usage: #example
* identifier.value = "chargeItem1"
* status = #billed
* subject = Reference(Demographic1)
* code.coding = #OMOPCostCode
* supportingInformation = Reference(Encounter1)
* context = Reference(Encounter1)
* service = Reference(LabResultCM1)
* service = Reference(Procedures1)
* service = Reference(Session1)
* occurrenceDateTime = "2020-04-13"