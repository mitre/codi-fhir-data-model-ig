Instance: VitalBP
InstanceOf: USCoreBloodPressureProfile
Title: "VitalBP"
Usage: #example
* identifier.value = "vitalBP"
* status = #final
* code.coding = http://loinc.org#85354-9 "Blood pressure panel with all children optional"
* component[systolic].code.coding = http://loinc.org#8480-6 "BP sys"
* component[systolic].valueQuantity.value = 100
* component[systolic].valueQuantity.unit = "mmHg"
* component[systolic].valueQuantity.system = "http://unitsofmeasure.org"
* component[systolic].valueQuantity.code = #mm[Hg]
* component[diastolic].code.coding = http://loinc.org#8462-4 "BP dias"
* component[diastolic].valueQuantity.value = 70
* component[diastolic].valueQuantity.unit = "mmHg"
* component[diastolic].valueQuantity.system = "http://unitsofmeasure.org"
* component[diastolic].valueQuantity.code = #mm[Hg]
* subject = Reference(Demographic1)
* effectiveDateTime = "2020-01-01T13:00:00-05:00"