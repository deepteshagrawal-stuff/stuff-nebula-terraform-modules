# stuff-nebula-documentdb-module
## **Overview**
This module is used to generate a DocumentDB instance in AWS for you're service. `This module peers well with the pod-sg module as that can be used to provision you're pod with a custom security group to provide as an inbound security group to the DocumentDB security group generated in this module.`

For more information on the DocumentDB object generated in this module refer to the following: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster

## **Variables**
Variable | Description | Default
---------------|--------------------------------------------------------|---------------
subnet_ids | List of subnets for the required subnet group for the DocumentDB object. These subnets must exist in the same VPC as the vpc_id provided. | null
inbound_sg_ids | ID of the security group you want to be able to reach the DocumentDB - i.e. the security group id generated from the pod-sg module. This security group must exist in the same VPC as the Subnet list provided above. | null
vpc_id | ID of the VPC the DocumentDB instance is being deployed into | null

##  **docdb Variables**
Variable | Description | Default
---------------|--------------------------------------------------------|---------------
cluster_id | Name of the cluster that is being instantiated | null
engine | The engine type you want you're DocumentDB to be | null
engine_version | Version of the MongoDB engine you want your DocumentDB to be running on | null
username | Username of the super user for the database | null
password | Password of the super user for the database | null
backup_retention | DocumentDB cluster backup retention period | null
backup_window | DocumentDB cluster backup preferred window | null
skip_final_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted | null
instance_class | Instance class for DocumentDB cluster instance | null

## **Example Implementation**
`Module implementation example:`
```hcl
module "app_docdb" {
  source         = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-nebula-documentdb/1.0.0.zip"
  subnet_ids     = var.subnet_ids
  inbound_sg_ids = [module.app_security_group.sg_pod.id]
  vpc_id         = var.vpc_id
  cluster_id          = string
  engine              = string
  engine_version      = string
  username            = string
  password            = string
  backup_retention    = string
  backup_window       = string
  skip_final_snapshot = bool
  instance_class      = string
}
```
Reference implementation - app_documentdb module: https://github.com/StuffNZ/stuff-uira-middleware/blob/master/terraform/main.tf