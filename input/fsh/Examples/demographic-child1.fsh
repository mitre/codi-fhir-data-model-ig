Instance: Child1
InstanceOf: CODIDemographicProfile
Title: "Child1"
Usage: #example
* name[0].given = "NiCholas"
* name[0].family = "CODI"
* name[0].use = #official
* name[1].family = "Denver"
* name[1].use = #maiden
* gender = #male
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[0].extension[0].url = "ombCategory"
* extension[0].extension[0].valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
* extension[0].extension[1].url = "text"
* extension[0].extension[1].valueString = "White"
* extension[1].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[1].extension[0].url = "ombCategory"
* extension[1].extension[0].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[1].extension[1].url = "text"
* extension[1].extension[1].valueString = "Not Hispanic or Latino"
* extension[2].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[2].valueCode = #M


//WHY DOES THE BASE IDENTIFIER NOT SHOW UP IN THE IG WHEN THE SLICES ARE PRESENT?
* identifier.system = "http://codi.nc.mitre.org/Demographic"
* identifier.value = "child1"
* identifier[InsuranceID].type.coding.system = "http://hl7.org/fhir/ValueSet/identifier-type"
* identifier[InsuranceID].type.coding.code = #NIIP
* identifier[InsuranceID].system = "http://www.acme.com/identifiers/patient"
* identifier[InsuranceID].value = "insurance_id"
* identifier[HashIdentity].type.coding.system = "http://hl7.org/fhir/ValueSet/identifier-type"
* identifier[HashIdentity].type.coding.code = #CODI_Hash
* identifier[HashIdentity].system = "http://www.acme.com/identifiers/patient"
* identifier[HashIdentity].value = "hash_identity"
