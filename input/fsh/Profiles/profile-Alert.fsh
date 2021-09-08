Profile: CODIAlertProfile
Parent: Communication
Description: "Representation of an alert in the CODI data model."
* payload ^slicing.discriminator.type = #pattern
* payload ^slicing.discriminator.path = "extension('http://hl7.org/fhir/us/codi/StructureDefinition/alertPayloadType').valueCode"
* payload ^slicing.rules = #closed
* payload ^slicing.description = "Slice for alert payloads"
* payload contains alertPurpose 1..1 and alertTrigger 1..1 and alertForm 1..1
* payload[alertPurpose].extension contains alertPayloadType named alertPayloadType 1..1
* payload[alertPurpose].extension[alertPayloadType].valueCode 1..1
* payload[alertPurpose].extension[alertPayloadType].valueCode = #purpose
* payload[alertPurpose].content[x] only string
* payload[alertTrigger].extension contains alertPayloadType named alertPayloadType 1..1
* payload[alertTrigger].extension[alertPayloadType].valueCode 1..1
* payload[alertTrigger].extension[alertPayloadType].valueCode = #trigger
* payload[alertTrigger].content[x] only string
* payload[alertForm].extension contains alertPayloadType named alertPayloadType 1..1
* payload[alertForm].extension[alertPayloadType].valueCode 1..1
* payload[alertForm].extension[alertPayloadType].valueCode = #form
* payload[alertForm].content[x] only string
* status = #completed