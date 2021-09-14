The CODI Research Data Model (RDM) provides the data tables and data elements needed to answer longitudinal research 
questions. The table below summarizes the major conceptual components of
the RDM. High priority data tables are required for a minimum CODI implementation. Medium
priority tables should only be implemented by data partners with the resources and local interest
to do so.

### CODI Data Priorities

| **Information about** | **Can be found in** | **Priority** | **Description** |
| --- | --- | --- | --- |
| The person | DEMOGRAPHIC | High | Includes demographic information about the person |
| Risk factors | FAMILY_HISTORY | Medium | Includes details about any family members’ health conditions |
| Clinical care | ENCOUNTER<br>DIAGNOSIS<br>LAB_RESULT_CM<br>PRESCRIPTION<br>PROCEDURE<br>PROVIDER<br>VITAL | High<br>High<br>High<br>High<br>High<br>High<br>High | Includes information about the person’s interactions with the healthcare delivery system |
| Weight-related interventions | PROGRAM<br>CURRICULUM_COMPONENT<br>SESSION<br>ASSET_DELIVERY | High<br>Medium<br>High<br>Medium | Includes details about intervention aims and settings (PROGRAM); how the interventions are structured (CURRICULUM_COMPONENT); who is administering the intervention and how (SESSION); if an asset (e.g., food, money) was provided (ASSET_DELIVERY) |
| Referrals | REFERRAL | Medium | Includes incoming and outgoing referrals within and across organizations |
| Clinical decision support | ALERT<br>SESSION_ALERT | Medium<br>Medium | Includes details about the types of clinical alerts (ALERT) and when they triggered (SESSION_ALERT) |
| Cost of care | COST | Low | Includes information about the amounts charged |
| Person’s location | CENSUS_LOCATION<br>CENSUS_DEMOG | High<br>High | Includes details about where the person has resided (CENSUS_LOCATION) and population-level demographic data about that location from the census (CENSUS_DEMOG) |

### CODI Roles
A data partner is an organization that participates in CODI by hosting data. Many data partners
will host their organization’s own data. In other cases (e.g., community health partners), the
organization that contributes data will rely on an intermediary data partner to host their data.

A data coordinating center is an organization with several responsibilities:
- It distributes research queries to data partners.
- It assembles the results from data partners into longitudinal records.
- It distributes reference tables to data partners.

The figure below shows how researchers interact with the data coordinating center, which distributes their
research queries to data partners. The data coordinating center assembles the results into
longitudinal records, which are sent to the researchers.

<img src="CODI_distributed_data_network.png" alt="CODI Distributed Data Network" width="100%"/>

The numbers in the figure above correspond to:
1. Researcher(s) formulates research a question using the data concepts and elements in the RDM and sends the question to the DCC
1. The DCC refines and distributes the query to the local clinical and community data partners using the PCORnet and PopMedNet infrastructure
1. Data partners receive, process, and return their query results to the DCC
1. The DCC assembles the partial query results into a longitudinal record using the patient Link_IDs
1. The longitudinal records are returned to the researcher

### Program and Curriculum Component Relationships
The RDM allows relationships among PROGRAMs and between PROGRAMs and CURRICULUM_COMPONENTs. Specifically, a PROGRAM 
can be a affiliated to another encompassing umbrella PROGRAM, and a PROGRAM can be comprised of many CURRICULUM_COMPONENTs. In
addition, these CURRICULUM_COMPONENTs can be ordered. In the CODI RDM this is defined as shown below.

| **CODI Table** | **CODI Data Element** | **Relationship Description** |
| -- | -- | -- |
| PROGRAM | AFFILIATED_PROGRAMID | A reference to the encompassing PROGRAM to which this PROGRAM is affiliated. |
| CURRICULUM_COMPONENT | PROGRAMID | A reference to the PROGRAM to which this CURRICULUM_COMPONENT belongs. |
| CURRICULUM_COMPONENT | SESSION_INDEX | An ordinal used to establish a total ordering on the sessions within a fixed curriculum. |

As shown in the table, an affiliated PROGRAM refers to the encompassing PROGRAM, and each curriculum component references the
PROGRAM to which it belongs. 

This FHIR IG reverses the direction of these references. The encompassing PROGRAM refers to the affiliated PROGRAM, and 
a PROGRAM refers to its CURRICULUM_COMPONENTs, as shown below. CURRICULUM_COMPONENTs are ordered 
implicitly by the ordering of the array that contains the action FHIR data elements -- the first action is the first 
curriculum component, and so on.

| **CODI Table** | **CODI Data Element** | **FHIR Data Element** | **FHIR Resource/Profile/Extension** | **Comments** | 
| -- | -- | -- | -- | -- |
| PROGRAM | AFFILIATED_PROGRAMID | action.definitionCanonical | CODIProgramProfile | Canonical reference from a encompassing to an affiliated PROGRAM |
| CURRICULUM_COMPONENT | PROGRAMID | action.definitionCanonical | CODIProgramProfile | Canonical reference from a PROGRAM to its CURRICULUM_COMPONENTs |
| CURRICULUM_COMPONENT | SESSION_INDEX | [implicit in ordering of action elements in PROGRAM] | CODIProgramProfile | The order of the action data elements in the PROGRAM defines the CURRICULUM_COMPONENT order |

### Value Sets
Value sets that are defined in the PCORnet CDM are inherited for use in CODI.

This IG defines six new value sets, described below. Two of the value sets, Interaction Type and Program Type, contain codes that are 
similar to what is in available in existing code sets, for example SNOMED CT. However, after investigation, 
it became apparent that available codes do not align exactly with the intent of the CODI RDM. A future update can address 
this issue and align the below value sets with existing code systems.

1. [Asset Type](ValueSet-AssetType.html) - The kinds of assets delievered in ASSET_DELIVERY.
1. [Direction Type](ValueSet-DirectionType.html) - The direction of a REFERRAL.
1. [Interaction Type](ValueSet-InteractionType.html) - The types of interactions for SESSIONs and CURRICULUM_COMPONENTs.
1. [Mode Type](ValueSet-ModeType.html) - The ways in which interventions can be delivered in SESSION.
1. [Program Type](ValueSet-ProgramType.html) - The aims of a PROGRAM.
1. [Setting Type](ValueSet-SettingType.html) - Whether intervention is from a clinical or community PROGRAM.

### Cleaning Expectations
In general, the CODI RDM should be populated with structured data extracted from the
EHR or other information technology (IT) systems, unless specified otherwise. For example,
data partners will not populate a data element in the RDM based on an analysis of free text, such
as a progress note, nor should they attempt to suppress implausible values. The intent is that any
data cleaning or inferences will be performed post-hoc by researchers based on their research
needs.

Exceptions to this general guidance are listed for specific data elements. For example, an
exception is made for the process-related data elements of the SESSION table. This exception
exists because only the data partner can determine which process steps necessarily follow from
observations recorded in their systems.

Mapping from a local codeset to a CODI codeset is anticipated and does not constitute data
cleaning. That is, data partners should map their codes to CODI.

### Missing Data
CDM uses the HL7 conventions for missing or unknown values; these rules will therefore apply
to the CODI ancillary tables as well:
- A data field that is not present in the source system uses a null value.
- If the source value is null or blank, CDM uses NI (no information).
- If the source value is an explicit unknown value, CDM uses UN (unknown).
- When the source value cannot be mapped to CDM, CDM uses OT (other).

### Reference Tables
With the RDM, there are three tables likely to not be populated from an EHR or another IT
system. These include ALERT, CENSUS_DEMOG, and PROGRAM. The CENSUS_DEMOG
table contains information from the Census Bureau. The data coordinating center (DCC) will
share this file with data partners using PopMedNet or a similar mechanism agreed upon with the
data partners.

The remaining two tables must be populated manually. Data partners are encouraged to populate
these tables with data provided manually as part of the extract–transform–load (ETL) process
that populates the remainder of the RDM. For example, these tables might be populated using a
series of SQL INSERT statements using explicit VALUEs instead of a SELECT statement. Data
partners are further encouraged to test referential integrity to ensure the primary keys for these
tables connect properly with the tables that reference them (such as SESSION and
SESSION_ALERT).

### Start Date
Each implementing network should establish a start date for that network. The start date
represents the earliest possible date for which data partners can reliably populate the CODI RDM. 
The start date is used in the [DEMOGRAPHIC table description of the Data Model](dataModel.html#demographic) 
page to describe how to implement tables in the CODI RDM.