# version-history-rds-module
## **Versions:**
Version | Description | Outputs
---------------|--------------------------------------------------------|----------------
`1.0.0` | Initial Release of the RDS module. Generates a database subnet group and a security group for the rds. Inbound security group ids can be passed for the rds security group. Then creates a RDS instance and attaches the subnet group and security group. | `rds_sg` (Security Group object of the RDS), `rds_instance` (RDS Object generated)
`2.0.0` | Seperated the database password from the original rds object so it can be passed as CLI argument when running Terraform. | `rds_sg` (Security Group object of the RDS), `rds_instance` (RDS Object generated)