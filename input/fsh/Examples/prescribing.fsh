Instance: Prescribing1
InstanceOf: CODIPrescribingProfile
Title: "Prescribing1"
Usage: #example
* identifier.value = "prescribing1"
* status = #completed
* intent = #order
* medicationCodeableConcept.coding = http://www.nlm.nih.gov/research/umls/rxnorm#91318 "Coal Tar Topical Solution"
* subject = Reference(Patient/child1)
* authoredOn = "2020-01-01T12:14:00-05:00"
* requester = Reference(Pratitioner/provider1)
* extension[prescribingRxSource].valueCodeableConcept = http://teminology.hl7.org/CodeSystem/CODI-rx-origin-type#OD "Order"

// CDM data element rx_source is missing from CDMH. Mapped to extension prescribingRxSource.
//Nothing special for CODI, just use the CDMH mapping.