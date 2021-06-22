Profile: CODIDemographicProfile
Parent: USCorePatientProfile
Description: "Representation of a patient in the CODI data model. Defined via CDMH."
* identifier ^slicing.discriminator.path = "identifier.type"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice for insurance identifier"
* identifier contains
	InsuranceID 0..1 and
	HashIdentity 0..*
* identifier[InsuranceID].type = http://hl7.org/fhir/ValueSet/identifier-type#NIIP
* identifier[HashIdentity].type = http://hl7.org/fhir/ValueSet/identifier-type#CODI_Hash

* telecom ^slicing.discriminator.path = "telecom.system"
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.rules = #open
* telecom ^slicing.description = "Slice for telecom"
* telecom contains
	HouseholdPhone 0..1 and
	HouseholdEmail 0..1
* telecom[HouseholdPhone].system = http://hl7.org/fhir/ValueSet/contact-point-system#phone
* telecom[HouseholdEmail].system = http://hl7.org/fhir/ValueSet/contact-point-system#email

//* extension contains 
//	clearTextIdentifier named clearTextIdentifier 1..* and
//	hashedIdentifier named hashedIdentifier 1..*
//	assetDelivery named assetDelivery 0..*
//	censusLocation named x 0..*
//	cost
//	diagnosis
//	encounter
//	familyHistory
//	labResult
//	prescribing
//	procedure
//	session
//	referral
//	vital
//	link