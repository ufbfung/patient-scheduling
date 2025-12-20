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
