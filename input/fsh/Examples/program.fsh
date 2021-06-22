Instance: Program1
InstanceOf: PlanDefinition
Title: "Program1"
Usage: #example
* url = "http://codi.nc.mitre.org/Program/GotR_Triangle"
* identifier.value = "program1"
* title = "Girls on the Run of the Triangle"
* status = #active
* description = "GotR Triangle description"
* useContext.valueCodeableConcept.coding = http://teminology.hl7.org/CodeSystem/CODI-setting-type#CO "Community"
* useContext.code = http://hl7.org/fhir/ValueSet/usage-context-type#CODIProgram
* topic.coding = http://teminology.hl7.org/CodeSystem/CODI-aim-type#nutrition "Nutrition"
* action.title = "GotR Triangle Nutrition"
* action.description = "Girls on the Run of the Triangle Nutrition action"
* action.timingTiming.repeat.boundsPeriod.start = "2020-01-01"
* action.timingTiming.repeat.boundsPeriod.end = "2020-10-01"
* action.timingTiming.repeat.frequency = 1
* action.timingTiming.repeat.period = 1
* action.timingTiming.repeat.periodUnit = #wk

//Still need a way to reference a parent program; action.action or action.definitionCanonical?
//action.definitionCanonical references from the parent to the child program. In CODI, AFFILIATED_PROGRAM goes the other way, up to the parent.
//The FHIR IG could just require program/sub-programs to be set up as in FHIR