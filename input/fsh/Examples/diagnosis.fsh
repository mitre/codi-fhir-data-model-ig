Instance: Diagnosis1
InstanceOf: CODIDiagnosisProfile
Title: "Diagnosis1"
Usage: #example
* category = http://hl7.org/fhir/us/core/CodeSystem/condition-category#health-concern
* code = http://snomed.info/sct#161954000 "Hiccough present"
* subject = Reference(Demographic1)
* encounter = Reference(Encounter1)
* extension[diagnosisOrigin].valueCodeableConcept = #test