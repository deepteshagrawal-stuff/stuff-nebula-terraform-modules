/* Must exist in the same VPC as the RDS security group */
variable "subnet_ids" {
  description = "List of subnets for the required subnet group for the rds object"
  type        = list(string)
}

/* Must exist in the same VPC as the Subnet list provided above */
variable "rds_sg_id" {
  description = "ID of the node security group"
  type        = string
}

variable "rds_object" {
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
