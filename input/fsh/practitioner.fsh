// ===============================================================
// Profile - SMART Practitioner
// ===============================================================

Profile: SMARTPractitioner
Parent: Practitioner
Id: smart-practitioner
Title: "SMART Practitioner"
Description: """
This profile sets minimum expectations for the Practitioner resource to enable SMART Schedule Links use cases
"""

// Align with US Core 6.1.0 
// https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-practitioner.html
* identifier 1..* // NPI, if available
* name 1..* MS
  * family 1..1 MS

// Align with proposed SMART Schedule Link
// https://github.com/Culby/smart-scheduling-links/blob/master/specification.md#practitioner-file
// * identifier MS // not required, but I think it should be to align with US Core
//   * use
//.  * system
//.  * value
* active MS
// * name MS // not required, but I think it should be to align with US Core
* telecom MS
* address MS

// Additional suggestions on top of US Core and SMART Schedule Link
* communication MS // to support communication, especially for non-english speakers
* gender MS // for patient-preference (e.g. preference for women doctors for gynecology)
* qualification MS // for patient preference on specialty or training (e.g. MD, DO, NP, PA)
