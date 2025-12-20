## Introduction

This FHIR Implementation Guide (IG) was developed as a contribution to the
[Patient Scheduling track](https://confluence.hl7.org/spaces/FHIR/pages/403865700/2026+-+01+Patient+Scheduling)
in preparation for the
[January 2026 HL7 FHIR Connectathon 41](https://hl7.my.site.com/LightningMemberPortal/s/lt-event?id=a1YVM00000O7lfV2AR).

The guide explores how modern FHIR-based workflows can better support
patient- and caregiver-facing scheduling experiences, with a particular focus on
coordination across discovery, booking, and downstream logistics.

---

## Scope and purpose

This IG is intentionally **aspirational**. Rather than defining a single prescribed
implementation, it documents a set of interoperable use cases and modeling patterns
that aim to streamline the **end-to-end patient scheduling journey**, including:

- discovering appropriate providers and services
- identifying mutually available time slots
- booking or manually recording appointments
- coordinating tasks among patients, caregivers, and applications
- supporting logistics such as transportation and pre-visit preparation

The guide is designed to align with and extend emerging efforts such as
SMART Scheduling Links, while remaining flexible enough to support manual workflows
and incremental adoption.

---

## Use cases

The following use cases describe the core scheduling and coordination scenarios
addressed by this IG:

| Use case | What it enables |
|--|--|
| [Provider discovery](use-cases-provider-discovery.html) | Find providers based on specialty, location, language, availability, and other constraints |
| [Calendar sync](use-cases-calendar-sync.html) | Discover and reconcile available appointment slots across providers, patients, and caregivers |
| [Appointments](use-cases-appointments.html) | Capture booked or manually created appointments as the anchor for coordination workflows |
| [Task assignment](use-cases-task-assignment.html) | Assign and track scheduling-related tasks among patients, caregivers, and applications |
| [Transportation](use-cases-transportation.html) | Coordinate transportation to and from appointments based on appointment context |

---

## Architectural approach

Across these use cases, the IG emphasizes a small set of core principles:

- **Appointments as coordination anchors**  
  Appointments represent the central object around which downstream activities
  (transportation, forms, caregiver actions) are coordinated, regardless of how
  the appointment was created.

- **Tasks for orchestration and accountability**  
  Scheduling-related work (booking attempts, transportation arrangement, form
  completion) is modeled using Task resources to enable assignment, tracking,
  and outcome capture.

- **SMART-compatible, not SMART-dependent**  
  Where available, published schedules and slots (e.g., via SMART Scheduling Links)
  are leveraged. Where not available, manual entry and local coordination remain
  fully supported.

- **Patient- and caregiver-facing first**  
  The modeling choices reflect the needs of consumer-facing applications, while
  remaining compatible with provider systems and future integrations.

---

## What this IG does not attempt to solve

This guide does not attempt to standardize:
- billing or claims workflows
- clinical documentation beyond scheduling context
- transportation vendor APIs or contracting models
- full EHR portal authentication or authorization flows

Those concerns are intentionally out of scope to keep the focus on interoperable
scheduling and coordination patterns.

---

## Audience

This IG is intended for:
- FHIR implementers exploring patient-facing scheduling workflows
- SMART Scheduling Links contributors and adopters
- application developers building caregiver or consumer health tools
- standards contributors interested in coordination-oriented modeling

---
