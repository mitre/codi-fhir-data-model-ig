The CODI data model was developed with an attempt to reuse existing data models where appropriate. Roughly half of the CODI data model is based on the PCORnet Common Data Model. The Common Data Models Harmonization (CDMH) FHIR IG seeks to map and translate data extracted for PCOR purposes into FHIR format. Where possible, this IG utilizes CDMH. 

# PCORnet Data Tables
The following subsections cover the tables 

## Demographic
| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| --- | --- | --- | --- | --- | 
| DEMOGRAPHIC | patid | Patient.identifier | us-core-patient | 
| DEMOGRAPHIC | birth_date | Patient.birthDate | us-core-patient | 
| DEMOGRAPHIC | birth_time | Patient.birthDate | us-core-patient | 
| DEMOGRAPHIC | sex | Patient.extension: us-core-birthsex | us-core-patient | 
| DEMOGRAPHIC | sexual_orientation | Observation.code, Observation.value\[x\] | us-core-observationresults | 
| DEMOGRAPHIC | gender_identity | Observation.code, Observation.value\[x\] | us-core-observationresults | 
| DEMOGRAPHIC | hispanic | Patient.extension: us-core-ethnicity | us-core-patient | 
| DEMOGRAPHIC | race | Patient.extension: us-core-race | us-core-patient | 
| DEMOGRAPHIC | biobank_flag | Not Mapped for CDMH. | Not Mapped for CDMH | 
| DEMOGRAPHIC | pat_pref_language_spoken | Patient.communication.language | us-core-patient | 

## Diagnosis
| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| DIAGNOSIS | diagnosisid | Condition.id | us-core-condition | 
| DIAGNOSIS | patid | Condition.subject | us-core-condition | 
| DIAGNOSIS | encounterid | Condition.encounter | us-core-condition | 
| DIAGNOSIS | enc_type | Condition.encounter.class | us-core-condition,us-core-encounter | 
| DIAGNOSIS | admit_date | Condition.encounter.period | us-core-condition,us-core-encounter | 
| DIAGNOSIS | providerid | Condition.encounter.participant.individual.id | us-core-condition,us-core-encounter, us-core-practitioner | 
| DIAGNOSIS | dx | Condition.code | us-core-condition | 
| DIAGNOSIS | dx_type | Condition.code | us-core-condition | 
| DIAGNOSIS | dx_source | Condition.encounter.diagnosis.use | us-core-condition,us-core-encounter | 
| DIAGNOSIS | dx_origin | Condition.Extension (Proposed Name: data-source-type : CodeableConcept) | us-core-condition | 
| DIAGNOSIS | pdx | Condition.encounter.diagnosis.rank | us-core-condition,us-core-encounter | 
| DIAGNOSIS | dx_poa | Condition.encounter.diagnosis.use | us-core-condition,us-core-encounter | 


## Encounter
| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| ENCOUNTER | encounterid | Encounter.id | us-core-encounter | 
| ENCOUNTER | patid | Encounter.subject | us-core-encounter | 
| ENCOUNTER | admit_date | Encounter.period | us-core-encounter | 
| ENCOUNTER | admit_time | Encounter.period | us-core-encounter | 
| ENCOUNTER | discharge_date | Encounter.period | us-core-encounter | 
| ENCOUNTER | discharge_time | Encounter.period | us-core-encounter | 
| ENCOUNTER | providerid | Encounter.participant.individual.id | us-core-encounter, us-core-practitioner | 
| ENCOUNTER | facility_location | Encounter.location.location.address | us-core-encounter, us-core-location | 
| ENCOUNTER | enc_type | Encounter.class | us-core-encounter | 
| ENCOUNTER | facilityid | Encounter.location.location.identifier | us-core-encounter, us-core-location | 
| ENCOUNTER | discharge_disposition | Encounter.extension (Proposed Name: discharge-disposition: CodeableConcept) : or Observation.code, Observation.value\[x\] | us-core-encounter or us-core-observationresults | 
| ENCOUNTER | discharge_status | Encounter.location.location.type | us-core-encounter,us-core-location | 
| ENCOUNTER | drg | Encounter.extension (Proposed Name: drg : CodeableConcept) | us-core-encounter | 
| ENCOUNTER | drg_type | Encounter.extension (Proposed Name: drg-type : CodeableConcept) | us-core-encounter | 
| ENCOUNTER | admitting_source | Encounter.hospitalization.admitSource or Encounter.hospitalization.origin(location).type | us-core-encounter, us-core-location | 
| ENCOUNTER | payer_type_primary | Encounter.extension (Proposed Name: payer-type-primary : Coding) | us-core-encounter | 
| ENCOUNTER | payer_type_secondary | Encounter.extension (Proposed Name: payer-type-secondary : Coding) | us-core-encounter | 
| ENCOUNTER | facility_type | Encounter.location.location.type | us-core-encounter, us-core-location | 


## Lab_Result_CM
| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| LAB_RESULT_CM | lab_result_cm_id | Observation.id | us-core-observationresults | 
| LAB_RESULT_CM | patid | Observation.subject | us-core-observationresults | 
| LAB_RESULT_CM | encounterid | Observation.encountr | us-core-observationresults | 
| LAB_RESULT_CM | lab_name | Observation.performer(organization).name | us-core-observationresults, us-core-organization | 
| LAB_RESULT_CM | specimen_source | Observation.specimen.bodySite | us-core-observationresults,Specimen | 
| LAB_RESULT_CM | lab_loinc | Observation.code | us-core-observationresults | 
| LAB_RESULT_CM | priority | Observation.Extension (Proposed Name: priority : Coding) | us-core-observationresults | 
| LAB_RESULT_CM | result_loc | Observation.performer(organization).type | us-core-observationresults, us-core-organization | 
| LAB_RESULT_CM | lab_px | Observation.partOf (Procedure) | us-core-observationresults, us-core-procedure | 
| LAB_RESULT_CM | lab_px_type | Observation.partOf (Procedure) | us-core-observationresults, us-core-procedure | 
| LAB_RESULT_CM | lab_order_date | Observation.basedOn(ServiceRequest).occurenceDateTime | us-core-observationresults, ServiceRequest | 
| LAB_RESULT_CM | specimen_date | Observation.specimen.collection.collectedDateTime | us-core-observationresults,Specimen | 
| LAB_RESULT_CM | specimen_time | Observation.specimen.collection.collectedDateTime | us-core-observationresults,Specimen | 
| LAB_RESULT_CM | result_date | Observation.issued | us-core-observationresults | 
| LAB_RESULT_CM | result_time | Observation.issued | us-core-observationresults | 
| LAB_RESULT_CM | result_qual | Observation.value\[x\] | us-core-observationresults | 
| LAB_RESULT_CM | result_num | Observation.value\[x\] | us-core-observationresults | 
| LAB_RESULT_CM | result_modifier | Observation.value\[x\] | us-core-observationresults | 
| LAB_RESULT_CM | result_unit | Observation.value\[x\] | us-core-observationresults | 
| LAB_RESULT_CM | norm_range_low | Observation.referenceRange.low | us-core-observationresults | 
| LAB_RESULT_CM | norm_modifier_low | Observation.referenceRange.modifierExtension | us-core-observationresults | 
| LAB_RESULT_CM | norm_range_high | Observation.referenceRange.high | us-core-observationresults | 
| LAB_RESULT_CM | norm_modifier_high | Observation.referenceRange.modifierExtension | us-core-observationresults | 
| LAB_RESULT_CM | abn_ind | Observation.interpretation | us-core-observationresults | 
| LAB_RESULT_CM | result_snomed | Observation.value\[x\](CodeableConcept) | us-core-observationresults | 
| LAB_RESULT_CM | raw_lab_name | Observation.code | us-core-observationresults | 
| LAB_RESULT_CM | raw_result | Observation.value\[x\] | us-core-observationresults | 


## Link
The CDMH IG did not provide mappings for the Link PCORnet data elements. 

## Prescribing
| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| PRESCRIBING | prescribingid | MedicationRequestion.id | us-core-medicationrequest | 
| PRESCRIBING | patid | MedicationRequest.subject | us-core-medicationrequest | 
| PRESCRIBING | encounterid | MedicationRequest.encounter | us-core-medicationrequest | 
| PRESCRIBING | rx_providerid | MedicationRequest.requester | us-core-medicationrequest, us-core-practitioner | 
| PRESCRIBING | rx_order_date | MedicationRequest.authoredOn | us-core-medicationrequest | 
| PRESCRIBING | rx_order_time | MedicationRequest.authoredOn | us-core-medicationrequest | 
| PRESCRIBING | rx_start_date | MedicationRequest.dispenseRequest.validityPeriod | us-core-medicationrequest | 
| PRESCRIBING | rx_end_date | MedicationRequest.dispenseRequest.validityPeriod | us-core-medicationrequest | 
| PRESCRIBING | rx_quantity | MedicationRequest.dispenseRequest.quantity | us-core-medicationrequest | 
| PRESCRIBING | rx_dose_form | MedicationRequest.dosageInstruction.doseAndRate.dose\[x\] | us-core-medicationrequest | 
| PRESCRIBING | rx_refills | MedicationRequest.dispenseRequest.numberOfRepeatsAllowed | us-core-medicationrequest | 
| PRESCRIBING | rx_days_supply | MedicationRequest.dispenseRequest.expectedSupplyDuration | us-core-medicationrequest | 
| PRESCRIBING | rx_frequency | MedicationRequest.dosageInstruction.timing | us-core-medicationrequest | 
| PRESCRIBING | rx_basis | MedicationRequest.intent | us-core-medicationrequest | 
| PRESCRIBING | rxnorm_cui | MedicationRequest.medicationCodeableConcept | us-core-medicationrequest | 
| PRESCRIBING | rx_dose_ordered | MedicationRequest.dosageInstruction.doseAndRate.dose\[x\] | us-core-medicationrequest | 
| PRESCRIBING | rx_dose_ordered_unit | MedicationRequest.dosageInstruction.doseAndRate.dose\[x\] | us-core-medicationrequest | 
| PRESCRIBING | rx_route | MedicationRequest.dosageInstruction.route | us-core-medicationrequest | 


## Procedures
| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| PROCEDURES | proceduresid | Procedure.id | us-core-procedure | 
| PROCEDURES | patid | Procedure.subject | us-core-procedure | 
| PROCEDURES | encounterid | Procedure.encounter | us-core-procedure | 
| PROCEDURES | enc_type | Procedure.encounter.class | us-core-procedure,us-core-encounter | 
| PROCEDURES | admit_date | Procedure.encounter.period | us-core-procedure,us-core-encounter | 
| PROCEDURES | providerid | Procedure.encounter.participant.individual.id | us-core-procedure,us-core-encounter,us-core-practitioner | 
| PROCEDURES | px_date | Procedure.performedDateTime | us-core-procedure | 
| PROCEDURES | px | Procedure.code | us-core-procedure | 
| PROCEDURES | px_type | Procedure.code | us-core-procedure | 
| PROCEDURES | px_source | Procedure.Extension (Proposed Name: data-source-type : CodeableConcept) | us-core-procedure | 
| PROCEDURES | ppx | Procedure.Extension (Proposed Name: principal-flag : Boolean) | us-core-procedure | 


## Provider
The CDMH IG did not provide mappings for the Provider PCORnet data elements. 

## Vital
| **PCORnet/CODI Table** | **PCORnet Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| VITAL | vitalid | Observation.id | observation-vitalsigns | 
| VITAL | patid | Observation.subject | observation-vitalsigns | 
| VITAL | encounterid | Observation.encounter | observation-vitalsigns | 
| VITAL | measure_date | Observation.effectiveDateTime | observation-vitalsigns | 
| VITAL | measure_time | Observation.effectiveDateTime | observation-vitalsigns | 
| VITAL | vital_source | Observation.Extension (Proposed Name: data-source-type : CodeableConcept) | observation-vitalsigns | 
| VITAL | ht | Observation.code,Observation.value\[x\] | observation-vitalsigns | 
| VITAL | wt | Observation.code,Observation.value\[x\] | observation-vitalsigns | 
| VITAL | systolic | Observation.code,Observation.value\[x\] | observation-vitalsigns | 
| VITAL | original_bmi | Observation.code,Observation.value\[x\] | observation-vitalsigns | 
| VITAL | bp_position | Observation.bodySite | observation-vitalsigns | 
| VITAL | smoking | Observation.code,Observation.value\[x\] | us-core-smokingstatus | 
| VITAL | tobacco | Observation.code,Observation.value\[x\] | us-core-observationresults | 
| VITAL | tobacco_type | Observation.code,Observation.value\[x\] | us-core-observationresults | 

# Ancillary Data Tables

## Alert
| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| ALERT | ALERTID
| ALERT | ALERT_PURPOSE
| ALERT | ALERT_TRIGGER
| ALERT | ALERT_FORM
| ALERT | SessionAlert


## Asset Delivery
| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| ASSET_DELIVERY | ASSET_DELIVERY_ID
| ASSET_DELIVERY | PATID
| ASSET_DELIVERY | PROGRAMID
| ASSET_DELIVERY | ASSET_PURPOSE
| ASSET_DELIVERY | DELIVERY_START_DATE
| ASSET_DELIVERY | DELIVERY_END_DATE
| ASSET_DELIVERY | DELIVERY_FREQ
| ASSET_DELIVERY | DELIVERY_FREQ_UNIT


## Curriculum Component
| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| CURRICULUM_COMPONENT | CURRICULUM_COMPONENT_ID
| CURRICULUM_COMPONENT | PROGRAMID
| CURRICULUM_COMPONENT | SESSION_INDEX
| CURRICULUM_COMPONENT | SESSION_FREQ
| CURRICULUM_COMPONENT | SESSION_FREQ_UNIT
| CURRICULUM_COMPONENT | SCREENING
| CURRICULUM_COMPONENT | COUNSELING
| CURRICULUM_COMPONENT | INTERVENTION_ACTIVITY
| CURRICULUM_COMPONENT | INTERVENTION_NUTRITION
| CURRICULUM_COMPONENT | INTERVENTION_NAVIGATION
| CURRICULUM_COMPONENT | DOSE
| CURRICULUM_COMPONENT | Session


## Family History
| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| FAMILY_HISTORY | FAMILY_HISTORY_ID
| FAMILY_HISTORY | PATID
| FAMILY_HISTORY | CONDITION
| FAMILY_HISTORY | CONDITION_TYPE
| FAMILY_HISTORY | RELATIONSHIP
| FAMILY_HISTORY | REPORT_DATE


## Program
| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| PROGRAM | PROGRAMID
| PROGRAM | PROGRAM_NAME
| PROGRAM | PROGRAM_DESCRIPTION
| PROGRAM | PROGRAM_SETTING
| PROGRAM | AFFILIATED_PROGRAMID
| PROGRAM | AIM_NUTRITION
| PROGRAM | AIM_ACTIVITY
| PROGRAM | AIM_WEIGHT
| PROGRAM | PRESCRIBED_TOTAL_DOSE
| PROGRAM | PRESCRIBED_PROGRAM_DURATION
| PROGRAM | PRESCRIBED_SESSION_FREQUENCY
| PROGRAM | PRESCRIBED_SESSION_LENGTH
| PROGRAM | LOCATION_ADDRESS
| PROGRAM | LOCATION_LATITUDE
| PROGRAM | LOCATION_LONGITUDE
| PROGRAM | LOCATION_GEOCODE
| PROGRAM | LOCATION_BOUNDARY_YEAR
| PROGRAM | LOCATION_GEOLEVEL
| PROGRAM | SESSION_OMISSION_PERCENT
| PROGRAM | SESSION_OMISSION_DESCRIPTION
| PROGRAM | SESSION_OMISSION_SYSTEMATIC
| PROGRAM | AssetDelivery
| PROGRAM | CurriculumComponent
| PROGRAM | Session


## Referral
| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| REFERRAL | REFERRALID
| REFERRAL | PATID
| REFERRAL | ENCOUNTERID
| REFERRAL | DIRECTION
| REFERRAL | REFERRAL_DATE
| REFERRAL | REFERRAL_STATUS
| REFERRAL | REFERRAL_PRIOR_AUTH
| REFERRAL | SOURCE_PROVIDERID
| REFERRAL | SOURCE_ORGANIZATION
| REFERRAL | DESTINATION_ORGANIZATION
| REFERRAL | DESTINATION_SPECIALTY


## Session
| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| SESSION | SESSIONID
| SESSION | PATID
| SESSION | ENCOUNTERID
| SESSION | PROVIDERID
| SESSION | PROGRAMID
| SESSION | SESSION_DATE
| SESSION | SESSION_MODE
| SESSION | SCREENING
| SESSION | COUNSELING
| SESSION | INTERVENTION_ACTIVITY
| SESSION | INTERVENTION_NUTRITION
| SESSION | INTERVENTION_NAVIGATION
| SESSION | DOSE
| SESSION | CURRICULUM_COMPONENT_ID
| SESSION | Alert


## Session Alert
| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| SESSION_ALERT | SESSION_ALERT_ID
| SESSION_ALERT | ALERTID
| SESSION_ALERT | SESSIONID
| SESSION_ALERT | ALERT_DATE
| SESSION_ALERT | ALERT_TIME


# VDW Data Tables
## Census Demog
| **VDW/CODI Table** | **VDW Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| CENSUS_DEMOG | BLOCK
| CENSUS_DEMOG | CENSUS_DATA_SRC
| CENSUS_DEMOG | GEOCODE
| CENSUS_DEMOG | CHORDS_GEOLEVEL
| CENSUS_DEMOG | STATE
| CENSUS_DEMOG | COUNTY
| CENSUS_DEMOG | TRACT
| CENSUS_DEMOG | BLOCKGP
| CENSUS_DEMOG | HOUSES_N
| CENSUS_DEMOG | RA_X
| CENSUS_DEMOG | HOUSES_X
| CENSUS_DEMOG | EDUCATION_N
| CENSUS_DEMOG | MEDFAMINCOME
| CENSUS_DEMOG | FAMINCOME_N
| CENSUS_DEMOG | MEDHOUSEINCOME
| CENSUS_DEMOG | HOUSINCOME_N
| CENSUS_DEMOG | POV_X
| CENSUS_DEMOG | X_SPEAKER
| CENSUS_DEMOG | ETC
| CENSUS_DEMOG | CENSUS_YEAR
| CENSUS_DEMOG | ZIP
| CENSUS_DEMOG | RURAL_URBAN_CODE
| CENSUS_DEMOG | CensusLocation


## Census Location
| **VDW/CODI Table** | **VDW Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| CENSUS_LOCATION | PERSON_ID
| CENSUS_LOCATION | LOC_START
| CENSUS_LOCATION | LOC_END
| CENSUS_LOCATION | GEOCODE
| CENSUS_LOCATION | GEOCODE_BOUNDARY_YEAR
| CENSUS_LOCATION | GEOLEVEL
| CENSUS_LOCATION | LATITUDE
| CENSUS_LOCATION | LONGITUDE


# OMOP Data Table

## Cost
| **OMOP/CODI Table** | **OMOP Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- | 
| COST | cost_id
| COST | person_id
| COST | cost_event_id
| COST | cost_event_field_concept_id
| COST | cost_concept_id
| COST | cost
| COST | incurred_date
| COST | billed_date
| COST | paid_date
