Instance: Demographic1
InstanceOf: CODIDemographicProfile
Title: "Demographic1"
Usage: #example
//* name.extension[data-absent-reason].valueCode = #masked
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
* identifier[CODIId].value = "child1"