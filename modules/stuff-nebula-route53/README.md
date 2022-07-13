# stuff-nebula-reoute53-module
***This module is used to generate a route53 record.*** 

`This module generates a route53 record that routes traffic to a kong dns address.`

## **Variables**
To use the following module you will have to declare the following variables during implementation.
Variable | Description | Default
---------------|--------------------------------------------------------|---------------


hosted_zone | The route 53 hosted zone to create the subdomain from | null
record_name | The name of the route 53 record to be created | null
alias | The alias the traffic will be routed to | null
record_type | The type of DNS record | null
ttl | The time to live for the record | null
alias_name | The name of the alias the route53 will route traffic to | null