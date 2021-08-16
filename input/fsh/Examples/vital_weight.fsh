Instance: VitalWeight
InstanceOf: USCoreBodyWeightProfile
Title: "VitalWeight"
Usage: #example
* identifier.value = "vitalWeight"
* status = #final
* code.coding = http://loinc.org#29463-7 "Body Weight"
* valueQuantity.value = 100
* valueQuantity.unit = "lb"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #[lb_av]
* subject = Reference(Patient/child1)
* effectiveDateTime = "2020-01-01T13:00:00-05:00"