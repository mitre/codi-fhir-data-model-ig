Profile: CODIAlertProfile
Parent: Communication
Description: "Representation of an alert in the CODI data model."
* payload.content[x] only string
* payload ^slicing.discriminator.path = "payload.alertPayloadType"
* payload ^slicing.discriminator.type = #value
* payload ^slicing.rules = #closed
* payload ^slicing.description = "Slice for alert payloads"
* payload contains alertPurpose 1..1 and alertTrigger 1..1 and alertForm 1..1
* payload[alertPurpose].extension contains alertPayloadType named type 1..1
* payload[alertTrigger].extension contains alertPayloadType named type 1..1
* payload[alertForm].extension contains alertPayloadType named type 1..1
* payload[alertPurpose].extension[type].valueCode = #purpose
* payload[alertTrigger].extension[type].valueCode = #trigger
* payload[alertForm].extension[type].valueCode = #form
* status = #completed