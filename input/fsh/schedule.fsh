// ===============================================================
// Profile - SMART Schedule
// ===============================================================

Profile: SMARTSchedule
Parent: Schedule
Id: smart-schedule
Title: "SMART Schedule"
Description: """
This profile sets minimum expectations for the Schedule resource to enable SMART Schedule Links use cases
"""

// Required by base R4 Schedule
//* actor 1..* // for notes purposes; commented out so it doesn't impact diff

// No US Core profile for Schedule in 6.1.0
// https://hl7.org/fhir/us/core/STU6.1/

// Align with SMART Schedule Link
// https://github.com/smart-on-fhir/smart-scheduling-links/blob/master/specification.md#schedule-file
// https://github.com/Culby/smart-scheduling-links/blob/master/specification.md#schedule-file
// actor references location (like the original), but also the PractitionerRole
* actor.reference MS // original
* actor.display MS // from proposed
* serviceType 1..* MS // from both
* serviceType from CommonServiceTypesVS (preferred)

// * extensions
// both the original & proposed contain extensions
// somewhat disagree with usage of extensions here in the proposed
// serviceType can be treated as additional granularity; no extension needed
// vaccineCode COULD be used for an interim implementation until a larger one that represents the product

// Further constrain actors
* actor only Reference(SMARTLocation or SMARTPractitionerRole or VirtualLocation or SMARTHealthcareService)

// ===============================================================
// Profile - AppointmentCoordinationSchedule
// ===============================================================

Profile: AppointmentCoordinationSchedule
Parent: Schedule
Id: appointment-coordination-schedule
Title: "Appointment Coordination Schedule"
Description: """
A Schedule used for publishing availability in SMART Scheduling Links workflows.
This profile is intentionally flexible: schedule actor(s) may include practitioners,
roles, services, locations, and/or organizations depending on publisher capabilities.
"""

* active 1..1 MS

// We want schedules to be attributable to something/somewhere, but keep it flexible.
* actor 1..* MS

// Optional but commonly useful for search/display. Keep as MS, not required.
* serviceType 0..* MS
* specialty 0..* MS
* planningHorizon 0..1 MS
* comment 0..1 MS
