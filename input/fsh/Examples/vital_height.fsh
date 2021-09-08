Instance: VitalHeight
InstanceOf: USCoreBodyHeightProfile
Title: "VitalHeight"
Usage: #example
* identifier.value = "vitalHeight"
* status = #final
* code.coding = http://loinc.org#8302-2 "Body height"
* valueQuantity.value = 48
* valueQuantity.unit = "in"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #[in_i]
* subject = Reference(Demographic1)
* effectiveDateTime = "2020-01-01T13:00:00-05:00"