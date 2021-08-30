The CODI research data model (RDM) was developed with an attempt to reuse existing data models where appropriate. Roughly half of the CODI data model is based on the 
PCORnet Common Data Model. The [Common Data Models Harmonization (CDMH) FHIR IG](http://hl7.org/fhir/us/cdmh/2019May/profiles.html) seeks to map and 
translate data extracted for PCOR purposes into FHIR format. Where possible, this IG utilizes CDMH. 

## PCORnet Data Tables
The following subsections detail CODI tables that are based on the PCORnet CDM. Not all PCORnet data elements are carried over to CODI. The mappings to 
FHIR are based on [CDMH](http://hl7.org/fhir/us/cdmh/2019May/profiles.html), except for the Provider and Vital tables, details of which are given below.

CDMH maps identifier data elements to the "id" FHIR data element for Resources (except for the CDM DEMOGRAPHIC table). But in CODI they are 
mapped to the "identifier" data element because CODI utilizes data owners' business identifiers, not FHIR logical identifiers, to reference data.

### Demographic
The CDM DEMOGRAPHIC table contains a single record for each patient with at
least one clinical visit or program participation since the implementing network’s start date.
Implementers should not include patients without other records in the RDM. For example, a
patient should be included in the DEMOGRAPHIC table if they have ENCOUNTER data, but not
VITAL data.

To preserve referential integrity, there must be a DEMOGRAPHIC record for any child for
whom information exists in any other RDM table (such as ENCOUNTER or SESSION).
Conversely, every DEMOGRAPHIC record should have corresponding records in at least one
other RDM table.

CODI omits children without other information in the RDM because populating the
DEMOGRAPHIC table with all children introduces the possibility that their PII is shared with
the DCC even though insufficient information exists about those children to answer possible
research questions. For example, a child might be selected as a member of a cohort based on age
and sex, but absent any encounters, vital signs, or program participation, none of the CODI
research questions benefit from the inclusion of that child.

No PII is contained in DEMOGRAPHIC because of the research nature of CODI. DEMOGRAPHIC's identifier is a Link ID as defined 
in the Privacy Preserving Record Linkage (PPRL) IG.

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| --- | --- | --- | --- | --- | 
| DEMOGRAPHIC | patid | Patient.identifier | CODIDemographicProfile | FHIR element Demographic.identifier SHALL be constrained to only Link IDs
| DEMOGRAPHIC | birth_date | Patient.birthDate | CODIDemographicProfile | 
| DEMOGRAPHIC | sex | Patient.extension: us-core-birthsex | CODIDemographicProfile | 
| DEMOGRAPHIC | hispanic | Patient.extension: us-core-ethnicity | CODIDemographicProfile | 
| DEMOGRAPHIC | race | Patient.extension: us-core-race | CODIDemographicProfile | 
| DEMOGRAPHIC | pat_pref_language_spoken | Patient.communication.language | CODIDemographicProfile | 

### Diagnosis
The CDM DIAGNOSIS table contains one record for each diagnosis of a patient. Diagnosis codes indicate the results of diagnostic
processes and medical coding within healthcare delivery. Data in this table are expected to be from healthcare-mediated processes and
reimbursement drivers.

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| DIAGNOSIS | diagnosisid | Condition.identifier | CODIDiagnosisProfile | CDMH mapped this to the "id" FHIR element, but CODI maps it to "identifier"
| DIAGNOSIS | patid | Condition.subject | CODIDiagnosisProfile | 
| DIAGNOSIS | encounterid | Condition.encounter | CODIDiagnosisProfile | 
| DIAGNOSIS | enc_type | Condition.encounter.class | CODIDiagnosisProfile, CODIEncounterProfile | 
| DIAGNOSIS | admit_date | Condition.encounter.period | CODIDiagnosisProfile, CODIEncounterProfile | 
| DIAGNOSIS | providerid | Condition.encounter.participant.individual.id | CODIDiagnosisProfile, CODIEncounterProfile, us-core-practitioner | 
| DIAGNOSIS | dx | Condition.code | CODIDiagnosisProfile | 
| DIAGNOSIS | dx_type | Condition.code | CODIDiagnosisProfile | 
| DIAGNOSIS | dx_source | Condition.encounter.diagnosis.use | CODIDiagnosisProfile, CODIEncounterProfile | 
| DIAGNOSIS | dx_origin | Condition.extension | CODIDiagnosisProfile | Extension created: diagnosisOrigin

### Encounter
The CDM ENCOUNTER table contains one record for each unique encounter. Encounters are interactions between patients and
providers within the context of healthcare delivery. An encounter comprises multiple visits, diagnoses, procedures, etc.

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| ENCOUNTER | encounterid | Encounter.identifier | CODIEncounterProfile | CDMH mapped this to the "id" FHIR element, but CODI maps it to "identifier"
| ENCOUNTER | patid | Encounter.subject | CODIEncounterProfile | 
| ENCOUNTER | admit_date | Encounter.period | CODIEncounterProfile | 
| ENCOUNTER | admit_time | Encounter.period | CODIEncounterProfile | 
| ENCOUNTER | discharge_date | Encounter.period | CODIEncounterProfile | 
| ENCOUNTER | discharge_time | Encounter.period | CODIEncounterProfile | 
| ENCOUNTER | providerid | Encounter.participant.individual.id | CODIEncounterProfile, us-core-practitioner | 
| ENCOUNTER | facility_location | Encounter.location.location.address | CODIEncounterProfile, us-core-location | 
| ENCOUNTER | enc_type | Encounter.class | CODIEncounterProfile | 
| ENCOUNTER | discharge_disposition | Encounter.extension (Proposed Name: discharge-disposition: CodeableConcept) : or Observation.code, Observation.value\[x\] | CODIEncounterProfile or USCoreLaboratoryResultObservationProfile | Extension created: encounterDischargeDisposition
| ENCOUNTER | discharge_status | Encounter.location.location.type | CODIEncounterProfile, us-core-location | 
| ENCOUNTER | drg | Encounter.extension (Proposed Name: drg : CodeableConcept) | CODIEncounterProfile | Extension created: encounterDrg
| ENCOUNTER | drg_type | Encounter.extension (Proposed Name: drg-type : CodeableConcept) | CODIEncounterProfile | Extension created: encounterDrg
| ENCOUNTER | admitting_source | Encounter.hospitalization.admitSource or Encounter.hospitalization.origin(location).type | CODIEncounterProfile, us-core-location | 
| ENCOUNTER | payer_type_primary | Encounter.extension (Proposed Name: payer-type-primary : Coding) | CODIEncounterProfile | Extension created: encounterPayerType
| ENCOUNTER | payer_type_secondary | Encounter.extension (Proposed Name: payer-type-secondary : Coding) | CODIEncounterProfile | Extension created: encounterPayerType
| ENCOUNTER | facility_type | Encounter.location.location.type | CODIEncounterProfile, us-core-location | 

### Lab_Result_CM
The CDM LAB_RESULT_CM table contains one record for each lab result of a patient. This table is used to store quantitative and
qualitative measurements from blood and other body specimens.

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| LAB_RESULT_CM | lab_result_cm_id | Observation.identifier | USCoreLaboratoryResultObservationProfile | CDMH mapped this to the "id" FHIR element, but CODI maps it to "identifier"
| LAB_RESULT_CM | patid | Observation.subject | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | encounterid | Observation.encountr | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | lab_name | Observation.performer(organization).name | USCoreLaboratoryResultObservationProfile, us-core-organization | 
| LAB_RESULT_CM | specimen_source | Observation.specimen.bodySite | USCoreLaboratoryResultObservationProfile, Specimen | 
| LAB_RESULT_CM | lab_loinc | Observation.code | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | result_loc | Observation.performer(organization).type | USCoreLaboratoryResultObservationProfile, us-core-organization | 
| LAB_RESULT_CM | lab_px | Observation.partOf (Procedure) | USCoreLaboratoryResultObservationProfile, CODIProceduresProfile | 
| LAB_RESULT_CM | lab_px_type | Observation.partOf (Procedure) | USCoreLaboratoryResultObservationProfile, CODIProceduresProfile | 
| LAB_RESULT_CM | lab_order_date | Observation.basedOn(ServiceRequest).occurenceDateTime | USCoreLaboratoryResultObservationProfile, ServiceRequest | 
| LAB_RESULT_CM | specimen_date | Observation.specimen.collection.collectedDateTime | USCoreLaboratoryResultObservationProfile, Specimen | 
| LAB_RESULT_CM | specimen_time | Observation.specimen.collection.collectedDateTime | USCoreLaboratoryResultObservationProfile, Specimen | 
| LAB_RESULT_CM | result_date | Observation.issued | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | result_time | Observation.issued | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | result_qual | Observation.value\[x\] | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | result_num | Observation.value\[x\] | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | result_modifier | Observation.value\[x\] | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | result_unit | Observation.value\[x\] | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | abn_ind | Observation.interpretation | USCoreLaboratoryResultObservationProfile | 
| LAB_RESULT_CM | result_snomed | Observation.value\[x\](CodeableConcept) | USCoreLaboratoryResultObservationProfile | 

### Prescribing
The CDM PRESCRIBING table contains one record for each prescription ordered. Provider orders for medication dispensing and/or
administration. These orders may take place in any setting, including the inpatient or outpatient basis.

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| PRESCRIBING | prescribingid | MedicationRequestion.identifier | CODIPrescribingProfile | CDMH mapped this to the "id" FHIR element, but CODI maps it to "identifier"
| PRESCRIBING | patid | MedicationRequest.subject | CODIPrescribingProfile | 
| PRESCRIBING | encounterid | MedicationRequest.encounter | CODIPrescribingProfile | 
| PRESCRIBING | rx_providerid | MedicationRequest.requester | CODIPrescribingProfile, us-core-practitioner | 
| PRESCRIBING | rx_order_date | MedicationRequest.authoredOn | CODIPrescribingProfile | 
| PRESCRIBING | rx_order_time | MedicationRequest.authoredOn | CODIPrescribingProfile | 
| PRESCRIBING | rx_start_date | MedicationRequest.dispenseRequest.validityPeriod | CODIPrescribingProfile | 
| PRESCRIBING | rx_end_date | MedicationRequest.dispenseRequest.validityPeriod | CODIPrescribingProfile | 
| PRESCRIBING | rx_quantity | MedicationRequest.dispenseRequest.quantity | CODIPrescribingProfile | 
| PRESCRIBING | rxnorm_cui | MedicationRequest.medicationCodeableConcept | CODIPrescribingProfile | 
| PRESCRIBING | rx_dose_ordered | MedicationRequest.dosageInstruction.doseAndRate.dose\[x\] | CODIPrescribingProfile | 
| PRESCRIBING | rx_dose_ordered_unit | MedicationRequest.dosageInstruction.doseAndRate.dose\[x\] | CODIPrescribingProfile | 
| PRESCRIBING | rx_source | MedicationRequest.extension\[prescribingRxSource\] | CODIPrescribingProfile | The rx_source data element is missing from CDMH

### Procedures
The CDM PROCEDURES table contains one record per procedure for a patient. Procedure codes indicate the discrete medical
interventions and diagnostic testing, such as surgical procedures and lab orders, delivered within a healthcare context.

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| PROCEDURES | proceduresid | Procedure.identifier | CODIProceduresProfile | CDMH mapped this to the "id" FHIR element, but CODI maps it to "identifier"
| PROCEDURES | patid | Procedure.subject | CODIProceduresProfile | 
| PROCEDURES | encounterid | Procedure.encounter | CODIProceduresProfile | 
| PROCEDURES | enc_type | Procedure.encounter.class | CODIProceduresProfile, CODIEncounterProfile | 
| PROCEDURES | admit_date | Procedure.encounter.period | CODIProceduresProfile, CODIEncounterProfile | 
| PROCEDURES | providerid | Procedure.encounter.participant.individual.id | CODIProceduresProfile, CODIEncounterProfile, us-core-practitioner | 
| PROCEDURES | px_date | Procedure.performedDateTime | CODIProceduresProfile | 
| PROCEDURES | px | Procedure.code | CODIProceduresProfile | 
| PROCEDURES | px_type | Procedure.code | CODIProceduresProfile | 
| PROCEDURES | px_source | Procedure.Extension (Proposed Name: data-source-type : CodeableConcept) | CODIProceduresProfile | Extension created: proceduresPxSource

### Provider
The CDM PROVIDER table contains one record per PROVIDER ID. Data about the providers who are involved in the care processes
documented in the CDM.

CDMH does not provide mappings for Provider from the PCORnet CDM. The mappings provided below are created by the CODI project. 
If this is addressed in future CDMH updates then CODI will attempt to align with CDMH.

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| PROVIDER | providerid | Practitioner.identifier | Practitioner | USCorePractitionerProfile |
| PROVIDER | provider_sex | Practitioner.gender | Practitioner | USCorePractitionerProfile |
| PROVIDER | provider_specialty_primary | Practitioner.specialty | Practitioner | USCorePractitionerProfile |

### Vital
The CDM VITAL table contains one record for each measurement of vital signs. Vital signs (such as height, weight, and blood
pressure) directly measure an individual’s current state of attributes.

US Core has progressed since the most recent CDMH update, so the CDMH mappings for VITAL are not used.
US Core has profiles for individual vital signs, including BMI, blood pressure, height, and weight. 
These individual profiles are all based on a parent US Core profile called the US Core Vital Signs Profile. The choice of profile depends on 
which vital sign is being reported. Each vital sign is modeled as an idividual resource. They are not combined into a single "vital" 
record as they are in the PCORnet CDM.

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| VITAL | vitalid | Observation.identifier | USCoreVitalSignsProfile | CDMH mapped this to the "id" FHIR element, but CODI maps it to "identifier"
| VITAL | patid | Observation.subject | USCoreVitalSignsProfile | 
| VITAL | encounterid | Observation.encounter | USCoreVitalSignsProfile | 
| VITAL | measure_date | Observation.effectiveDateTime | USCoreVitalSignsProfile | 
| VITAL | measure_time | Observation.effectiveDateTime | USCoreVitalSignsProfile | 
| VITAL | vital_source | Observation.method | USCoreVitalSignsProfile | VITAL_SOURCE_TYPE
| VITAL | ht | Observation.code, Observation.value\[x\] | USCoreBodyHeightProfile | Height-specific profile
| VITAL | wt | Observation.code, Observation.value\[x\] | USCoreBodyWeightProfile | Weight-specific profile
| VITAL | diastolic | Observation.code, Observation.value\[x\] | USCoreBloodPressureProfile | Blood-pressure-specific profile
| VITAL | systolic | Observation.code, Observation.value\[x\] | USCoreBloodPressureProfile | Blood-pressure-specific profile
| VITAL | original_bmi | Observation.code, Observation.value\[x\] | USCoreBMIProfileProfile | BMI-specific profile

## Ancillary Data Tables

### Alert
The ALERT table contains one record for each distinct kind of alert. Alerts are components of a clinical decision support system
(CDS). Given the gamut of possible alerts and the idiosyncrasies of CDS implementations, CODI only captures a prose description of
the intended function of the alert. Only cardiometabolic condition and weight related alerts should be captured for CODI.
For each such alert, the ALERT table captures information about
the circumstances surrounding that alert. ALERT is a reference table that will likely need to be
populated manually because the information it contains requires human curation. The attributes
appearing in this table are intended to help a researcher understand when and why an alert might
trigger.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| ALERT | ALERTID | Communication.identifier | CODIAlertProfile |  |
| ALERT | ALERT_PURPOSE | Communication.payload\[alertPurpose\].contentString | CODIAlertProfile | Slice on payload element |
| ALERT | ALERT_TRIGGER | Communication.payload\[alertTrigger\].contentString | CODIAlertProfile | Slice on payload element |
| ALERT | ALERT_FORM | Communication.payload\[alertForm\].contentString | CODIAlertProfile | Slice on payload element |

### Asset Delivery
The ASSET_DELIVERY table contains one record for each contiguous period of time during which a person consistently receives
assets. An asset is a resource transferred by a program to an individual.The intention is that each record represents a series of asset deliveries that regularly
transpires. In situations where each delivery is ad hoc, the expectation is that a separate record
appears for each such delivery. Otherwise, CODI assumes the deliveries occur on a recurring
basis as described by the record. DELIVERY_FREQ indicates the number of deliveries within
each unit of time. DELIVERY_FREQ_UNIT establishes the corresponding unit of time.

Monthly refers to calendar months. Deliveries that happen every 28 days should be encoded as
0.25 deliveries every week (i.e., once every four weeks). For example, an individual might
receive cash benefits twice every calendar month. The start and end dates indicate the period of
time during which these benefits were received, with a DELIVERY_FREQ_UNIT of Monthly
and a DELIVERY_FREQ of 2.

Data partners that participate in asset delivery are encouraged to populate the
ASSET_PURPOSE at a minimum because it provides researchers with insight into the
circumstances surrounding the delivery of assets.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| ASSET_DELIVERY | ASSET_DELIVERY_ID | identifier | ServiceRequest |  |
| ASSET_DELIVERY | PATID | subject | ServiceRequest |  |
| ASSET_DELIVERY | PROGRAMID | instantiatesCanonical | ServiceRequest |  |
| ASSET_DELIVERY | ASSET_PURPOSE | code | ServiceRequest | Value set AssetType |
| ASSET_DELIVERY | DELIVERY_START_DATE | occurrence\[x\] | ServiceRequest |  |
| ASSET_DELIVERY | DELIVERY_END_DATE | occurrence\[x\] | ServiceRequest |  |
| ASSET_DELIVERY | DELIVERY_FREQ | occurrence\[x\] | ServiceRequest |  |
| ASSET_DELIVERY | DELIVERY_FREQ_UNIT | occurrence\[x\] | ServiceRequest |  |

### Curriculum Component
The CURRICULUM_COMPONENT table enumerates the standard elements of a program. It
supports a fixed curriculum, in which the components are ordered using SESSION_INDEX, and
a recurring curriculum, in which the components repeat. Repeating components are documented
with a combination of SESSION_FREQ and SESSION_FREQ_UNIT, as described above.

The remaining attributes mirror those in the SESSION table (as described below). The
CURRICULUM_COMPONENT table describes what is intended to happen throughout the
course of the program. The SESSION table describes what has been documented as having
transpired. The CURRICULUM_COMPONENT table provides researchers with insight into
what likely happened when session information is missing or incomplete.

A curriculum component is a standard element of a program. A program can comprise a fixed curriculum with a predefined endpoint
and an enumerated set of standard sessions. Or, a program can comprise a recurring curriculum with no endpoint and a set of standard
sessions that recur with some frequency.

In the CODI RDM, a CURRICULUM_COMPONENT points to a PROGRAM via programId. A curriculum component is related to a program 
via the program's action.definitionCanonical. This is a reversal from the CODI RDM, in which

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| CURRICULUM_COMPONENT | CURRICULUM_COMPONENT_ID | identifier | CODICurriculumComponentProfile |  |
| CURRICULUM_COMPONENT | PROGRAMID |  |  |  |
| CURRICULUM_COMPONENT | SESSION_INDEX |  |  | The session ordering is established in PROGRAM |
| CURRICULUM_COMPONENT | SESSION_FREQ | timingTiming | CODICurriculumComponentProfile |  |
| CURRICULUM_COMPONENT | SESSION_FREQ_UNIT | timingTiming | CODICurriculumComponentProfile |  |
| CURRICULUM_COMPONENT | SCREENING | topic | CODICurriculumComponentProfile | Value set InteractionType |
| CURRICULUM_COMPONENT | COUNSELING | topic | CODICurriculumComponentProfile | Value set InteractionType |
| CURRICULUM_COMPONENT | INTERVENTION_ACTIVITY | topic | CODICurriculumComponentProfile | Value set InteractionType |
| CURRICULUM_COMPONENT | INTERVENTION_NUTRITION | topic | CODICurriculumComponentProfile | Value set InteractionType |
| CURRICULUM_COMPONENT | INTERVENTION_NAVIGATION | topic | CODICurriculumComponentProfile | Value set InteractionType |
| CURRICULUM_COMPONENT | DOSE | extension\[sessionDose\] | CODICurriculumComponentProfile |  |

### Family History
The FAMILY_HISTORY table stores information regarding a child’s family history of disease. A separate record is created for each
report of a condition that a family member has. Thus, if a child’s parents both have a
history of obesity, two records would be present in this table. Absence of a record in this table is not indicative the absence of a condition.
This information is intended to be pulled from the patient's record, not by linking to a family member's medical record.
Reported conditions must be linked to controlled vocabulary—an ICD-9, ICD-10, or SNOMED
code—so researchers can easily interpret the reported family condition. Implementers will need
to map from whatever terminology is used for family history to one of these vocabularies.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| FAMILY_HISTORY | FAMILY_HISTORY_ID | identifier | FamilyMemberHistory |  |
| FAMILY_HISTORY | PATID | patient | FamilyMemberHistory |  |
| FAMILY_HISTORY | CONDITION | condition.code | FamilyMemberHistory |  |
| FAMILY_HISTORY | CONDITION_TYPE | condition.code | FamilyMemberHistory |  |
| FAMILY_HISTORY | RELATIONSHIP | relationship | FamilyMemberHistory |  |
| FAMILY_HISTORY | REPORT_DATE | date | FamilyMemberHistory |  |

### Program
The PROGRAM table contains one record for each distinct weight-related program. For the
purposes of CODI, each location at which a program is administered constitutes a distinct
program. For example, each clinic that administers a weight management program appears
separately in the PROGRAM table.

This is the second table that will likely need to be manually populated. It captures a program
manager’s best understanding of how a weight-related program is administered and for what
purpose. The attributes with the PROGRAM_ and AIM_ prefixes apply to every program. The
attributes with the PRESCRIBED_ prefix only apply to those programs with a predefined
frequency of interaction, such as a program that lasts for ten weeks, and meets twice a week, two
hours each time. This regularity allows researchers to know the intended dose and intensity (i.e.,
frequency of interaction) for the program. Programs without a predefined dose should leave these
attributes blank.

The AFFILIATED_PROGRAM attribute provides a way to document that a given program is
affiliated with an encompassing program. For example, consider a weight-related program with
two component programs (a cooking class and a physical activity program); participation in each
is based on each child’s needs: this configuration includes three programs. The affiliated
programs (i.e., cooking class, physical activity program) include prescribed doses and have
specific aims, while the parent program has no set dose, and its aims are broad. The
AFFILIATED_PROGRAM attribute allows the affiliated programs to indicate the parent
program with which they are affiliated.

The attributes with the LOCATION_ prefix describe the location at which the program is
typically administered. Three variants of location are supported: address, geospatial coordinates
(latitude and longitude), and geocode (typically census tract). Data partners should provide all
three variants for each program, if possible.

The attributes with the SESSION_OMISSION_ prefix describe the circumstances under which
session information is missing for the program. For example, some clinical programs only record
sessions with a clinical component. The sessions lacking a clinical component are not
documented and therefore do not appear in the SESSION table. Other programs exhibit less
systematic omissions, e.g., because attendance is sometimes captured on paper. These attributes
are included to help researchers better decide how to handle mission session information.

There are no dates of enrollment or completion associated with a program for two reasons. First,
the program table describes how the program is administered irrespective of any child’s
participation in the program. Enrollment and completion dates would need to be stored in a
separate program participation table. Such a table does not exist because the Technical
Environmental Scan determined that enrollment is often hard to distinguish from attendance (i.e.,
the first session attended indicates enrollment). Completion date was almost never available. A
researcher interested in program completion might compare the cumulative dose received with
the prescribed total dose for that program.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| PROGRAM | PROGRAMID | identifier | CODIProgramProfile |  |
| PROGRAM | PROGRAM_NAME | title | CODIProgramProfile |  |
| PROGRAM | PROGRAM_DESCRIPTION | description | CODIProgramProfile |  |
| PROGRAM | PROGRAM_SETTING | useContext | CODIProgramProfile | Value set SettingType |
| PROGRAM | AFFILIATED_PROGRAMID | action.definitionCanonical | CODIProgramProfile | canonical reference to a parent PROGRAM |
| PROGRAM | AIM_NUTRITION | topic | CODIProgramProfile | Value set ProgramType |
| PROGRAM | AIM_ACTIVITY | topic | CODIProgramProfile | Value set ProgramType |
| PROGRAM | AIM_WEIGHT | topic | CODIProgramProfile | Value set ProgramType |
| PROGRAM | PRESCRIBED_TOTAL_DOSE |  | CODIProgramProfile | Derived value from PRESCRIBED_PROGRAM_DURATION, PRESCRIBED_SESSION_FREQUENCY, and PRESCRIBED_SESSION_LENGTH |
| PROGRAM | PRESCRIBED_PROGRAM_DURATION | action.timingTiming |  |  |
| PROGRAM | PRESCRIBED_SESSION_FREQUENCY | action.timingTiming |  |  |
| PROGRAM | PRESCRIBED_SESSION_LENGTH | action.timingTiming |  |  |
| PROGRAM | LOCATION_ADDRESS | address | CODICensusLocationProfile |  |
| PROGRAM | LOCATION_LATITUDE | position.latitude | CODICensusLocationProfile |  |
| PROGRAM | LOCATION_LONGITUDE | position.longitude | CODICensusLocationProfile |  |
| PROGRAM | LOCATION_GEOCODE | extension\[censusLocationGeocode\].valueString | CODICensusLocationProfile |  |
| PROGRAM | LOCATION_BOUNDARY_YEAR | extension\[censusLocationGeocodeBoundaryYear\].valueDate | CODICensusLocationProfile |  |
| PROGRAM | LOCATION_GEOLEVEL | extension\[censusLocationGeolevel\].valueCoding | CODICensusLocationProfile |  |
| PROGRAM | SESSION_OMISSION_PERCENT | extension\[programSessionOmission\].extension\[percent\].valueDecimal |  |  |
| PROGRAM | SESSION_OMISSION_DESCRIPTION | extension\[programSessionOmission\].extension\[description\].valueString |  |  |
| PROGRAM | SESSION_OMISSION_SYSTEMATIC | extension\[programSessionOmission\].extension\[systematic\].valueBoolean |  |  |

### Referral
The REFERRAL table contains one record for each outgoing or incoming referral. The
DIRECTION attribute indicates if the record represents a data partner initiating a referral
(outgoing) or receiving a referral (incoming). Internal referrals should result in two records in the
REFERRAL table: one outgoing referral and a second incoming referral. The purpose of the
source and destination organization attributes is to link outgoing referrals with incoming referrals
so researchers can see whether a referral successfully connected a child with a weight-related
program. 

Implementers will need to map organizations to CMS Certification NumbersFor clinical organizations, use the CMS 
Certification Number (CCN); each implementing network will need to choose a representative
CCN for its clinical data partners. For community organizations, each implementing network will need to establish a set of community
organization codes. These additional codes should include at least one letter so that they do not conflict with CCNs.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| REFERRAL | REFERRALID | identifier | CODIReferralProfile |  |
| REFERRAL | PATID | subject | CODIReferralProfile |  |
| REFERRAL | ENCOUNTERID | encounter | CODIReferralProfile |  |
| REFERRAL | DIRECTION | extension\[referralDirection\] | CODIReferralProfile |  |
| REFERRAL | REFERRAL_DATE | authoredOn | CODIReferralProfile |  |
| REFERRAL | REFERRAL_STATUS | extension\[referralDispositionStatus\] | CODIReferralProfile |  |
| REFERRAL | REFERRAL_PRIOR_AUTH | extension\[referralPriorAuth\] | CODIReferralProfile |  |
| REFERRAL | SOURCE_PROVIDERID | requester | CODIReferralProfile |  |
| REFERRAL | SOURCE_ORGANIZATION | requester | CODIReferralProfile | CMS Certification Numbers |
| REFERRAL | DESTINATION_ORGANIZATION | performer | CODIReferralProfile | CMS Certification Numbers |
| REFERRAL | DESTINATION_SPECIALTY | performerType | CODIReferralProfile |  |

### Session
The SESSION table contains one record for each session. A session is a specific point in time where a child/family is involved in
programming that focuses on obesity, obesity prevention, healthy eating, or active living.

In a clinical setting, a session corresponds to a visit. There may be multiple visits in a single encounter. The ENCOUNTERID field is
required for clinical sessions. In a community setting, a session corresponds to one component of a program. The PROGRAMID field is required for sessions that
are components of a program. At least one of those fields should be present in every case.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| SESSION | SESSIONID | identifier | CODISessionProfile |  |
| SESSION | PATID | subject | CODISessionProfile |  |
| SESSION | ENCOUNTERID | encounter | CODISessionProfile |  |
| SESSION | PROVIDERID | performer.actor | CODISessionProfile |  |
| SESSION | PROGRAMID | instantiatesCanonical | CODISessionProfile | canonical reference to PROGRAM |
| SESSION | SESSION_DATE | performedDateTime | CODISessionProfile |  |
| SESSION | SESSION_MODE | category | CODISessionProfile |  |
| SESSION | SCREENING | reasonCode | CODISessionProfile | Value set InteractionType |
| SESSION | COUNSELING | reasonCode | CODISessionProfile | Value set InteractionType |
| SESSION | INTERVENTION_ACTIVITY | reasonCode | CODISessionProfile | Value set InteractionType |
| SESSION | INTERVENTION_NUTRITION | reasonCode | CODISessionProfile | Value set InteractionType |
| SESSION | INTERVENTION_NAVIGATION | reasonCode | CODISessionProfile | Value set InteractionType |
| SESSION | DOSE | extension\[sessionDose\].valueDecimal | CODISessionProfile |  |
| SESSION | CURRICULUM_COMPONENT_ID | instantiatesCanonical | CODISessionProfile | canonical reference to CURRICULUM_COMPONENT |
| SESSION | SESSION_ALERT_ID | not used |  | part of SESSION_ALERT |
| SESSION | ALERTID | extension\[sessionSessionAlert\].extension\[sessionAlert\].valueReference | CODISessionProfile | part of SESSION_ALERT; reference to ALERT  |
| SESSION | ALERT_DATE | extension\[sessionSessionAlert\].extension\[sessionAlertDateTime\].valueDateTime | CODISessionProfile | part of SESSION_ALERT |
| SESSION | ALERT_TIME | extension\[sessionSessionAlert\].extension\[sessionAlertDateTime\].valueDateTime | CODISessionProfile | part of SESSION_ALERT |

### Session Alert
The SESSION_ALERT table contains one record for each alert that triggered during a session.

CODI session alerts are not implemented as a distinct FHIR resource. Instead, they are an extension on the Procedure resource as 
defined in CODISessionProfile. The extension has cardinality 0..\* and contains a reference to an ALERT and a dateTime.

## CHORDS Data Tables

### Census Demog
The CHORDS CENSUS_DEMOG table is a static reference table that will be provided to each data partner through the PopMedNet data
sharing client. This data is used to provide community level attributes for each census tract or county of a patient’s residence.

For complete documentation, see the CHORDS VDW Data Model Manual. The data elements are listed below for informational purposes.

| **CHORDS/CODI Table** | **CHORDS Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| CENSUS_DEMOG | BLOCK |  |  |  |
| CENSUS_DEMOG | CENSUS_DATA_SRC |  |  |  |
| CENSUS_DEMOG | GEOCODE |  |  |  |
| CENSUS_DEMOG | CHORDS_GEOLEVEL |  |  |  |
| CENSUS_DEMOG | STATE |  |  |  |
| CENSUS_DEMOG | COUNTY |  |  |  |
| CENSUS_DEMOG | TRACT |  |  |  |
| CENSUS_DEMOG | BLOCKGP |  |  |  |
| CENSUS_DEMOG | HOUSES_N |  |  |  |
| CENSUS_DEMOG | RA_X |  |  |  |
| CENSUS_DEMOG | HOUSES_X |  |  |  |
| CENSUS_DEMOG | EDUCATION_N |  |  |  |
| CENSUS_DEMOG | MEDFAMINCOME |  |  |  |
| CENSUS_DEMOG | FAMINCOME_N |  |  |  |
| CENSUS_DEMOG | MEDHOUSEINCOME |  |  |  |
| CENSUS_DEMOG | HOUSINCOME_N |  |  |  |
| CENSUS_DEMOG | POV_X |  |  |  |
| CENSUS_DEMOG | X_SPEAKER |  |  |  |
| CENSUS_DEMOG | ETC |  |  |  |
| CENSUS_DEMOG | CENSUS_YEAR |  |  |  |
| CENSUS_DEMOG | ZIP |  |  |  |
| CENSUS_DEMOG | RURAL_URBAN_CODE |  |  |  |
| CENSUS_DEMOG | CensusLocation |  |  |  |

### Census Location
The CHORDS CENSUS_LOCATION table holds patient geographic location information collected at healthcare encounters. Patient
addresses should be geocoded, and FIPS codes down to the census tract level should be populated in the CENSUS_LOCATION table.

| **CHORDS/CODI Table** | **CHORDS Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| CENSUS_LOCATION | PERSON_ID | extension\[censusLocationPersonId\].valueReference | CODICensusLocationProfile |  |
| CENSUS_LOCATION | LOC_START | address.period.start | CODICensusLocationProfile |  |
| CENSUS_LOCATION | LOC_END | address.period.start | CODICensusLocationProfile |  |
| CENSUS_LOCATION | GEOCODE | extension\[censusLocationGeocode\].valueString | CODICensusLocationProfile |  |
| CENSUS_LOCATION | GEOCODE_BOUNDARY_YEAR | extension\[censusLocationGeocodeBoundaryYear\].valueDate | CODICensusLocationProfile |  |
| CENSUS_LOCATION | GEOLEVEL | extension\[censusLocationGeolevel\].valueCoding | CODICensusLocationProfile |  |
| CENSUS_LOCATION | LATITUDE | position.latitude | CODICensusLocationProfile |  |
| CENSUS_LOCATION | LONGITUDE | position.longitude | CODICensusLocationProfile |  |

## OMOP Data Table

### Cost
The OMOP COST table captures records containing the cost of any medical event recorded in one of the OMOP clinical event table.
1) This table does not capture the cost of providing the service, but rather the amounts billed and received.
2) The COST table can link to ENCOUNTER, LAB_RESULT_CM, PROCEDURES, or SESSION.

The FHIR ChargeItem resource is required to reference the event that incurred the charge and to document the date and time of the charge.

The FHIR Invoice resource contains the actual incurred cost and date of billing.

Payment information is recorded in a FHIR PaymentReconciliation resource.

| **OMOP/CODI Table** | **OMOP Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| COST | cost_id | identifier | Invoice |  |
| COST | person_id | subject | ChargeItem |  |
| COST | cost_event_id | context (to reference ENCOUNTER); service (to reference LAB_RESULT_CM, PROCEDURES, or SESSION) | ChargeItem |  |
| COST | cost_event_field_concept_id | not used (implicit in reference type of cost_event_id) | N/A |  |
| COST | cost_concept_id | code | ChargeItem |  |
| COST | cost | lineItem.priceComponent.amount | Invoice |  |
| COST | incurred_date | occurrenceDateTime | ChargeItem |  |
| COST | billed_date | date | Invoice |  |
| COST | paid_date | paymentDate | PaymentReconciliation |  |