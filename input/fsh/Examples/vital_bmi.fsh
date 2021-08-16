Instance: VitalBMI
InstanceOf: USCoreBMIProfileProfile
Title: "VitalBMI"
Usage: #example
* identifier.value = "vitalBMI"
* status = #final
* code.coding = http://loinc.org#39156-5 "BMI"
* valueQuantity.value = 18
* valueQuantity.unit = "kg/m2"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #kg/m2
* subject = Reference(Patient/child1)
* encounter = Reference(Encounter/encounter1)
* effectiveDateTime = "2020-01-01T13:00:00-05:00"