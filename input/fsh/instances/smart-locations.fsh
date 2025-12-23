// from proposed SMART Scheduled FHIR IG
// https://github.com/Culby/smart-scheduling-links/blob/master/specification.md#example-location
Instance: BerkshireFamilyMedicine
InstanceOf: SMARTLocation
Usage: #example
* identifier.system = "https://healthsystem.example.com/facility-directory"
* identifier.value = "FAC-PITT-001"
* name = "Berkshire Family Medicine - Pittsfield"
* description = "Primary care clinic located in downtown Pittsfield"
* telecom[0].system = #phone
* telecom[=].value = "413-555-0123"
* telecom[+].system = #url
* telecom[=].value = "https://berkshirefamilymedicine.example.com"
* address.line = "173 Elm St"
* address.city = "Pittsfield"
* address.state = "MA"
* address.postalCode = "01201-7223"

// from SMART Scheduled FHIR IG
// https://github.com/smart-on-fhir/smart-scheduling-links/blob/master/specification.md#example-location
Instance: FlynnsPharmacy
InstanceOf: SMARTLocation
Usage: #example
* identifier.system = "https://cdc.gov/vaccines/programs/vtrcks"
* identifier.value = "CV1654321"
* name = "Flynn's Pharmacy in Pittsfield, MA"
* description = "Located behind old Berkshire Bank building"
* telecom[0].system = #phone
* telecom[=].value = "413-000-0000"
* telecom[+].system = #url
* telecom[=].value = "https://pharmacy.example.com"
* address.line = "173 Elm St"
* address.city = "Pittsfield"
* address.state = "MA"
* address.postalCode = "01201-7223"

// from SMART Scheduled FHIR IG + additional virtual representation
// https://github.com/smart-on-fhir/smart-scheduling-links/blob/master/specification.md#example-location
Instance: FamilyMedicinePractice
InstanceOf: SMARTLocation
Usage: #example
* identifier.system = "https://cdc.gov/vaccines/programs/vtrcks"
* identifier.value = "CV1654321"
* name = "Family Medicine Practice in Pittsfield, MA"
* description = "Family medicine clinic that offers in-person visits and virtual"
* telecom[0].system = #phone
* telecom[=].value = "413-000-0000"
* telecom[+].system = #url
* telecom[=].value = "https://pharmacy.example.com"
* address.line = "173 Elm St"
* address.city = "Pittsfield"
* address.state = "MA"
* address.postalCode = "01201-7223"

// means that this location ADDITIONALLY accepts virtual visits
* physicalType.coding[0].system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding[0].code = #vi
