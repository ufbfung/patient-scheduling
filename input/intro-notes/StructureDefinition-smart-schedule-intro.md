**Example usage scenarios:**

The following are example usage scenarios for this profile:
- Represent a schedule for healthcare services that is tied to a specific location
- Represent a schedule for healthcare services that is tied to specific practitioner, regardess of location
- Represent a schedule for healthcare services that is tied to a specific practitioner and location

## Mandatory and Must Support Data Elements

The following data elements must always be present (Mandatory) or must be supported if the data is present in the sending system (Must Support). These requirements are derived from the SMART Scheduling Links specification, aligned with US Core Schedule guidance, and adapted to support scheduling and coordination workflows.

**Each Schedule Must Have:**
- an actor
- a serviceType

**Each Schedule Must Support:**
- an actor that references a HealthcareService, PractitionerRole, or Location

**Additional Guidance for Implementers**

- **Virtual visits:** The 80/20 of schedules will represent an in-person visit and a Schedule with an actor.reference(Location) is expected. However, to accommodate virtual visits, we align with the idea that Locations in R5 can also be used to represent virtual/telemedicine visits and opt to profile Virtual Locations with location.physicalType=vi. Implementers can denote a Schedule offers in-person visits (default) and *additionally** virtual visits by using the SMART Location profile that requires address. Further, virtual-only visits can be specified by profiling against the Virtual Location profile.

- **HealthcareService:** In light of R5 promoting serviceType to be a codeableReference to HealthcareService, we'd suggest thinking of that as the primary 'healthcare service' field. Further, for R4 implementation, we'd suggest using Schedule.actor.reference(HealthcareService) as a way to represent Schedule.serviceType - which should also make it easier to transition from R4 to R5 in the future. (TODO - check FHIR version extensions)
