Instance: Encounter1
InstanceOf: CODIEncounterProfile
Title: "Encounter1"
Usage: #example
* identifier.value = "encounter1"
* identifier.system = "http://codi.nc.mitre.org/Encounter"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type.coding = http://snomed.info/sct#11429006 "Consultation"
* subject = Reference(Patient/child1)
* period.start = "2020-01-01T12:00:00-05:00"
* period.end = "2020-01-01T13:00:00-05:00"
* participant.individual = Reference(Practitioner/provider1)
* location.location = Reference(Location/location1)
* diagnosis.use.coding = http://terminology.hl7.org/CodeSystem/diagnosis-role#CC "Chief Complaint"
* diagnosis.condition = Reference(Condition/diagnosis1)