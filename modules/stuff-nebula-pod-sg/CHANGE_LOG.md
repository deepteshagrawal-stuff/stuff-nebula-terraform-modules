# version-history-pog-sg-module
## **Versions:**
Version | Description | Outputs
---------------|--------------------------------------------------------|----------------
`1.0.0` | Initial release creates a security group that allows for outbound all and inbound from the provided security group id. It then creates inbound on the provided security group id for the generated security group. | `sg_pod` (Security Group object that is created)
`2.0.0` | A list of security group ids can now be provided that will be provided inbound access to the generated sg and will give inbound access to the generated sg. | `sg_pod` (Security Group object that is created)