// ===============================================================
// Profile - SMART PractitionerRole
// ===============================================================

Profile: SMARTPractitionerRole
Parent: PractitionerRole
Id: smart-practitioner-role
Title: "SMART PractitionerRole"
Description: """
This profile sets minimum expectations for the PractitionerRole resource to enable SMART Schedule Links use cases
"""

// Align with US Core 6.1.0 
// https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-practitionerrole.html
* practitioner MS
* organization MS
* code MS
* specialty MS
* location MS
* healthcareService MS
* telecom MS
  * system 1..1 MS
  * value 1..1 MS
* endpoint MS

// Align with proposed SMART Schedule Link
// https://github.com/Culby/smart-scheduling-links/blob/master/specification.md#practitionerrole-file

* identifier MS
* active MS
* period MS
  * start MS
  * end MS
* practitioner MS
  * reference MS
  * display MS
* practitioner only Reference(SMARTPractitioner)
* organization MS
  * reference MS
  * display MS
* code MS
  * coding MS
    * system MS
    * code MS
    * display MS
* specialty MS
  * coding MS
    * system MS
    * code MS
    * display MS
* location MS
  * reference MS
  * display MS
* healthcareService MS
  * reference MS
  * display MS
* healthcareService only Reference(SMARTHealthcareService)
* telecom MS
  * system MS
  * value MS
* availableTime MS
  * daysOfWeek MS
  * allDay MS
  * availableStartTime MS
  * availableEndTime MS
* notAvailable MS
  * description MS
  * during MS
    * start MS
    * end MS

// Align with NDH
// https://build.fhir.org/ig/HL7/fhir-us-ndh/StructureDefinition-ndh-PractitionerRole.html
* specialty from http://hl7.org/fhir/us/ndh/ValueSet/IndividualAndGroupSpecialtiesVS (extensible)

// --- NDH alignment: require at least ONE NDH coding, allow others ---
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open

// Require at least one NDH coding slice
* code.coding contains 
    ndh 1..* MS and 
    other 0..* MS
* code.coding[ndh] from http://hl7.org/fhir/us/ndh/ValueSet/PractitionerRoleVS (required)
