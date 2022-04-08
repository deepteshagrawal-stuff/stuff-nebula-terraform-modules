variable "name" {
  description = "Application name - Repository Name normally"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnets for the required subnet group for the rds object"
  type        = list(string)
}

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

