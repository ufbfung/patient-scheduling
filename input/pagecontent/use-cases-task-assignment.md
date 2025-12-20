## Overview

Task assignment enables coordinated follow-through after an appointment
has been scheduled. While scheduling determines *when* and *where* care
occurs, task assignment determines *who* is responsible for ensuring the
patient is prepared and able to attend.

This use case focuses on assigning ownership of post-scheduling tasks to
patients, caregivers, or care team members to support appointment success.

---

## Actors and context

**Primary actors**
- Patient
- Caregiver

**Supporting systems**
- Patient-facing application
- Care coordination platform
- Scheduling system

Task assignment typically occurs after an appointment is booked and may
continue through the appointment date and beyond.

---

## Preconditions

- A future appointment exists
- One or more caregivers may be involved
- The patient or caregivers can accept task assignments
- Consent exists to share and assign responsibilities

---

## User intent

- Assign responsibility for appointment-related tasks
- Clearly identify who owns each task
- Track progress and completion
- Reassign tasks when needed

From a patient-facing application, task assignment enables shared
responsibility across caregivers while maintaining clarity and
accountability.

---

## Tasks as the coordination mechanism

This IG models appointment-related responsibilities using **Task**
resources.

Each task represents a discrete unit of work required to support a
scheduled appointment and is explicitly assigned to an owner.

Tasks are linked to an appointment but are managed independently of the
appointment lifecycle.

---

## FHIR resources involved

### Appointment

The appointment provides the context for task assignment, including:
- Date and time
- Location
- Patient

Tasks reference the appointment they support but do not modify it.

---

### Task (Assigned work)

Tasks represent appointment-related responsibilities.

**Key semantics**
- Each task has a single owner
- Multiple tasks may be associated with a single appointment
- Tasks progress independently

**Key elements**
- `Task.focus` → Appointment
- `Task.for` → Patient
- `Task.owner` → Patient, RelatedPerson, or Practitioner
- `Task.code` → type of task
- `Task.status` → requested | accepted | in-progress | completed | cancelled

---

### RelatedPerson (Caregivers)

Caregivers responsible for tasks are represented using **RelatedPerson**.

RelatedPerson resources enable:
- Explicit caregiver identity
- Relationship to the patient
- Assignment and reassignment of tasks

---

### ServiceRequest (Optional)

When a task represents fulfillment of a service (e.g., transportation,
home services, referrals), a ServiceRequest may be used to represent the
intent, with the Task representing execution.

This pattern enables consistency across workflows that involve external
services.

---

## Common appointment-related tasks

Examples of tasks that may be assigned after scheduling include:

- Coordinate transportation
- Upload insurance documentation
- Complete intake or consent forms
- Manage appointment payments or copays
- Confirm appointment attendance
- Accompany patient to the appointment

These tasks may be generated automatically or created manually.

---

## Task ownership and reassignment

Tasks are explicitly owned by a single individual at any given time.

- Ownership is expressed via `Task.owner`
- Tasks may be reassigned if the original owner is unavailable
- Task history may be preserved for audit and coordination

This approach avoids assigning ownership at the appointment level and
supports flexible, shared caregiving models.

---

## Task lifecycle

A typical task lifecycle may include:

1. Task created (requested)
2. Task accepted by owner
3. Task in progress
4. Task completed or cancelled

The IG does not prescribe a rigid workflow but recommends using Task
status to reflect progress.

---

## Automation and AI-assisted coordination

Task assignment provides a foundation for automation and AI-assisted
care coordination.

Examples include:
- Automatically generating tasks after appointment booking
- Suggesting task owners based on caregiver roles or availability
- Voice-based task confirmation or updates

All automated actions should result in explicit Task creation or updates
and remain visible to patients and caregivers.

---

## Privacy and consent considerations

Task assignment may involve sharing sensitive appointment details and
responsibilities.

Implementations should ensure:
- Appropriate consent for caregiver involvement
- Clear visibility into assigned responsibilities
- Minimum necessary disclosure of patient information

---

## Summary

Task assignment enables effective coordination after appointment
scheduling by explicitly assigning responsibility for appointment-related
activities.

By modeling responsibilities as Task resources linked to appointments,
this IG supports flexible caregiving models, clear ownership, and
extensible automation without overloading the Appointment resource.
