# version-history-rds-module
## **Versions:**
Version | Description
---------------|--------------------------------------------------------
1.0.0 | Initial Release of the RDS module. Generates a database subnet group and a security group for the rds. Inbound security group ids can be passed for the rds security group. Then creates a RDS instance and attaches the subnet group and security group.
1.1.0 | Seperated the database password from the original rds object so it can be passed as CLI argument when running Terraform. 