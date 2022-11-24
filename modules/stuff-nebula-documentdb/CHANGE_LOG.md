# version-history-documentdb-module
## **Versions:**
Version | Description | Outputs
---------------|--------------------------------------------------------|----------------
`1.0.0` | Initial Release of the DocumentDB module. Generates a database subnet group and a security group. Inbound security group ids can be passed for the security group. Then creates a DocumentDB instance and attaches the subnet group and security group. | `docdb_sg` (Security Group object of the DocumentDB), `docdb_instance` (DocumentDB Object generated)
