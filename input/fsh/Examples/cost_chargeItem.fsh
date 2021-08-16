Instance: ChargeItem1
InstanceOf: ChargeItem
Title: "ChargeItem1"
Usage: #example
* identifier.value = "chargeItem1"
* status = #billed
* subject = Reference(Patient/child1)
* code.coding = #OMOPCostCode
* supportingInformation = Reference(Encounter/encounter1)
* context = Reference(Encounter/encounter1)
* service = Reference(Observation/labResultCM1)
* service = Reference(Procedure/procedures1)
* service = Reference(Procedure/session1)
* occurrenceDateTime = "2020-04-13"