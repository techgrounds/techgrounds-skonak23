# SEC-08 - Detection, response and analysis

In this Assigment we will take a deeper dive into the concept of phases and steps that are followed when systems get hit with an attack -> 'Detection, response and analysis'. These processes are integral for identifying and mitigating potential threats, minimizing damage, and ensuring a swift recovery in the event of an attack.

Detection involves the use of tools such as Intrusion Detection Systems (IDS) to monitor and log network traffic. By promptly detecting anomalies, you can take  measures to investigate and respond to potential threats.

Response is the phase where actions are taken to address the identified threats. This includes using Intrusion Prevention Systems (IPS) that actively block or contain malicious activities. Timely and effective response helps minimize the extent of damage caused by the attack.

Analysis involves a thorough examination of the attack, its methods, and its impact. It is crucial for understanding the attack vectors, improving security measures, and implementing mitigations to prevent (similar) incidents in the future.


## Key-terms

- [x] <strong>systems hardening</strong> -> the process of securing a computer system by implementing various measures, such as removing unnecessary services, applying security patches, configuring strict access controls, and implementing best practices, to reduce vulnerabilities and enhance overall system security.
- [x] <strong>Intrusion Detection Systems (IDS)</strong> -> a security tool or software that monitors network traffic and system activities to detect and alert potential unauthorized access attempts, malicious activities helping to protect against security breaches and intrusions.
- [x] <strong>Intrusion Prevention Systems (IPS)</strong> ->  a security solution that actively monitors network traffic and takes immediate action to prevent potential security threats. It works by analyzing and blocking malicious activities, unauthorized access attempts, and suspicious behavior in real-time, providing an additional layer of defense to protect against network-based attacks.
- [x] <strong>Recovery Point Objective (RPO)</strong> -> a metric used in disaster recovery planning that defines the maximum acceptable amount of data loss in the event of a system failure or disruption. It specifies the point in time to which data must be recovered to ensure business continuity.
- [x] <strong>Recovery Time Objective (RTO)</strong> -> metric used in disaster recovery planning that represents the maximum acceptable downtime or duration within which a system or service should be restored after a disruption or failure.
- [x] <strong>Disaster Recovery (in IT)</strong> -> a portfolio of policies, tools, and processes used to recover or continue operations of critical IT infrastructure, software, and systems after a natural or human-made disaster
- [x] <strong>Automatic failover</strong> -> a resource that allows a system administrator to automatically switch data handling to a standby system in the event of system compromise



## Tasks

- [x] Case 1. A Company makes daily backups of their database. The database is automatically recovered when a failure happens using the most recent available backup. The recovery happens on a different physical machine than the original database, and the entire process takes about 15 minutes. What is the RPO of the database?

- [x] Case 2. An automatic failover to a backup web server has been configured for a website. Because the backup has to be powered on first and has to pull the newest version of the website from GitHub, the process takes about 8 minutes. What is the RTO of the website?




### Sources used

| Bron        | Beschrijving |
| ----------- | ----------- |
| https://cloud.google.com/learn/what-is-disaster-recovery | Article about Disaster Recovery Plan |
| https://en.wikipedia.org/wiki/Disaster_recovery#Recovery_Time_Objective | Article on Disaster Recover - RTO/RPO |
| https://geekflare.com/ids-vs-ips-network-security-solutions/ | IDS / IPS Differences explained |
| https://cloudian.com/guides/disaster-recovery/disaster-recovery-5-key-features-and-building-your-dr-plan/ | Article on Disaster Recovery and Strategies |



### Problems experienced

None.


### Result(s)

*Below you will find the images showing the results along with their descriptions*

**Case 1**

In this case, database backups are made daily, so this indicates that this company requires a continuity where in case of a disaster, a recovery is established within a 24 hours (daily) timeframe. Given that the database is automatically recovered when a failure happens using the most recent backup, which is made daily. So in case of a disaster, the company should be able to restore the database to a point in time up to 24 hours before the event took place. This also tells that any changes that were made after the last back-up, are lost.
So in conclusion, the RPO for this case would be ~24 Hours.



**Case 2**

Crucial info that is given:
```
- website uses 'automatic failover' to a backup web server
- failover process takes about 8 minutes
- backup has to be powered on
```

The RTO defines the maximum downtime that is acceptable for the whole recovery process for the website to resume  functionality. The failover process takes about 8 minutes and the backup on the webserver has to be powered on. So that last factor depends on the time the server needs from (cold) booting up to an active state to proceed with the back up process. But given that the whole failover process takes about 8 minutes, neglecting any other factors -> The RTO for the website should be similar, 8 Minutes. This tells us that the website aims to restore the website and resume its functionality within 8 minutes in case a failure happens. 
 


 




