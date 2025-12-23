// ===============================================================
// Profile - Virtual Location
// ===============================================================

Profile: VirtualLocation
Parent: Location
Id: virtual-location
Title: "Virtual Location"
Description: """
This profile sets minimum expectations for the Virtual Location resource to enable SMART Schedule Links use cases
"""

// Align with US Core 6.1.0 
// https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-location.html
* name 1..1 MS // only required field
* status MS
* telecom MS

// remove suggestions for address
// since this is virtual
//* address MS
//  * line MS
//  * city MS
//  * state MS
//  * postalCode MS
* managingOrganization MS

// Align with SMART Schedule
// https://github.com/smart-on-fhir/smart-scheduling-links/blob/master/specification.md
// https://github.com/Culby/smart-scheduling-links/blob/master/specification.md
* identifier 1..* MS

* telecom 1..* MS
* telecom.system 1..1 MS
* telecom.value 1..1 MS

* description MS

// Virtual locations SHOULD NOT require a physical address.
// Implementers MAY populate address if needed for internal workflows,
// but clients SHOULD NOT assume address is present.
// * address 1..1 MS
//* position MS
//  * latitude MS
//  * longitude MS

// Aspirational modeling
// Represent a virtual location for virtual visits
// Bind to the expanded valueset from the expanded codesystem https://terminology.hl7.org/4.0.0/CodeSystem-location-physical-type.html
* physicalType 1..1 MS
* physicalType from http://terminology.hl7.org/ValueSet/location-physical-type (extensible)
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#vi
