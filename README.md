# CODI FHIR IG

As part of the Centers for Disease Control and Prevention’s (CDC) efforts to promote health, prevent disease, injury, and disability, and prepare for emerging health threats, the Division of Nutrition, Physical Activity, and Obesity; and Center for Surveillance, Epidemiology, and Laboratory Services partnered with the CMS Alliance to Modernize Healthcare federally funded research and development center (Health FFRDC) for the [Clinical and Community Data Initiative (CODI)](https://www.cdc.gov/obesity/initiatives/codi/community-and-clinical-data-initiative.html). CODI will expand the ability to capture, standardize, integrate, and query existing patient-level electronic health record (EHR) and community data via a common data model. CODI augments existing standard data models with information about weight-related interventions and social factors to create the [CODI Research Data Model (RDM)](https://github.com/mitre/codi/blob/main/CODI%20Data%20Model%20Implementation%20Guide.pdf).

This document describes how CODI data partners — those organizations that participate in CODI by hosting data — should interpret the CODI Data Model when using FHIR. It assumes that data partners are generally familiar with the [Patient Centered Outcomes Research Network’s (PCORnet) Common Data Model (CDM)](https://pcornet.org/data/). It also provides best practices for addressing situations in which a data partner may identify multiple ways to populate the CODI data models using local data.

This Implementation Guide is written using [FHIR Shorthand](http://hl7.org/fhir/uv/shorthand/). See the [SUSHI documentation](https://fshschool.org/docs/sushi/) for instructions on building this IG.

## Notice

Copyright 2022 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 22-0042