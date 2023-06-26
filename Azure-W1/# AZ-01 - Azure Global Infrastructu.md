# AZ-01 - Azure Global Infrastructure

In this Assigment we will take a deeper dive into the concept of Azure Global Infrastructure

Azure Global Infrastructure is a powerful and expansive network of data centers strategically placed around the world to provide robust and reliable cloud services. These data centers are organized into geographical regions, which act as separate physical locations where Azure services are hosted.

Within each region, there are Availability Zones that offer additional fault tolerance and high availability. Availability Zones are physically separate data centers within the same region, connected by high-speed and low-latency networks. These zones are designed to operate independently, meaning that if one zone experiences an outage, the others continue to function, ensuring continuity.

Azure also employs the concept of Region Pairs. Region Pairs consist of two regions within the same geography. These regions are paired to provide data replication and disaster recovery capabilities. In the event of a major disruption or natural disaster affecting one region, services can fail over to the paired region, ensuring minimal downtime and data loss.

## Key-terms

- [x] <strong>Regions</strong> -> geographic area on the planet, containing at least one, but potentially multiple data centers.
- [x] <strong>Availability Zones</strong> -> Physically seperate locations within the region.  a minimum of three separate availability zones are present in all availability zone-enabled regions.
- [x] <strong>Region Pairs</strong> -> relationship between 2 Azure Regions within the same geographic region for disaster recovery purposes. If one of the regions were to experience a disaster or failure, then the services in that region will automatically failover to that regions secondary region in the pair.

**Why would you choose one region over another**
The choice of region would depend on your specific needs. 
Your decision could depend on the following considerations:
- Available services 	-> Select the services you need for your workload
- Capacity		-> Each region has a maximum capacity. A region's maximum capacity might affect what types of subscriptions can deploy what types of services and under what circumstances.
- Constraints		-> Constraints are placed on the deployment of services in certain regions. For example, some regions are available only for backup or failover.
- Sovereignty		-> Certain regions are dedicated to specific sovereign entities. Although all regions are Azure regions, these sovereign regions are isolated from the rest of Azure. They aren't necessarily managed by Microsoft, and they might be restricted to certain types of customers. (eg. Azure China 21Vianet, Azure Government-US).

### Sources used

| Source        | Description |
| ----------- | ----------- |
| https://www.youtube.com/watch?v=Q-VYtWajJ4E | Azure Regions & Availability Zones |
| https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview | MS Learn article on regions and availability zones |
| https://build5nines.com/azure-region-pairs-explained/ | Region Pairs Explained |
| https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/migrate/azure-best-practices/multiple-regions | Azure regions decision guide |



