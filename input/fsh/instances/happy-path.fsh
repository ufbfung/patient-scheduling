// ===============================================================
// Example Instances - Happy Path (SMART Scheduling Links)
// - Patient discovers availability (Schedule/Slot/Location)
// - Patient books a Slot -> Appointment created
// - Booking Task completes and points to the Appointment
// ===============================================================


// -----------------------------
// Patient (minimal example)
// -----------------------------
Instance: ExamplePatientJaneDoe
InstanceOf: Patient
Usage: #example
* id = "patient-jane-doe"
* name[0].family = "Doe"
* name[0].given[0] = "Jane"
* gender = #female
* birthDate = "1990-01-01"


// -----------------------------
// Location (destination)
// InstanceOf your profile: AppointmentCoordinationLocation
// -----------------------------
Instance: ExampleClinicLocation
InstanceOf: AppointmentCoordinationLocation
Usage: #example
* id = "loc-example-clinic"
* status = #active
* name = "Example Family Medicine Clinic"
* address.line[0] = "123 Main St"
* address.city = "Tampa"
* address.state = "FL"
* address.postalCode = "33602"
* telecom[0].system = #phone
* telecom[0].value = "813-555-0100"


// -----------------------------
// Schedule (published availability)
// InstanceOf your profile: AppointmentCoordinationSchedule
// Note: Schedule.actor cannot be Organization in R4.
// We'll point actor to Location (and optionally HealthcareService).
// -----------------------------
Instance: ExampleSchedulePrimaryCare
InstanceOf: AppointmentCoordinationSchedule
Usage: #example
* id = "sched-primary-care-1"
* active = true
* actor[0] = Reference(ExampleClinicLocation)
* serviceType[0].text = "Primary care"


// -----------------------------
// Slot (one available appointment window)
// InstanceOf your profile: AppointmentCoordinationSlot
// -----------------------------
Instance: ExampleSlot2026Jan12_0900
InstanceOf: AppointmentCoordinationSlot
Usage: #example
* id = "slot-2026-01-12-0900"
* schedule = Reference(ExampleSchedulePrimaryCare)
* status = #free
* start = "2026-01-12T09:00:00-05:00"
* end = "2026-01-12T09:30:00-05:00"
* comment = "30-minute new patient slot"


// -----------------------------
// Appointment (booked result)
// InstanceOf your profile: AppointmentCoordinationAppointment
//
// Notes:
// - slot is optional in your profile, but included here (happy path)
// - Location is represented as a participant.actor = Location
// - Patient is required as a participant slice
// - Identifier carries an app correlation token (e.g., bookingAttemptId)
// -----------------------------
Instance: ExampleAppointmentBooked
InstanceOf: AppointmentCoordinationAppointment
Usage: #example
* id = "appt-2026-01-12-0900-jdoe"
* status = #booked
* start = "2026-01-12T09:00:00-05:00"
* end = "2026-01-12T09:30:00-05:00"
* slot[0] = Reference(ExampleSlot2026Jan12_0900)

* participant[patient].status = #accepted
* participant[patient].actor = Reference(ExamplePatientJaneDoe)

* participant[location].status = #accepted
* participant[location].actor = Reference(ExampleClinicLocation)

* description = "Primary care visit"

// App correlation token (opaque) that lets you tie this Appointment back to the booking attempt/task
* identifier[0].system = "https://haau3.com/identifiers/booking-attempt"
* identifier[0].value = "ba_01JZ5Y7Y9VQ2K3M4N5P6Q7R8S9"


// -----------------------------
// Task (booking attempt) -> completed + outcome booked
// InstanceOf your profile: AppointmentCoordinationTask
//
// Notes:
// - intent fixed to #order by your profile
// - for = Patient
// - focus references the booked Appointment (recommended pattern in your IG)
// - businessStatus captures the booking outcome
// - requester/owner can be Patient, RelatedPerson, or Organization (per your profile)
// - output carries useful artifacts (e.g., deep link used, portal confirmation, opaque state)
// -----------------------------
Instance: ExampleTaskBookAppointmentCompleted
InstanceOf: AppointmentCoordinationTask
Usage: #example
* id = "task-book-appt-ba-01JZ5Y7Y9VQ2"
* status = #completed
* intent = #order

* code.coding[0].system = Canonical(AppointmentCoordinationTaskTypeCS)
* code.coding[0].code = #book-appointment
* code.text = "Book appointment"

* for = Reference(ExamplePatientJaneDoe)

* authoredOn = "2026-01-10T14:22:00-05:00"

// Link to the final appointment (key for navigation)
* focus = Reference(ExampleAppointmentBooked)

// Outcome of the booking attempt
* businessStatus.coding[0].system = Canonical(AppointmentBookingOutcomeCS)
* businessStatus.coding[0].code = #booked
* businessStatus.text = "Booked"

// Who initiated/owns the task (optional)
* requester = Reference(ExamplePatientJaneDoe)
* owner = Reference(ExamplePatientJaneDoe)

// Outputs (optional examples)
// 1) Opaque state/correlation token (what you called “state”)
// 2) Deep link used to book
// 3) Provider portal confirmation/reference id (if returned)
* output[0].type.text = "booking-state"
* output[0].valueString = "ba_01JZ5Y7Y9VQ2K3M4N5P6Q7R8S9"

* output[1].type.text = "booking-deeplink"
* output[1].valueUrl = "https://provider.example.org/scheduling/book?slot=slot-2026-01-12-0900&state=ba_01JZ5Y7Y9VQ2K3M4N5P6Q7R8S9"

* output[2].type.text = "provider-confirmation-id"
* output[2].valueString = "CONF-4839201"
