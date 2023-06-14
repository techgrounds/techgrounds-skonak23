# NTW-06 - Subnetting

In this Assigment we will take a deeper dive into the concept of Subnetting.

Subnetting is a technique used in computer networking to divide a large network into smaller, more manageable parts called subnets. Each subnet consists of a range of IP addresses that can be assigned to devices within that subnet.

When subnetting, we use a subnet mask to determine the network and host portions of an IP address. The subnet mask is a sequence of numbers, usually represented in dotted decimal notation, that specifies the network size and identifies the host portion of an IP address. 

Subnetting enables the creation of private and public subnets. A private subnet is typically used for internal network devices, such as computers, printers, and servers, and is not directly accessible from the internet. On the other hand, a public subnet allows devices to have direct internet connectivity.



## Key-terms

- [x] <strong>Subnet</strong> -> 
- [x] <strong>Subnet Mask</strong> -> Reveals how many bits in the ip address are used for the network by "masking" the network portion of the IP address. 
- [x] <strong>Default Gateway</strong> -> A device (e.g. Router) that let's devices from one network, communicate with devices on another network. (In this context, "Default" means that the designated device is the first option that's looked upon when data needs to exit the network.)
- [x] <strong>CIDR</strong> (Classless Inter-Domain Routing) ->
- [x] <strong>Host Address</strong> -> the last Octet of an IP-address e.g. 192.168.1.**128**
- [x] <strong>Network address</strong> -> The first three Octets of an IP-address e.g. **192.168.1**.0  
- [x] <strong>Host Address</strong> -> The last Octet of an IP-address e.g. 192.168.1.**128**

- [x] <strong>Network ID</strong> -> First IP-address in each Subnet 
- [x] <strong>Broadcast ID</strong> -> Last IP-address in each Subnet. It allows each Host to communicate to every other host within the subnet. So when a packet is send to the "Broadcast ID" every host receives that packet.

"Network ID" and "Broadcast ID" are not allowed to be assigned to a host who's receiving an IP adress within the ip-block.




## Requirements

- [x] https://app.diagrams.net/
- [x] Subnet calculator



## Tasks

- Create a network architecture that meets the following requirements:

- [x] 1 private subnet that can only be reached from within the LAN. This subnet must be able to accommodate a minimum of 15 hosts.
- [x] 1 private subnet that has internet access through a NAT gateway. This subnet must be able to place at least 30 hosts (the 30 hosts does not include the NAT gateway).
- [x] Change the private IP address of your phone into the private IP your laptop uses. What happens then?
- [x] 1 public subnet with an internet gateway. This subnet must be able to place at least 5 hosts (the 5 hosts does not include the internet gateway).


### Sources used

| Bron        | Beschrijving |
| ----------- | ----------- |
| https://www.subnetting.net/Tutorial.aspx | Guide into Subnetting |
| https://www.youtube.com/watch?v=s_Ntt6eTn94 | Subnet Mask - Explained |




### Problems experienced

None.


### Result(s)
*Below you will find the images showing the results along with their descriptions*









