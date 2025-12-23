// ===============================================================
// Profile - SMART HealthcareService
// ===============================================================

Profile: SMARTHealthcareService
Parent: HealthcareService
Id: smart-healthcare-service
Title: "SMART Healthcare Service"
Description: """
This profile sets minimum expectations for the Healthcare Service resource to enable SMART Schedule Links use cases
"""

// align with SMART
* active 1.. MS
* type 1.. MS
* specialty 1.. MS
* location 1.. MS
* name 1.. MS

// align with NDH
// https://build.fhir.org/ig/HL7/fhir-us-ndh/StructureDefinition-ndh-HealthcareService.html
* category 1..* MS
* category from http://hl7.org/fhir/us/ndh/ValueSet/HealthcareServiceCategoryVS
* providedBy MS // we can use this to find all services provided by a specific organization
* location MS // we can use this to find all services provided at a specific location
