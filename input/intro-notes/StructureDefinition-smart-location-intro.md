**Example usage scenarios:**

The following are example usage scenarios for this profile:
- Represent a physical booking location that patients can schedule appointments

## Mandatory and Must Support Data Elements

The following data elements must always be present (Mandatory) or must be supported if the data is present in the sending system (Must Support). These requirements are derived from the SMART Scheduling Links specification, aligned with US Core Location guidance, and adapted to support scheduling and coordination workflows.

**Each Location Must Have:**
- a name  
- at least one identifier  
- an address  
- at least one telecom contact point  

**Each Location Must Support:**
- description  
- position (latitude and longitude)  
- managingOrganization  

**Additional Guidance for Implementers**

- **Telecom (Contact Information):** Each Location **must** include at least one telecom contact point representing general consumer-facing contact information (e.g., front desk or location website). Publishers **should** include both: a phone number (`telecom.system = phone`) and a URL (`telecom.system = url`). Additional contact systems (e.g., email, fax) may be included when available. Client applications should prefer phone and URL contact points when present and gracefully handle other contact systems.

- **Identifiers**: Each Location must include at least one identifier. Publishers may include  organization-specific identifiers (e.g., facility codes, site numbers) and/or external registry identifiers when applicable. No single identifier system is treated as universally required by this profile. Test tooling or implementation guides may introduce additional expectations for specific use cases.
- **Address and Jurisdiction** Locations are expected to represent physical service locations. The address element should contain a complete USPS-style address, including state and postal code. While jurisdictional or state-level metadata may be expressed at the dataset or manifest level in some workflows, clients may also infer jurisdiction from the Location address when needed.
