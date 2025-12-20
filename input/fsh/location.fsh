// ===============================================================
// Profile - AppointmentCoordinationLocation
// ===============================================================

Profile: AppointmentCoordinationLocation
Parent: Location
Id: appointment-coordination-location
Title: "Appointment Coordination Location"
Description: """
A Location used in SMART Scheduling Links workflows and downstream coordination
(e.g., transportation). This profile keeps location requirements light to enable
broad adoption while supporting practical consumer needs (display + routing).
"""

* status 0..1 MS
* name 0..1 MS

// Address is strongly useful for patient-facing apps (routing/transportation).
// Keep it MS, not required, because some publishers may only provide a name/identifier initially.
* address 0..1 MS

// Helpful contact/routing fields. Keep MS only.
* telecom 0..* MS
* position 0..1 MS

// Optional classification
* type 0..* MS
* managingOrganization 0..1 MS
