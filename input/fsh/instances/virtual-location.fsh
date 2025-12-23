// ===============================================================
// Example - Virtual Location
// ===============================================================
Instance: VirtualLocationExample
InstanceOf: VirtualLocation
Usage: #example

* id = "virtual-location-1"
* identifier[0].system = "https://healthsystem.example.com/facility-directory"
* identifier[0].value = "FAC-PITT-001"

* name = "Berkshire Family Medicine - Virtual"
* description = "Primary care clinic located in downtown Pittsfield"

* telecom[0].system = #phone
* telecom[0].value = "413-555-0123"
* telecom[1].system = #url
* telecom[1].value = "https://berkshirefamilymedicine.example.com"

* physicalType.coding[0].system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding[0].code = #vi
