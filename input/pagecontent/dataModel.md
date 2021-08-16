The CODI data model was developed with an attempt to reuse existing data models where appropriate. Roughly half of the CODI data model is based on the PCORnet Common Data Model. The Common Data Models Harmonization (CDMH) FHIR IG seeks to map and translate data extracted for PCOR purposes into FHIR format. Where possible, this IG utilizes CDMH. 

## PCORnet Data Tables
The following subsections detail CODI tables that are based on the PCORnet CDM. The mappings to FHIR are based on CDMH, which utilizes US Core. The Provider and Vital tables are exceptions to this rule and details are given below.
Additionally, CDMH maps IDs the "id" FHIR data element for Resources, but here they are mapped to the "identifier" data element because CODI 
utilizes data owners' business identifiers, not FHIR logical identifiers, to reference data.

### Demographic
The CDM DEMOGRAPHIC table contains a single record for each patient. Demographics record the direct attributes of individual
patients.

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

| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| PROVIDER | providerid | Practitioner.identifier | Practitioner | USCorePractitionerProfile |
| PROVIDER | provider_sex | Practitioner.gender | Practitioner | USCorePractitionerProfile |
| PROVIDER | provider_specialty_primary | Practitioner.specialty | Practitioner | USCorePractitionerProfile |

### Vital
The CDM VITAL table contains one record for each measurement of vital signs. Vital signs (such as height, weight, and blood
pressure) directly measure an individual’s current state of attributes.

US Core has progressed since the most recent CDMH update, so the original CDMH mappings are not used for VITAL.

US Core now offers profiles for vital signs, including individually for BMI, blood pressure, height, and weight. 

These profiles are all derived from the US Core Vital Signs Profile. The choice of profile depends on which vital sign is being reported.

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
the intended function of the alert. Only obesity- or weight-related alerts should be captured for CODI.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| ALERT | ALERTID | Communication.identifier | CODIAlertProfile |  |
| ALERT | ALERT_PURPOSE | Communication.payload\[alertPurpose\].contentString | CODIAlertProfile | Slice on payload element |
| ALERT | ALERT_TRIGGER | Communication.payload\[alertTrigger\].contentString | CODIAlertProfile | Slice on payload element |
| ALERT | ALERT_FORM | Communication.payload\[alertForm\].contentString | CODIAlertProfile | Slice on payload element |

### Asset Delivery
The ASSET_DELIVERY table contains one record for each contiguous period of time during which a person consistently receives
assets. An asset is a resource transferred by a program to an individual.

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
A curriculum component is a standard element of a program. A program can comprise a fixed curriculum with a predefined endpoint
and an enumerated set of standard sessions. Or, a program can comprise a recurring curriculum with no endpoint and a set of standard
sessions that recur with some frequency.

In the CODI RDM, a CURRICULUM_COMPONENT points to a PROGRAM via programId.A curriculum component is related to a program via the program's action.definitionCanonical. This is a reversal from the CODI RDM, in which

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
report of a condition that a family member has. Absence of a record in this table is not indicative the absence of a condition.
This information is intended to be pulled from the patient's record, not by linking to a family member's medical record.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| FAMILY_HISTORY | FAMILY_HISTORY_ID | identifier | FamilyMemberHistory |  |
| FAMILY_HISTORY | PATID | patient | FamilyMemberHistory |  |
| FAMILY_HISTORY | CONDITION | condition.code | FamilyMemberHistory |  |
| FAMILY_HISTORY | CONDITION_TYPE | condition.code | FamilyMemberHistory |  |
| FAMILY_HISTORY | RELATIONSHIP | relationship | FamilyMemberHistory |  |
| FAMILY_HISTORY | REPORT_DATE | date | FamilyMemberHistory |  |

### Program
The PROGRAM table contains one record for each distinct program. A program comprises a collection of interventions intended to
produce a particular outcome.

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
The REFERRAL table contains one record for each outgoing or incoming referral.

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
| REFERRAL | SOURCE_ORGANIZATION | requester | CODIReferralProfile |  |
| REFERRAL | DESTINATION_ORGANIZATION | performer | CODIReferralProfile |  |
| REFERRAL | DESTINATION_SPECIALTY | performerType | CODIReferralProfile |  |

### Session
The SESSION table contains one record for each session. A session is a specific point in time where a child/family is involved in
programming that focuses on obesity, obesity prevention, healthy eating, or active living.

In a clinical setting, a session corresponds to a visit. There may be multiple visits in a single encounter. The ENCOUNTERID field is
required for clinical sessions.

In a community setting, a session corresponds to one component of a program. The PROGRAMID field is required for sessions that
are components of a program.

At least one of those fields should be present in every case.

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

CODI session alerts are not implemented as a FHIR resource. Instead, they are an extension on the Procedure resource as 
defined in CODISessionProfile. The extension has cardinality 0..\* and contains a reference to an ALERT and a dateTime.

## VDW Data Tables

### Census Demog
The VDW CENSUS_DEMOG table is a static reference table that will be provided to each data partner through the PopMedNet data
sharing client. This data is used to provide community level attributes for each census tract or county of a patient’s residence.

For complete documentation, see the CHORDS VDW Data Model Manual.

| **VDW/CODI Table** | **VDW Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
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
The VDW CENSUS_LOCATION table holds patient geographic location information collected at healthcare encounters. Patient
addresses should be geocoded, and FIPS codes down to the census tract level should be populated in the CENSUS_LOCATION table.

| **VDW/CODI Table** | **VDW Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
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