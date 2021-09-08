Instance: Alert1
InstanceOf: CODIAlertProfile
Title: "Alert1"
Usage: #example
* identifier.value = "alert1"
* payload[alertPurpose].contentString = "Alert purpose contentString"
* payload[alertPurpose].extension[alertPayloadType].valueCode = #purpose
* payload[alertTrigger].contentString = "Alert trigger contentString"
* payload[alertTrigger].extension[alertPayloadType].valueCode = #trigger
* payload[alertForm].contentString = "Alert form contentString"
* payload[alertForm].extension[alertPayloadType].valueCode = #form