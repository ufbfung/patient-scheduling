// ===============================================================
// Profile - AppointmentCoordinationSlot
// ===============================================================

Profile: AppointmentCoordinationSlot
Parent: Slot
Id: appointment-coordination-slot
Title: "Appointment Coordination Slot"
Description: """
A Slot used for publishing discrete availability windows in SMART Scheduling Links workflows.
Slots reference a Schedule and carry the time window and free/busy status.
"""

// Slot MUST reference a schedule for consumers to understand context.
* schedule 1..1 MS
* schedule only Reference(AppointmentCoordinationSchedule)

// Core slot facts needed for discovery/booking
* status 1..1 MS
* start 1..1 MS
* end 1..1 MS

// Optional but useful; keep MS only
* overbooked 0..1 MS
* comment 0..1 MS

// If your ecosystem will publish appointment types / services at the slot level,
// you can add MS here later without breaking anything.
