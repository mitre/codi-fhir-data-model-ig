Instance: Program1
InstanceOf: CODIProgramProfile
Title: "Program1"
Usage: #example
* url = "http://codi.nc.mitre.org/Program/GotR_Triangle"
* identifier.value = "program1"
* title = "Girls on the Run of the Triangle"
* status = #active
* topic = ProgramType#NU
* useContext.valueCodeableConcept.coding = http://teminology.hl7.org/CodeSystem/CODI-setting-type#CO "Community"
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#CODIProgram
* action.title = "GotR Triangle Nutrition"
* action.description = "Girls on the Run of the Triangle Nutrition action"
* action.timingTiming.repeat.boundsPeriod.start = "2020-01-01"
* action.timingTiming.repeat.boundsPeriod.end = "2020-10-01"
* action.timingTiming.repeat.frequency = 1
* action.timingTiming.repeat.period = 1
* action.timingTiming.repeat.periodUnit = #wk
* action.extension[programPrescribedTotalDose].valueDecimal = 20.25
* extension[programSessionOmission].extension[percent].valueDecimal = 0.33
* extension[programSessionOmission].extension[description].valueString = "session omission description"
* extension[programSessionOmission].extension[systematic].valueBoolean = false