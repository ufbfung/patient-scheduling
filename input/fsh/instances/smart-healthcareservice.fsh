Instance: AnnualWellnessVisit
InstanceOf: SMARTHealthcareService
Description: "Annual wellness visit"
Usage: #example

* active = true
* category = http://terminology.hl7.org/CodeSystem/ndh-healthcare-service-category#outpat
* type.text = "Annual wellness visit"
* specialty.text = "Primary care"
* location = Reference(BerkshireFamilyMedicine) "Berkshire Family Medicine - Pittsfield"
* name = "Annual wellness visit"

// Radiology - MRI
Instance: MRIRadiology
InstanceOf: SMARTHealthcareService
Description: "MRI Radiology"
Usage: #example

* active = true
* category = http://terminology.hl7.org/CodeSystem/ndh-healthcare-service-category#outpat
* type.coding.system = $service-type
* type.coding.code = #211
* specialty.coding.system = "http://nucc.org/provider-taxonomy"
* specialty.coding.code = #261QM1200X
* location = Reference(OutpatientRadiologyServices) "Outpatient Radiology Services"
* name = "Magnetic Resonance Imaging (MRI)"

// Radiology - Ultrasound
Instance: UltrasoundRadiology
InstanceOf: SMARTHealthcareService
Description: "Ultrasound Radiology"
Usage: #example

* active = true
* category = http://terminology.hl7.org/CodeSystem/ndh-healthcare-service-category#outpat
* type.coding.system = $service-type
* type.coding.code = #210
* specialty.coding.system = "http://nucc.org/provider-taxonomy"
* specialty.coding.code = #261QM1200X
* location = Reference(OutpatientRadiologyServices) "Outpatient Radiology Services"
* name = "Ultrasound Radiology"
