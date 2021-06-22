Instance: Entcounter1
InstanceOf: USCoreEncounterProfile
Title: "Entcounter1"
Usage: #example
* identifier.value = "encounter1"
* identifier.system = "http://codi.nc.mitre.org/Encounter"
* status = #finished
* class = http://terminology.hl7.org/ValueSet/v3-ActEncounterCode#AMB "ambulatory"
* type.coding = http://hl7.org/fhir/us/core/ValueSet/us-core-encounter-type#11429006 "Consultation"
* subject = Reference(Patient/child1)
* period.start = "2020-01-01T12:00:00-05:00"
* period.end = "2020-01-01T13:00:00-05:00"
* participant.individual.reference = "Practitioner/provider1"
* location.location.reference = "Location/location1"
* diagnosis.use.coding = http://terminology.hl7.org/CodeSystem/diagnosis-role#CC "Chief Complaint"
* diagnosis.condition = Reference(Condition/Diagnosis1)