// from proposed SMART Scheduled FHIR IG
// https://github.com/Culby/smart-scheduling-links/blob/master/specification.md#example-schedule
Alias: $service-type = http://terminology.hl7.org/CodeSystem/service-type
Alias: $sct = http://snomed.info/sct

Instance: 456
InstanceOf: SMARTSchedule
Usage: #example
* serviceType = $service-type#124 "General Practice"
* actor[0] = Reference(BerkshireFamilyMedicine)
* actor[+] = Reference(JohnRobertSmithMD)
* extension.url = "http://fhir-registry.smarthealthit.org/StructureDefinition/specialty"
* extension.valueCoding = $sct#394802001 "General medicine"


// A schedule with ONLY virtual visits
Instance: VirtualSchedule
InstanceOf: SMARTSchedule
Usage: #example
* serviceType = $service-type#124 "General Practice"
* actor[0] = Reference(VirtualLocationExample)
* actor[+] = Reference(JohnRobertSmithMD)
