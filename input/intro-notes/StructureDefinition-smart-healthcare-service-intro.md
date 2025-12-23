**Example usage scenarios:**

The following are example usage scenarios for this profile:
- Represent a healthcare service provided by an organization or healthcare provider

## Mandatory and Must Support Data Elements

The following data elements must always be present (Mandatory) or must be supported if the data is present in the sending system (Must Support). Aligns closely with [NDH HealthcareService profile](https://build.fhir.org/ig/HL7/fhir-us-ndh/StructureDefinition-ndh-HealthcareService.html). 

**Each HealthcareService Must Have:**
- active status
- a category
- a type
- a specialty
- last updated instant
- 

**Each HealthcareService Must Support:**
- organization that provides this service
- type of service that may be delivered or performed
- specialties handled by this service
- location(s) of where service is performed
- name of service, as presented to the consumer
- location(s) the service is intended for/available to
- endpoint 
