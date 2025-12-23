Alias: $sct = http://snomed.info/sct

Instance: JohnRobertSmithMD
InstanceOf: SMARTPractitionerRole
Usage: #example
* identifier[0].system = "https://healthsystem.example.com/practitioner-role-directory"
* identifier[=].value = "ROLE-12345"
* identifier[+].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "1234567890"
* active = true
* period.start = "2020-01-01"
* practitioner = Reference(Practitioner/doc-smith) "Dr. John Robert Smith"
* organization = Reference(Organization/berkshire-family-medicine) "Berkshire Family Medicine"
* code = $sct#309343006 "Physician"
* specialty = $sct#394802001 "General medicine"
* location = Reference(BerkshireFamilyMedicine) "Berkshire Family Medicine - Pittsfield"
* telecom[0].system = #phone
* telecom[=].value = "413-555-0123"
* telecom[+].system = #email
* telecom[=].value = "appointments@berkshirefamilymedicine.example.com"
* availableTime.daysOfWeek[0] = #mon
* availableTime.daysOfWeek[+] = #tue
* availableTime.daysOfWeek[+] = #wed
* availableTime.daysOfWeek[+] = #thu
* availableTime.daysOfWeek[+] = #fri
* availableTime.availableStartTime = "09:00:00"
* availableTime.availableEndTime = "17:00:00"