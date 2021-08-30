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
by hosting data — should interpret the CODI data tables. It assumes that data partners are
generally familiar with the Patient Centered Outcomes Research Network’s (PCORnet) Common
Data Model (CDM). It also provides best practices for addressing situations in which a data
partner may identify multiple ways to populate the CODI data models using local data.

## Base Models and Mapping

CODI utilizes the PCORnet Common Data Model (CDM) for standard clinical concepts. CODI also created ancillary tables 
developed specifically for CODI as a way to introduce new functionality into a PCORnet or PCORnet-compatible clinical data network. 
Lastly, CODI uses the "Cost" table from Observational Medical Outcomes Partnership (OMOP) CDM and two census tables 
from Colorado Health Observation Regional Data Service (CHORDS) Virtual Data Warehouse (VDW) for location and population-level demographics.

<img src="CODI_base_models.png" alt="CODI RDM Base Data Models" width="50%"/>

CODI builds on the [Common Data Models Harmonization (CDMH) FHIR Implementation Guide (IG)](http://hl7.org/fhir/us/cdmh/2019May/profiles.html) 
that maps the PCORnet and OMOP CDMs to the [FHIR US Core IG](http://hl7.org/fhir/us/core/index.html). This CODI FHIR IG, therefore, 
uses a mixture of US Core and base FHIR. The [Data Model](/dataModel.html) page details the mapping between the CODI RDM and FHIR.

## Value Sets

Value sets defined in the PCORnet CDM are inherited for use in CODI.

This IG defines six new value sets:
1. Asset Type
1. Direction Type
1. Interaction Type
1. Mode Type
1. Program Type
1. Setting Type

## MedMorph
The [Making EHR Data More Available for Research and Public Health (MedMorph) Reference Architecture Implementation Guide](http://hl7.org/fhir/us/medmorph/2021JAN/index.html) 
seeks to enable access to clinical data with a standardized architecture. The MedMorph IG is described as an "Reference Architecture IG" in that it provides 
a common framework for multiple public health and research use cases, including transactions, workflows, message triggers, and notifications. Additional 
Content IGs will be necessary to define requirements for specific use cases, including resource profiles, search parameters, and content-specific APIs. 
Examples of such use cases to be created in the future are the Electronic Case Reporting FHIR IG, Cancer Reporting IG, and HealchCare Survery IG.

The CODI IG could, in the future, exist as a MedMorph Content IG. MedMorph utilizes the US Core FHIR IG, which, as the basis of the CODI IG, would help to align 
CODI with MedMorph.

### CODI Data Marts in MedMorph
The MedMorph IG describes an architecture for [Research Use Cases](http://hl7.org/fhir/us/medmorph/2021JAN/researchusecases.html) in which an 
implementer of this CODI IG would act as a data mart. It describes the requirements for a data mart within the context of a [Research Data Extraction](http://hl7.org/fhir/us/medmorph/2021JAN/researchdataextraction.html#requirements-for-a-data-mart) 
and a [Research Data Query](http://hl7.org/fhir/us/medmorph/2021JAN/researchdataquery.html).

## SDOH and Gravity



## SDOH and PRAPARE

