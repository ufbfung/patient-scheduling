// Pharmacist
Instance: BrianKFungPharmD
InstanceOf: SMARTPractitioner
Description: "Pharmacist"
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

// Physician - MD - Family Medicine
Instance: JohnRobertSmithMD
InstanceOf: SMARTPractitioner
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1234567890"
* name.family = "Smith"
* name.given = "John"
* name.prefix = "MD"
* address.use = #work
* address.line = "173 Elm St"
* address.city = "Pittsfield"
* address.state = "MA"
* address.postalCode = "01201-7223"
* qualification[+].code.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0360"
* qualification[=].code.coding.code = #MD

// Physician - MD - Emergency Medicine
Instance: BrianLBachelderMD
InstanceOf: SMARTPractitioner
Description: "Emergency Medicine Physician"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1356439228"
* name.family = "Bachelder"
* name.given = "Brian"
* name.prefix = "MD"
* address.use = #work
* address.line = "5156 E Main St"
* address.city = "Columbus"
* address.state = "OH"
* address.postalCode = "43213"
* qualification[+].code.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0360"
* qualification[=].code.coding.code = #MD

// Nurse Practitioner
Instance: NancyRomeroFernandezAPRN
InstanceOf: SMARTPractitioner
Description: "Family Nurse Practitioner"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1932775590"
* name.family = "Romero Fernandez"
* name.given = "Nancy"
* name.prefix = "APRN, FNP-C, PMHNP-BC, PMHNP, MSN"
* address.use = #work
* address.line = "8391 W OAKLAND PARK BLVD"
* address.city = "Sunrise"
* address.state = "FL"
* address.postalCode = "33351"
* qualification[+].code.coding.system = "http://nucc.org/provider-taxonomy"
* qualification[=].code.coding.code = #363LF0000X // Nurse Practitioner - Family
* qualification[+].code.coding.system = "http://nucc.org/provider-taxonomy"
* qualification[=].code.coding.code = #363LP0808X // Nurse Practitioner - Psych/Mental Health
* qualification[+].code.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0360"
* qualification[=].code.coding.code = #MSN
