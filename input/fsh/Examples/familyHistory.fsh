Instance: FamilyHistory
InstanceOf: FamilyMemberHistory
Title: "FamilyHistory1"
Usage: #example
* identifier.value = "familyHistory1"
* status = #completed
* patient = Reference(Patient/child1)
* condition.code = http://snomed.info/sct#651003 "Root work"
* relationship.coding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "mother"
* date = "2020-02-01"