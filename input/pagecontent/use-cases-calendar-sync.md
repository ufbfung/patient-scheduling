## Overview

Calendar synchronization enables patients and caregivers to discover
appointment times that work for all participants involved in care.
This use case combines **provider availability** with **patient and
caregiver availability** to surface mutually available time slots and
support appointment booking.

This IG models availability for providers, patients, and caregivers
using a common abstraction: **FHIR Schedule and Slot resources**.
Participant schedules are typically derived from external calendar
systems but are represented in FHIR to enable interoperable matching,
reasoning, and automation.

---

## Actors and context

**Primary actors**
- Patient
- Caregiver

**Supporting systems**
- Provider directory and scheduling system
- Patient-facing application
- External calendar systems (e.g., consumer calendars)

Calendar sync occurs prior to appointment booking and may involve one
or more participants beyond the patient, such as caregivers or care
coordinators.

---

## Preconditions

- Provider availability is published and accessible
- Patient and/or caregiver calendars are available
- Time zones are known or resolvable for all participants
- Consent exists to process calendar availability

---

## User intent

- View available appointment times that work for all participants
- Identify the earliest mutually available slot
- Compare multiple future time options
- Book an appointment once a suitable slot is identified

From a patient-facing application, this is typically presented as a
guided scheduling experience rather than a raw calendar view.

---

## Availability as a shared abstraction

This IG treats **availability** as a shared concept across all actors.

- Providers expose availability through published schedules and slots
- Patients and caregivers expose availability through derived schedules
  and slots created from external calendars

Using the same FHIR resources for all participants enables consistent
matching and extensibility.

---

## Provider availability

Provider availability is modeled using core FHIR scheduling resources
and is typically sourced from scheduling systems or directory feeds.

**FHIR resources**
- Location
- Schedule
- Slot

**Key semantics**
- Provider Schedules represent bookable contexts
- Slots represent discrete bookable time windows
- Slot.status indicates availability without exposing appointment details

This model aligns with SMART Scheduling Links, which enables bulk
publication and retrieval of Location, Schedule, and Slot resources.

---

## Patient and caregiver availability

Patient and caregiver availability is derived from external calendar
systems and represented using FHIR scheduling resources.

**FHIR resources**
- Schedule (per participant)
- Slot (busy or unavailable time windows)

**Key semantics**
- Participant Schedules represent personal availability contexts
- Slots typically represent **busy** or **unavailable** time periods
- Slot.status is used to indicate non-availability

These resources are not intended to replace external calendars, but to
provide a normalized, privacy-preserving representation of availability
constraints for scheduling.

---

## Multiple participant coordination

Calendar sync may involve multiple participants, including:
- Patient
- One or more caregivers

Each participant contributes availability constraints through their
own Schedule and Slot resources. Mutually available times are computed
by intersecting provider availability with participant constraints.

This approach scales naturally as additional participants are added.

---

## Matching and overlap computation

The process of identifying mutually available times typically follows
these steps:

1. Retrieve provider Slots for a given service, location, and time range
2. Retrieve participant Slots representing unavailable time windows
3. Compute overlapping windows where:
   - Provider Slot is available
   - All participant Slots are free
4. Rank or filter results based on user preferences

This matching logic is typically implemented outside of FHIR but relies
on standardized FHIR representations as inputs.

---

## Appointment booking

Once a mutually available slot is selected:

- An Appointment is created referencing the selected Slot
- Participant Schedules and Slots may be updated to reflect the booking
- Confirmation is presented to the patient and caregivers

This IG does not prescribe a specific booking mechanism but assumes
standard Appointment creation workflows.

---

## AI-assisted scheduling

Calendar sync provides a foundation for AI-assisted scheduling
experiences.

Examples include:
- Proposing the earliest mutually available appointment
- Suggesting alternative times when conflicts arise
- Voice-based scheduling interactions

In all cases, AI-driven interactions result in explicit user
confirmation and standard Appointment creation.

---

## Privacy considerations

Calendar data may include sensitive personal information.

Implementations should ensure:
- Only availability data is shared, not event details
- External calendar content is minimized and normalized
- Participant consent is obtained and respected

---

## Summary

Calendar sync enables patient-centered scheduling by aligning provider
availability with patient and caregiver calendars. By modeling all
availability using Schedule and Slot resources, this IG establishes a
consistent, interoperable foundation for scheduling, coordination, and
future automation.

This approach supports current scheduling workflows while enabling
advanced experiences such as multi-participant coordination and
AI-assisted booking.
