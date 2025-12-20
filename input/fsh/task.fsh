// ===============================================================
// Appointment Coordination - Task Types
// ===============================================================

CodeSystem: AppointmentCoordinationTaskTypeCS
Id: appointment-coordination-task-type
Title: "Appointment Coordination Task Type"
Description: "Task types used to classify coordination work related to appointments."
* ^status = #active
* ^content = #complete
* #book-appointment "Book appointment" "Initiate and track an appointment booking attempt (e.g., via portal deep link)."
* #arrange-transportation "Arrange transportation" "Coordinate transportation to/from an appointment."
* #complete-forms "Complete forms" "Complete or submit pre-visit forms."

ValueSet: AppointmentCoordinationTaskTypeVS
Id: appointment-coordination-task-type
Title: "Appointment Coordination Task Type ValueSet"
Description: "Allowed task types for AppointmentCoordinationTask.code."
* ^status = #active
* include codes from system AppointmentCoordinationTaskTypeCS


// ===============================================================
// Appointment Booking Outcome
// ===============================================================

CodeSystem: AppointmentBookingOutcomeCS
Id: appointment-booking-outcome
Title: "Appointment Booking Outcome"
Description: "Business outcome of an appointment booking attempt."
* ^status = #active
* ^content = #complete
* #booked "Booked" "Booking completed successfully."
* #cancelled "Cancelled" "Booking flow was cancelled by the user or coordinator."
* #entered-in-error "Entered in error" "Booking was created but later invalidated."
* #failed "Failed" "Booking did not complete and no appointment was created."

ValueSet: AppointmentBookingOutcomeVS
Id: appointment-booking-outcome
Title: "Appointment Booking Outcome ValueSet"
Description: "Allowed booking outcome values for AppointmentCoordinationTask.businessStatus."
* ^status = #active
* include codes from system AppointmentBookingOutcomeCS


// ===============================================================
// Profile - AppointmentCoordinationTask
// ===============================================================

Profile: AppointmentCoordinationTask
Parent: Task
Id: appointment-coordination-task
Title: "Appointment Coordination Task"
Description: """
A Task used by patient-facing applications to coordinate activities related to an appointment,
including booking, transportation, and completion of forms.

Task.code indicates the type of coordination task.
Task.status represents the lifecycle state of the task.
Task.businessStatus represents the business outcome for task types where an outcome is applicable
(e.g., booking attempts).

Task.intent is fixed to 'order' to indicate the task is actionable/authorized to proceed in the
context of the patient-facing application (not a clinician order).

Task.requester and Task.owner may reference the Patient, a RelatedPerson (caregiver), or an
Organization representing the patient-facing application/platform.
"""

// --- Core required elements ---
* status 1..1 MS

* intent 1..1 MS
* intent = #order

* code 1..1 MS
* code from AppointmentCoordinationTaskTypeVS (required)

* for 1..1 MS
* for only Reference(Patient)

* authoredOn 1..1 MS

// --- Business outcome (primarily used for booking tasks) ---
* businessStatus 0..1 MS
* businessStatus from AppointmentBookingOutcomeVS (extensible)

// --- Common coordination fields ---
* focus 0..1 MS
* focus only Reference(AppointmentCoordinationAppointment)

// --- App-facing requester/owner constraints ---
* owner 0..1 MS
* owner only Reference(Patient or RelatedPerson or Organization or Device)

* requester 0..1 MS
* requester only Reference(Patient or RelatedPerson or Organization or Device)

// --- Task outputs (confirmation, references, payloads) ---
* output 0..* MS
