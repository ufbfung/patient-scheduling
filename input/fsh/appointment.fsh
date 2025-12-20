// ===============================================================
// Profile - AppointmentCoordinationAppointment
// ===============================================================

Profile: AppointmentCoordinationAppointment
Parent: Appointment
Id: appointment-coordination-appointment
Title: "Appointment Coordination Appointment"
Description: """
A patient-facing representation of an appointment used for coordination workflows
(transportation, forms, etc.).

This profile supports two creation patterns:
1) Manual appointments created by patients/caregivers (Appointment.slot may be absent).
2) Appointments derived from scheduling publishers (Appointment.slot SHOULD be present when known).
"""

// --- Core appointment facts ---
* status 1..1 MS
* start 1..1 MS
* end 0..1 MS
* minutesDuration 0..1 MS

// --- Optional SMART Scheduling Links alignment ---
// Slot references are optional to support manual appointment creation,
// but SHOULD be used when appointments are derived from published availability.
* slot 0..* MS
* slot only Reference(AppointmentCoordinationSlot)

// --- Participants ---
// Require at least one participant and a Patient participant slice
* participant 1..* MS
* participant.actor 1..1 MS
* participant.status 1..1 MS

* participant ^slicing.discriminator.type = #type
* participant ^slicing.discriminator.path = "actor"
* participant ^slicing.rules = #open
* participant contains
    patient 1..1 MS and
    location 0..* MS and
    caregiver 0..* MS and
    provider 0..* MS

* participant[patient].actor only Reference(Patient)
* participant[location].actor only Reference(Location)
* participant[caregiver].actor only Reference(RelatedPerson)
* participant[provider].actor only Reference(Practitioner or PractitionerRole or HealthcareService)

// --- Identifiers for external portal appointment ids (optional) ---
* identifier 0..* MS
* identifier.system 0..1 MS
* identifier.value 0..1 MS

// --- Optional context fields ---
* description 0..1 MS
* reasonCode 0..* MS
* serviceType 0..* MS
* appointmentType 0..1 MS
