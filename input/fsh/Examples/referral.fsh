Instance: Referral1
InstanceOf: CODIReferralProfile
Title: "Referral1"
Usage: #example
* identifier.value = "referral1"
* subject = Reference(Demographic1)
* encounter = Reference(Encounter1)
* authoredOn = "2020-02-10T13:30:00-05:00"
* requester = Reference(Provider1)
* extension[referralDirection].valueCoding = http://teminology.hl7.org/CodeSystem/CODI-direction-type#I "Incoming"
* extension[referralPriorAuth].valueBoolean = false
* extension[referralDispositionStatus].valueCodeableConcept.coding = http://teminology.hl7.org/CodeSystem/CODI-referral-status-type#A "Approved"
* status = #completed
* intent = #order