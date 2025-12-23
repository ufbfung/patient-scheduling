Instance: BrianKFungPharmD
InstanceOf: SMARTPractitioner
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1639876139"
* name.family = "Brian"
* name.given = "Fung"
* name.prefix = "PharmD, MPH"
* address.use = #work
* address.line = "2121 1ST ST SW APT 839"
* address.city = "Washington"
* address.state = "DC"
* address.postalCode = "20024"
* qualification[+].code.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0360"
* qualification[=].code.coding.code = #PharmD
* qualification[+].code.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0360"
* qualification[=].code.coding.code = #RPH
