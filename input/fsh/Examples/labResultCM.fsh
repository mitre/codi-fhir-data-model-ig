Instance: LabResultCM
InstanceOf: USCoreLaboratoryResultObservationProfile
Title: "LabResultCM"
Usage: #example
* identifier.value = "labResultCM1"
* subject = Reference(Patinet/child1)
* encounter = Reference(Encounter/encounter1)
* performer = Reference(Organization/program1)
* status = #final
//* category[Laboratory].coding = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding = http://loinc.org#10411-7 "Plasma given [Volume]"


//Nothing special for CODI, just use the CDMH mapping.
//The proposed extension in CDMH is on a data element that is not used in CODI.
