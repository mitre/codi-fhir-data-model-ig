## Introduction
As part of the Centers for Disease Control and Prevention’s (CDC) efforts to promote health,
prevent disease, injury, and disability, and prepare for emerging health threats, the Division of
Nutrition, Physical Activity, and Obesity; and Center for Surveillance, Epidemiology, and
Laboratory Services partnered with the CMS Alliance to Modernize Healthcare federally funded
research and development center (Health FFRDC) for the Clinical and Community Data Initiative
(CODI). CODI will expand the ability to capture, standardize, integrate, and query existing
patient-level electronic health record (EHR) and community data via a common data model.
CODI augments existing standard data models with information about weight-related
interventions and social factors to create the CODI Research Data Model (RDM).

This document describes how CODI data partners — those organizations that participate in CODI
by hosting data — should interpret the CODI RDM when using FHIR. It assumes that data partners are
generally familiar with the Patient Centered Outcomes Research Network’s (PCORnet) Common
Data Model (CDM). It also provides best practices for addressing situations in which a data
partner may identify multiple ways to populate the CODI RDM using local data.

## Base Models and Mapping

CODI's RDM utilizes the PCORnet Common Data Model (CDM) for standard clinical concepts. 
CODI also created ancillary tables developed specifically for CODI as a way to introduce new functionality 
into a PCORnet or PCORnet-compatible clinical data network. Lastly, CODI uses the "Cost" table from 
Observational Medical Outcomes Partnership (OMOP) CDM and two census tables from Colorado Health Observation 
Regional Data Service (CHORDS) Virtual Data Warehouse (VDW) for location and population-level demographics.

<img src="CODI_base_models.png" alt="CODI RDM Base Data Models" width="50%" style="float: none"/>

Given the use of publicly available data models, CODI builds on the [Common Data Models Harmonization (CDMH) FHIR Implementation Guide (IG)](http://hl7.org/fhir/us/cdmh/2019May/profiles.html), 
which maps the PCORnet and OMOP CDMs to the [FHIR US Core IG](http://hl7.org/fhir/us/core/index.html). By leveraging the mappings provided by 
CDMH, a significant portion of the CODI RDM can be mapped to US Core. This CODI FHIR IG maps the RDM to a 
mixture of base FHIR resources, US Core profiles, and CODI-specific profiles derived from both base FHIR as well as US Core. 
The [Data Model](/dataModel.html) page details the full mapping between the CODI RDM and FHIR.

## Value Sets

Value sets defined in the PCORnet CDM are inherited for use in CODI.

This IG defines six new value sets:
1. [Asset Type](ValueSet-AssetType.html) - enumerates the kinds of assets a DEMOGRAPHIC might receive.
1. [Direction Type](ValueSet-DirectionType.html) - enumerates the direction of a REFERRAL.
1. [Interaction Type](ValueSet-InteractionType.html) - enumerates the types of interactions for SESSIONs and CURRICULUM_COMPONENTs.
1. [Mode Type](ValueSet-ModeType.html) - enumerates the ways in which interventions can be delivered in SESSION.
1. [Program Type](ValueSet-ProgramType.html) - enumerates the aims of a PROGRAM.
1. [Setting Type](ValueSet-SettingType.html) - enumerates whether intervention is from a clinical or community PROGRAM.

## Other Relevant FHIR Implemmentation Guides
This IG describes how data relevant to the CODI project may be represented as a set of FHIR resources. The broader functionality of operating a distributed health data network for research or surveillance is covered through functionality in the The [Making EHR Data More Available for Research and Public Health (MedMorph) Reference Architecture Implementation Guide](http://hl7.org/fhir/us/medmorph/2021JAN/index.html).

As the CODI project evolves, the RDM will grow to accomidate other domains of interest. Of particular interest is the area of Social Determinants of Health (SDoH), which are currently being addressed through the [HL7 Gravity Project](https://www.hl7.org/gravity/).

### MedMorph
MedMorph seeks to enable access to clinical data with a standardized architecture. The MedMorph IG is described as an "Reference Architecture IG" in that it provides
a common framework for multiple public health and research use cases, including transactions, workflows, message triggers, and notifications. Additional
Content IGs will be necessary to define requirements for specific use cases, including resource profiles, search parameters, and content-specific APIs.

The CODI IG could, in the future, exist as a [MedMorph Content IG](http://hl7.org/fhir/us/medmorph/2021JAN/background.html#relationship-between-medmorph-ig-and-content-implementation-guides). 
MedMorph utilizes the US Core FHIR IG, which, as the basis of the CODI IG, would help to align CODI with MedMorph.

#### CODI Data Owners/Partners in MedMorph
The MedMorph IG describes an architecture for [Research Use Cases](http://hl7.org/fhir/us/medmorph/2021JAN/researchusecases.html) in which an implementer of this CODI IG would act as a Data Mart. It describes the requirements for a Data Mart within the context of a [Research Data Extraction](http://hl7.org/fhir/us/medmorph/2021JAN/researchdataextraction.html#requirements-for-a-data-mart)
and a [Research Data Query](http://hl7.org/fhir/us/medmorph/2021JAN/researchdataquery.html).

While the requirements for a Data Mart in a Research Data Query provide the option of responding to queries through ANSI SQL, it is expected that implementers of this IG would provide support for FHIRPath and/or CQL to maximize the use of FHIR-based infrastructure. By using FHIR-based tools, it is possible to reduce the burden on Data Marts, especially ones that have FHIR-enabled electronic health record systems. Further, CODI End Users will not have to worry about differences in SQL databases / permissions between Data Marts when executing queries.

### Gravity
At the time of creation of this IG, the CODI RDM does not have the ability to represent SDoH information. 
The RDM is being updated and upon completion, those changes will be represented in a new version 
of this IG.

At the time of creation of this IG, the underlying CODI Data Model does not have the ability to represent SDoH information. The data model is being updated and upon completion, those changes will be represented in a new version of this IG.

It is expected that concepts from the [Gravity SDOH Clinical Care IG](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/) 
will be incorporated into this IG. Specifically, profiles of 
[Condition](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Condition.html) and 
[Observation](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationScreeningResponse.html) 
may be used to represent some SDoH related information.

Finally, it is expected that the Gravity project will create value sets for particular SDoH domains, 
such as food insecurity. Those value sets will be incorporated into this IG, once they are available.

#### PRAPARE and Other SDoH Screeners
CODI Implementers may be interested in information collected through SDoH screeners, such as 
[Protocol for Responding to and Assessing Patients’ Assets, Risks, and Experiences (PRAPARE)](https://www.nachc.org/research-and-data/prapare/). 
Implementers may use the [Survey Instrument Support](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/survey_instrument_support.html) 
provided by the SDOH Clinical Care IG to translate screener responses directly into FHIR resources. 
Future versions of this IG may provide instructions for users of the underlying CODI RMD so that they 
can translate screener responses, stored in the PCORnet `PRO_CM` table into FHIR resources, in a manner 
similar to the [mapping instructions provided by the SDOH Clinical Care IG](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/mapping_instructions.html).
