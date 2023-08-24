## IaC Project - V1.0

### Deliverable 1

#### [Requirements]

----------------------------------

This documents shows an overview of the requirements which have been set by the Company and forwarded to the development team by the Product Owner.

As a team, it is important to us that we have a clear understanding of what this project requires from us. Therefore a descriptive documentation of our assignment for this project should lay out our first Deliverable.

---------------------------------

#### List of requirements provided by PO

The following list needs to be complemented by input from the team and from information gathered throughout the project. (This includes briefings with the PO)

- All VM disks must be encrypted.
- The webserver should be backed up daily. The backups should be retained for 7 days.
- The webserver must be installed in an automated manner.
- The admin/management server should be accessible with a public IP.
- The admin/management server should only be accessible from trusted locations (office/admin’s home).
- The following IP ranges are used: ``` 10.10.10.0/24 & 10.20.20.0/24 ```
- All subnets should be protected by a subnet-level firewall.
- SSH or RDP connections to the webserver are only allowed to be established from the admin server.
- Feel free to propose or implement improvements in the architecture, but make definitive choices to meet the deadline.

----------------------------------------------------

#### Requirements complemented after Project Exploration & Briefing with PO

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















