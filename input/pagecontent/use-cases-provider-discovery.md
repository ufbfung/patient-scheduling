# Provider Discovery

## Overview

Provider discovery is a foundational capability in the patient scheduling
workflow. Patients and caregivers must be able to identify appropriate
healthcare providers based on a combination of clinical, logistical, and
personal constraints before scheduling an appointment.

This use case describes provider discovery as a **composite capability**
made up of multiple discovery dimensions. These dimensions may be implemented
independently and combined as needed by scheduling and directory systems.

---

## Actors and context

**Primary actors**
- Patient
- Caregiver

**Supporting systems**
- Provider directory
- Scheduling system
- Payer or network directory
- Care coordination or referral system

Provider discovery typically occurs before appointment booking, but may also
be revisited during care coordination, referrals, or re-scheduling workflows.

---

## Discovery dimensions

Provider discovery may involve one or more of the following dimensions:

- Clinical specialty or service
- Location and proximity
- Language and accessibility needs
- Insurance participation
- Appointment availability
- Ranking, sorting, and presentation of results

Each dimension below represents a distinct sub-use case with its own data,
interaction, and profiling considerations.

---

## Specialty and service filtering

Patients often begin provider discovery by searching for providers based on
a desired clinical specialty or healthcare service.

**User intent**
- Find providers capable of delivering a specific clinical service
- Restrict results to relevant specialties or subspecialties

**FHIR resources involved**
- Practitioner
- PractitionerRole
- HealthcareService
- Organization

**Key considerations**
- Specialties may be represented at varying levels of granularity
- Providers may offer different services at different locations
- Specialty coding systems may vary across implementations

**Profiling implications**
- PractitionerRole.specialty must be consistently populated
- Clear terminology expectations are required for specialty and service codes

---

## Location and proximity

Patients often need to discover providers based on geographic proximity
or care setting.

**User intent**
- Find providers near a specific address or region
- Restrict results to in-person or virtual care settings

**FHIR resources involved**
- Location
- PractitionerRole
- Organization

**Key considerations**
- Locations may represent physical sites or virtual endpoints
- Proximity calculations are typically performed outside FHIR
- Providers may practice at multiple locations

**Profiling implications**
- Location.address should be populated with sufficient granularity
- Clear linkage between PractitionerRole and Location is required

---

## Language and accessibility

Patients and caregivers may require providers who meet specific communication
or accessibility needs.

**User intent**
- Find providers who speak a preferred language
- Identify providers offering accessibility accommodations

**FHIR resources involved**
- Practitioner
- PractitionerRole
- HealthcareService

**Key considerations**
- Language preferences may apply to individual providers or care teams
- Accessibility attributes may be inconsistently captured today

**Profiling implications**
- Practitioner.communication should be supported
- Guidance is needed for representing accessibility features

---

## Insurance participation

Determining whether a provider accepts a patient’s insurance is a critical
step in provider discovery.

**User intent**
- Identify providers who participate in a specific plan or network
- Avoid discovering providers who are out-of-network

**FHIR resources involved**
- InsurancePlan
- Organization
- OrganizationAffiliation
- PractitionerRole

**Key considerations**
- Insurance participation data may be incomplete or out of date
- Acceptance may vary by location, service, or provider role
- Network relationships are often complex

**Profiling implications**
- Clear modeling guidance is needed for insurance acceptance
- Consistent identifiers for plans and networks are essential

---

## Availability and scheduling

Patients may prioritize providers based on near-term appointment availability
rather than provider attributes alone.

**User intent**
- Find the earliest available appointment
- Restrict availability to specific date or time windows

**FHIR resources involved**
- Schedule
- Slot
- PractitionerRole
- Location

**Key considerations**
- Schedules may be published at different levels of detail
- Slot availability may be generated dynamically
- Availability may differ by service or location

**Profiling implications**
- Slot.start, Slot.end, and Slot.status must be supported
- Consistent relationships between schedules, roles, and locations are required

---

## Ranking and presentation

Once providers are discovered, results are often ranked or filtered to support
decision-making.

**User intent**
- Sort providers by distance, availability, or other criteria
- View summarized provider information for comparison

**FHIR resources involved**
- Practitioner
- PractitionerRole
- Location
- HealthcareService

**Key considerations**
- Ranking logic is typically application-specific
- FHIR primarily supports data retrieval, not scoring

**Profiling implications**
- Profiles should support efficient querying and aggregation
- Display-oriented fields should be consistently populated

---

## Summary

Provider discovery is a multi-dimensional capability that underpins effective
patient scheduling. This IG treats provider discovery as a composite use case
composed of interoperable sub-use cases, each with distinct modeling and
profiling requirements.

Subsequent sections of this IG will reference these discovery dimensions when
defining FHIR profiles, terminology expectations, and interaction patterns.
