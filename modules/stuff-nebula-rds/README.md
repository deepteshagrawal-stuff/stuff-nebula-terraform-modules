# stuff-nebula-rds-module
## **Overview**
This module is used to generate a RDS instance in AWS for you're service. `This module peers well with the pod-sg module as that can be used to provision you're pod with a custom security group to provide as an inbound security group to the RDS security group generated in this module.`

For more information on the RDS object generated in this module refer to the following: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

## **Variables**
Variable | Description | Default
---------------|--------------------------------------------------------|---------------
subnet_ids | List of subnets for the required subnet group for the rds object. These subnets must exist in the same VPC as the vpc_id provided. | null
inbound_sg_ids | ID of the security group you want to be able to reach the RDS - i.e. the security group id generated from the pod-sg module. This security group must exist in the same VPC as the Subnet list provided above. | null
rds_object | Contains all of the values required to generate a RDS instance. This object has its own table of all the nested variables required below | null
vpc_id | ID of the VPC the RDS instance is being deployed into | null

##  **rds_object Variables**
Variable | Description | Default
---------------|--------------------------------------------------------|---------------
db_name | Name of the database that is being instatiated | null
identifier | Indentifier of the database that is being instatiated below. This has a different naming convention and purpose to that of the db_name | null 
allocated_storage | The amount of storage you want your database to have | null
engine | The engine type you want you're RDS to be | null
engine_version | Version of the engine type you want your RDS to be running on | null
instance_class | The AWS instance type to host you're database on | null
username | Username of the super user for the database | null
password | Password of the super user for the database | null
skip_final_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted | null

For more information on the database object refer to: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

## **Example Implementation**
`Module implementation example:`
```hcl
module "app_rds" {
  source         = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-nebula-rds/1.0.0.zip"
  subnet_ids     = var.subnet_ids
  inbound_sg_ids = [module.app_security_group.sg_pod.id]
  rds_object     = var.rds_object
  vpc_id         = var.vpc_id
}
```
`rds_object Variable implementation example:`
```hcl
variable "rds_object" {
  description = "Object definition of the RDS being generated"
  type = object({
    db_name             = string
    identifier          = string
    allocated_storage   = number
    engine              = string
    engine_version      = string
    instance_class      = string
    username            = string
    password            = string
    skip_final_snapshot = bool
  })
}
```
Reference implementation - app_rds module: https://github.com/StuffNZ/stuff-content-service-nebula/blob/master/terraform/main.tf