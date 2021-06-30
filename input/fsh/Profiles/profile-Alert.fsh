Profile: CODIAlertProfile
Parent: Communication
Description: "Representation of an alert in the CODI data model."
* payload ^slicing.discriminator.path = "payload.alertPayloadType"
* payload ^slicing.discriminator.type = #value
* payload ^slicing.rules = #closed
* payload ^slicing.description = "Slice for alert payloads"
* payload contains alertPurpose 1..1 and alertTrigger 1..1 and alertForm 1..1
* payload[alertPurpose].extension contains alertPayloadType named type 1..1
* payload[alertPurpose].extension[type].valueCode = #purpose
* payload[alertPurpose].content[x] only string
* payload[alertTrigger].extension contains alertPayloadType named type 1..1
* payload[alertTrigger].extension[type].valueCode = #trigger
* payload[alertTrigger].content[x] only string
* payload[alertForm].extension contains alertPayloadType named type 1..1
* payload[alertForm].extension[type].valueCode = #form
* payload[alertForm].content[x] only string
* status = #completed