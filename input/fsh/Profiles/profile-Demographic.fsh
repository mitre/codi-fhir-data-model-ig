Profile: CODIDemographicProfile
Parent: USCorePatientProfile
Description: "Representation of a demographic record in the CODI data model. Defined via CDMH."
* name 1..1
* name.extension contains data-absent-reason named data-absent-reason 1..1
* name.extension[data-absent-reason].valueCode = #masked
* name.id 0..0
* name.use 0..0
* name.text 0..0
* name.family 0..0
* name.given 0..0
* name.prefix 0..0
* name.suffix 0..0
* name.period 0..0
* identifier ^slicing.discriminator.path = "identifier.system"
* identifier ^slicing.discriminator.type = #value
//* identifier ^slicing.rules = #closed //I want to do this so that there cannot be more identifier slices, but this leads to a runtime error
* identifier ^slicing.description = "Slice for Link Identifiers"
* identifier contains CODIId 1..1 and LinkId 0..*
* identifier[CODIId].system = "http://codi.nc.mitre.org/Demographic_Identifier"
* identifier[CODIId].use = #usual
* identifier[LinkId].system = "http://codi.nc.mitre.org/Link_Identifier"
* identifier[LinkId].use = #secondary
* identifier[LinkId].extension contains demographicLinkIteration named demographicLinkIteration 1..1
* telecom 0..0
* address 0..0


//A CODI Demographic record cannot contain PII.
//Data element 'name' (first name, last name, nickname, middle initial) is #masked and set to 1..1
//Data element 'identifier' (SSN, insurance #/member ID) is sliced and allows only two types: A CODI Id is set to 1..1 and a Link Id is set to 0..1
//Data element 'address' is set to 0..0
//Data element 'telecom' (phone number, email address) is set to 0..0