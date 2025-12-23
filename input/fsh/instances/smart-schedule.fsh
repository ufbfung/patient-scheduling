// from proposed SMART Scheduled FHIR IG
// https://github.com/Culby/smart-scheduling-links/blob/master/specification.md#example-schedule

// ---------------------------------------------------------------
// 1) Typical in-person visits: physical Location + PractitionerRole
// ---------------------------------------------------------------
Instance: InPersonScheduleWithPractitioner
InstanceOf: SMARTSchedule
Description: "In-person visits at Berkshire Family Medicine with Dr. John Robert Smith (via PractitionerRole)."
Usage: #example
* serviceType[+] = $service-type#124 "General Practice"
* serviceType[+] = $service-type#554 "Chronic Disease Management"
* actor[0] = Reference(BerkshireFamilyMedicine) "Berkshire Family Medicine - Pittsfield"// physical location
* actor[+] = Reference(JohnRobertSmithMDRole) "John Robert Smith, MD"// practitioner role
* extension.url = "http://fhir-registry.smarthealthit.org/StructureDefinition/specialty"
* extension.valueCoding = $sct#394802001 "General medicine"

// ---------------------------------------------------------------
// 2) Hybrid visits: physical Location + VirtualLocation + PractitionerRole
//    (means appointments could be in-person OR virtual)
// ---------------------------------------------------------------
Instance: HybridInPersonAndVirtualScheduleWithPractitioner
InstanceOf: SMARTSchedule
Usage: #example
Description: "Visits offered both in-person and virtual with Dr. John Robert Smith."

* serviceType = $service-type#124 "General Practice"
* actor[0] = Reference(BerkshireFamilyMedicine)     // in-person
* actor[+] = Reference(VirtualLocationExample)      // virtual
* actor[+] = Reference(JohnRobertSmithMDRole)       // practitioner role

// A schedule with ONLY virtual visits
Instance: VirtualSchedule
InstanceOf: SMARTSchedule
Usage: #example
* serviceType = $service-type#124 "General Practice"
* actor[0] = Reference(VirtualLocationExample)
* actor[+] = Reference(JohnRobertSmithMDRole)

// ---------------------------------------------------------------
// 3) Outpatient radiology center: physical Location + specific service for MRI
// ---------------------------------------------------------------
Instance: MRI
InstanceOf: SMARTSchedule
Description: "MRI services at Outpatient Radiology Services."
Usage: #example
* serviceType[+] = $service-type#211
* actor[0] = Reference(OutpatientRadiologyServices) "Outpatient Radiology Services"

// ---------------------------------------------------------------
// 4) Outpatient radiology center: physical Location + specific service for Ultrasound
// ---------------------------------------------------------------
Instance: Ultrasound
InstanceOf: SMARTSchedule
Description: "Ultrasound services at Outpatient Radiology Services."
Usage: #example
* serviceType[+] = $service-type#210
* actor[0] = Reference(OutpatientRadiologyServices) "Outpatient Radiology Services"

// ---------------------------------------------------------------
// 5) Outpatient radiology center: physical Location + specific service for Diagnostic Radiology/Xray/CT/Fluroscopy
// ---------------------------------------------------------------
Instance: DiagnosticRadiology
InstanceOf: SMARTSchedule
Description: "Diagnostic Radiology/Xray/CT/Fluroscopy services at Outpatient Radiology Services."
Usage: #example
* serviceType[+] = $service-type#209
* actor[0] = Reference(OutpatientRadiologyServices) "Outpatient Radiology Services"
