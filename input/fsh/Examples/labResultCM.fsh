Instance: LabResultCM
InstanceOf: USCoreLaboratoryResultObservationProfile
Title: "LabResultCM"
Usage: #example
* identifier.value = "labResultCM1"
* status = #final
* subject = Reference(Patinet/child1)
* encounter = Reference(Encounter/encounter1)
//* specimen = Reference(Specimen/specimen1)
* code.coding = http://loinc.org#10411-7 "Plasma given [Volume]"
* performer = Reference(Organization/organization1)
* partOf = Reference(Procedure/procedures1)
//* basedOn = Reference(ServiceRequest/serviceRequest1)
* issued = "2020-04-15T13:15:51-05:00"
//* value[x]






//* category[Laboratory].coding = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
