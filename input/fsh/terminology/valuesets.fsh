// ===============================================================
// ValueSet: Subset of HL7 service-type for better illustration
// ===============================================================

ValueSet: CommonServiceTypesVS
Id: common-service-types-vs
Title: "Common Service Types for Scheduling"
Description: """
A subset of the HL7 service-type codes and possibly other code systems
to illustrate the more common service types that patients may
want to schedule appointments for. Ideally, this would be based on utilization
data and usually 1:1 with serviceType:schedule if the procedures can be performed
independently of each other (e.g. 2 x-ray machines, 2 CT machines, 3 MRI machines and the
schedule represents a pool of image technicians that can perform any of these procedures, 
but are limited by the actual, physical machines). These also may likely be more limited by 
both the technician/practitioner and the physical machine.  
Conversely, if a provider (e.g. family medicine physician) can perform multiple
types of services (e.g. annual wellness visit, follow-up visit, chronic disease management, etc)
then it's appropriate to use serviceType to represent multiple services. 
"""
* ^status = #draft
* ^experimental = true

// HL7 service-type subset
// dental
* include $service-type#88  "General Dental"
// general medicine
* include $service-type#124 "General Practice"
* include $service-type#554 "Chronic Disease Management"
// radiology
* include $service-type#209 "Diagnostic Radiology/Xray/CT/Fluoroscopy"
* include $service-type#210 "Diagnostic Ultrasound"
* include $service-type#211 "Magnetic Resonance Imaging (MRI)"
* include $service-type#212 "Nuclear Medicine"
* include $service-type#213 "Obstetric & Gynaecological Ultrasound"
// immunizations
* include $service-type#57  "Immunization"

// SNOMED CT
* include $sct#396540005 "Phlebotomy"
