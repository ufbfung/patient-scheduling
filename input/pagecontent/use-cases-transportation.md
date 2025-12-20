# Transportation

## Overview

Transportation is a critical enabling capability for patient scheduling.
Even when an appointment is successfully booked, patients may be unable
to attend without reliable transportation to and from the appointment.

This use case focuses on enabling patients or caregivers to request,
schedule, and track transportation for an **existing future appointment**
using patient-facing applications. Transportation is treated as a
workflow step that occurs after appointment scheduling and is tightly
linked to the appointment context.

---

## Actors and context

**Primary actors**
- Patient
- Caregiver

**Supporting systems**
- Scheduling system
- Care coordination platform
- Transportation service provider (e.g., rideshare or transportation vendor)

Transportation workflows are typically initiated by a patient or caregiver
and fulfilled by an external transportation service.

---

## Preconditions

- A future appointment exists
- The patient’s pickup address is known
- The appointment location, date, and time are known
- The patient or caregiver has consent to request transportation

---

## User intent

- Request transportation for a scheduled appointment
- Schedule transportation in advance
- Track the status of the transportation request
- Receive updates related to pickup and drop-off

From a patient-facing application perspective, this is commonly exposed as
a single action, such as **“Request transportation”**, on an appointment
detail view.

---

## Transportation as a workflow

Transportation is modeled as a **requested service** with a corresponding
**fulfillment workflow**.

Rather than embedding transportation details directly within the
Appointment resource, this IG treats transportation as a separate but
linked workflow that references the appointment.

---

## FHIR resources involved

### Appointment

The appointment serves as the anchor for the transportation workflow and
provides:
- Appointment date and time
- Destination location
- Participating patient and caregivers

---

### ServiceRequest (Transportation request)

A transportation request is represented using **ServiceRequest** to
indicate that transportation is being ordered for a patient.

**Key semantics**
- The ServiceRequest represents the intent to provide transportation
- The ServiceRequest references the appointment it supports

**Key elements**
- `ServiceRequest.subject` → Patient
- `ServiceRequest.code` → transportation service
- `ServiceRequest.occurrenceDateTime` or `occurrencePeriod` → pickup window
- `ServiceRequest.basedOn` or `supportingInfo` → Appointment reference
- `ServiceRequest.status` → active

---

### Task (Transportation fulfillment)

The fulfillment and lifecycle of the transportation request is represented
using **Task**.

Task is used to track operational states such as scheduling, assignment,
and completion without repeatedly modifying the ServiceRequest.

**Key semantics**
- The Task represents fulfillment of the transportation request
- External transportation systems may update Task status over time

**Key elements**
- `Task.basedOn` → ServiceRequest
- `Task.for` → Patient
- `Task.focus` → Appointment (optional)
- `Task.status` → requested | accepted | in-progress | completed | cancelled
- `Task.identifier` → external transportation request or trip identifier

---

### Location (Pickup and destination)

Transportation workflows require clear identification of:
- Pickup location
- Destination location

**Destination**
- Typically derived from the Appointment’s associated Location

**Pickup**
- Often the patient’s home address
- May alternatively reference a Location resource if pickup differs

---

## External transportation services

Transportation fulfillment is commonly performed by external services,
such as rideshare or transportation vendors.

When integrating with external transportation APIs:
- External trip or request identifiers SHOULD be stored as Task identifiers
- Status updates from external systems SHOULD be reflected in Task.status
- Additional operational details MAY be recorded in Task.note or Task.output

FHIR is used to model intent, context, and state—not to replace external
transportation APIs.

---

## State transitions

A typical transportation workflow may follow this progression:

1. ServiceRequest created (transportation requested)
2. Task created (transportation fulfillment initiated)
3. Task accepted or scheduled by transportation service
4. Task in-progress (ride underway)
5. Task completed or cancelled

This IG does not prescribe a specific state machine but recommends using
Task.status to reflect high-level workflow state.

---

## Privacy and consent considerations

Transportation requests may involve sharing patient identifiers, pickup
locations, and appointment timing with external vendors.

Implementations should ensure:
- Appropriate patient consent
- Minimum necessary data disclosure
- Compliance with applicable privacy regulations

---

## Summary

Transportation is an essential post-scheduling capability that enables
patients to attend scheduled appointments. This IG models transportation
as a workflow linked to an existing appointment, using ServiceRequest to
represent intent and Task to represent fulfillment.

By separating transportation from appointment scheduling while maintaining
explicit linkage, this approach supports interoperable, patient-centered
transportation workflows without constraining integration with external
transportation services.
