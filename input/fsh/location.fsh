// ===============================================================
// Profile - SMART Location
// ===============================================================

Profile: SMARTLocation
Parent: Location
Id: smart-location
Title: "SMART Location"
Description: """
This profile sets minimum expectations for the Location resource to enable SMART Schedule Links use cases
"""

// Align with US Core 6.1.0 
// https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-location.html
* name 1..1 MS // only required field
* status MS
* telecom MS
* address MS
  * line MS
  * city MS
  * state MS
  * postalCode MS
  * district MS
* managingOrganization MS

// Align with SMART Schedule
// https://github.com/smart-on-fhir/smart-scheduling-links/blob/master/specification.md
// https://github.com/Culby/smart-scheduling-links/blob/master/specification.md
* identifier 1..* MS

* telecom 1..* MS
* telecom.system 1..1 MS
* telecom.value 1..1 MS

* address 1..1 MS
  * line 1..* MS
  * city 1..1 MS
  * state 1..1 MS
  * postalCode 1..1 MS
  * district MS
* description MS
* position MS
  * latitude MS
  * longitude MS

// Aspirational modeling
// Further enables a physical location to ALSO
// allow bookable slots that are virtual
// e.g. this location allows visits that are either in-person or virtual
// Bind to the expanded valueset from the expanded codesystem https://terminology.hl7.org/4.0.0/CodeSystem-location-physical-type.html
* physicalType 0..1 MS
* physicalType from http://terminology.hl7.org/ValueSet/location-physical-type (extensible)
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#vi

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

