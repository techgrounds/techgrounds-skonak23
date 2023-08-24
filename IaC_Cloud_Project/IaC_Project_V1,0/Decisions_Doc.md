## IaC Project - V1.0

### Deliverable 1

#### [Decisions_Documentation]

---------------------------------

This Documents lays out all the decisions that are made for the purpose of this Project. Setting up the fundamentals for the final Design. The requirements mentioned in the [Requirements_Doc] will be measured here and complemented by additional support and reasoning for decisions that are made for realizing this Epic.


#### *The requirements below will eventually be consolidated by removing any part that consists of assumptions. So a declarative document ready for implemention is the end goal here.*


**Storage Account**
- Considering our briefing, -general-purpose v2 account would be a viable choice.
- Managed Disks
- Blob Storage capabilities
- GRS redundancy (RA)
- Delete Locks to ensure no accedental losses
- PostDeploymentScript Storage Location

**Region/Zone**
- A single region will suffice
- 2 Availability Zones. A web server in Zone 2 (VNET1). A management (admin) Server in Zone 1 (Vnet2). (Might need correction)
- Two Vnets connected to eachother by a peering connection

**Virtual Networks (Vnets)**
- 2 in Total. 1 for Prod Environment. The other Man/Prod Environment
- Each Vnet consisting of 1 Subnet (/24)
- Vnet1 and Vnet2 are peered
- Both can be deployed in same resource group


**Subnets**
- 2 Subnets, one for each Vnet.
- subnet addresses: ```10.10.10.0/24``` and ```10.20.20.0/24```
- Secured by NSG for each subnet
- Both Subnets will have a public and private(subnet) endpoint IP


**Web Server**
- Deployed Automatically by scripts (custom?)
- Daily backups, 7 day Retention
- Deployed in Vnet-Prod (A Zone 2)
- Accessible via Public and private IP (endpoints)
- 24/7 Uptime (?)
- SSH -> Linux Enviroment (server)
- SSH/RDP webserver connections can only be established by Management Layer (Admin Server)

**Management Server**
- Deployed in Manage-prod-Vnet (A Zone 1)
- Accessible via Public and private IP (endpoints)
- Only Location from where the WebServer can be managed

**VM disks**
- General purpose v2
- Encrypted disks
- Managed 

**Key Vault**
- Azure Managed
- Keys stored for Webserver (+ Management?)
- RBAC -> Access allowed by Admin (owner) Role

**NSG**
- Subnet level Firewall
- Connections to Management Server only allowed for Trusted Locations (assign Admin role to Trusted IP)
