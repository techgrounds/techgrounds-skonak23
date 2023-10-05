# USER_STORIES - V1.1

This document consists of the user stories for project version 1.1


---
| Requirement  |Improve security by preventing direct access to the web server from the internet. |
|---|---|
|Epic   |v1.1   |
|Description   | The client wishes to implement a proxy server to act as an intermediary between internet users and the web server.  |
|Deliverable   | Provide Infrastructure-as-Code (IaC) for configuring the proxy server. |

---
| Requirement  | Ensure that all connections are encrypted using HTTPS. |
|---|---|
|Epic   |v1.1   |
|Description   | Automatically upgrade HTTP connections to HTTPS when users connect through the load balancer. |
|Deliverable   | Provide Infrastructure-as-Code (IaC) for configuring automatic HTTPS upgrade for all HTTP connections. |
---

| Requirement  | Establish a secure connection meeting TLS 1.2 or higher security standards.|
|---|---|
|Epic   |v1.1   |
|Description   | The connection should be protected using TLS 1.2 or a more advanced version.|
|Deliverable   | Provide Infrastructure-as-Code (IaC) for implementing and configuring TLS 1.2 or higher. |
---

| Requirement  | The web servers must function correctly. Potential issues need to be identified quickly.|
|---|---|
|Epic   |v1.1   |
|Description   | Implement a regular system of 'health checks' for the web server.’.|
|Deliverable   | Provide Infrastructure-as-Code (IaC) for implementing and configuring a health check system for the VM Scaleset. |

---

| Requirement  | Minimize downtime and automatically recover the web server in case of failures. |
|---|---|
|Epic   |v1.1   |
|Description   |  If the web server fails a health check, it should be automatically restored to a working state.|
|Deliverable   |  Provide Infrastructure-as-Code (IaC) for configuring an automatic recovery system for the web server. |
---


| Requirement  | Ensure the ability to handle increased traffic without service interruptions. |
|---|---|
|Epic   |v1.1   |
|Description   | Implement an autoscaling system that temporarily deploys additional servers under sustained load, with a maximum of three servers.|
|Deliverable   | Provide Infrastructure-as-Code (IaC) for configuring and implementing the autoscaling system.|