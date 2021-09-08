Instance: LabResultCM
InstanceOf: USCoreLaboratoryResultObservationProfile
Title: "LabResultCM"
Usage: #example
* identifier.value = "labResultCM1"
* status = #final
* subject = Reference(Demographic1)
* encounter = Reference(Encounter1)
* code.coding = http://loinc.org#10411-7 "Plasma given [Volume]"
* valueQuantity.value = 20
* valueQuantity.unit = "mL"
* partOf = Reference(Procedures1)
* issued = "2020-04-15T13:15:51-05:00"