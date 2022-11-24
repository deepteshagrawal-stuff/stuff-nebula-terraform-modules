/* Must exist in the same VPC as the DocumentDB security group */
variable "subnet_ids" {
  description = "List of subnets for the required subnet group for the DocumentDB object"
  type        = list(string)
}

/* Must exist in the same VPC as the Subnet list provided above */
variable "inbound_sg_ids" {
  description = "ID of the security group you want to be able to reach the DocumentDB"
  type        = list(string)
}

/* VPC id to deploy the DocumentDB into */
variable "vpc_id" {
  description = "VPC_ID of the VPC the DocumentDB cluster is being deployed onto"
  type        = string
}

variable "cluster_id" {
  description = "The name of the DocumentDB cluster"
  type        = string
}

variable "engine" {
  description = "Engine used in DocumentDB ('docdb')"
  type        = string
}

variable "engine_version" {
  description = "Mongo version DocumentDB will use"
  type        = string
}

variable "username" {
  description = "Username for DocumentDB"
  type        = string
}

variable "password" {
  description = "Password for the DocumentDB. Passed seperatly from the rest of the object - allows for passing as CLI argument when running Terraform."
  type        = string
  sensitive   = true
}

variable "backup_retention" {
  description = "DocumentDB cluster backup retention period"
  type        = string
}

variable "backup_window" {
  description = "DocumentDB cluster backup preferred window"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = string
}

variable "instance_class" {
  description = "Instance class for DocumentDB cluster instance"
  type        = string
}
