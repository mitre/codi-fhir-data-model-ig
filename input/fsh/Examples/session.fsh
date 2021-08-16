Instance: Session1
InstanceOf: CODISessionProfile
Title: "Session1"
Usage: #example
* identifier.value = "session1"
* status = #completed
* subject = Reference(Patient/child1)
* encounter = Reference(Encounter/encounter1)
* performer.actor = Reference(Practitioner/provider1)
* instantiatesCanonical = "http://codi.nc.mitre.org/Program/GotR_Triangle"
* performedDateTime = "2020-01-01T12:00:00-05:00"
* category.coding = http://teminology.hl7.org/CodeSystem/CODI-mode-type#W "Web"
* reasonCode.coding = http://teminology.hl7.org/CodeSystem/CODI-session-description#Intervention_Activity "Intervention Activity"
* reasonCode.coding = http://teminology.hl7.org/CodeSystem/CODI-session-description#Screening "Screening"
* extension[sessionDose].valueDecimal = 1.0
* extension[sessionSessionAlert].extension[sessionAlert].valueReference = Reference(Communication/alert1)
* extension[sessionSessionAlert].extension[sessionAlertDateTime].valueDateTime = "2020-04-15T12:00:00-05:00"