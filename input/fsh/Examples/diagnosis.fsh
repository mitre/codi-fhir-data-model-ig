Instance: Diagnosis1
InstanceOf: CODIDiagnosisProfile
Title: "Diagnosis1"
Usage: #example
* category = #health-concern
* code = http://snomed.info/sct#161954000 "Hiccough present"
* subject = Reference(Patient/Child1)
* encounter = Reference(Encounter/Encounter1)
* extension[diagnosisOrigin].valueCodeableConcept = #test