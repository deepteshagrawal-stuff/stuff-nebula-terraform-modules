/* Must exist in the same VPC as the RDS security group */
variable "subnet_ids" {
  description = "List of subnets for the required subnet group for the rds object"
  type        = list(string)
}

/* Must exist in the same VPC as the Subnet list provided above */
variable "inbound_sg_ids" {
  description = "ID of the security group you want to be able to reach the RDS"
  type        = list(string)
}

variable "rds_object" {
  description = "Contains all of the values required to generate a RDS instance"
  type = object({
    db_name             = string
    identifier          = string
    allocated_storage   = number
    engine              = string
    engine_version      = string
    instance_class      = string
    username            = string
    skip_final_snapshot = bool
  })
}

variable "rds_password" {
  description = "Password for the RDS. Passed seperatly from the rest of the object - allows for passing as CLI argument when running Terraform."
  type        = string
}

/* VPC id to deploy the RDS into */
variable "vpc_id" {
  description = "VPC_ID of the VPC the RDS instance is being deployed onto"
  type        = string
}
