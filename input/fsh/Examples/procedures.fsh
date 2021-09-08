Instance: Procedures1
InstanceOf: CODIProceduresProfile
Title: "Procedures1"
Usage: #example
* identifier.value = "procedures1"
* status = #completed
* subject = Reference(Demographic1)
* encounter = Reference(Encounter1)
* performedDateTime = "2020-03-10T12:00:00-05:00"
* code.coding = http://loinc.org#CODI_procedure "CODI_procedure"
* extension[proceduresPxSource].valueCodeableConcept = #OD