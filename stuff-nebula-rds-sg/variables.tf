variable "vpc_id" {
  description = "id of the VPC being used"
  type        = string
}

variable "node_sg_id" {
  description = "ID of the node security group"
  type        = string
}

variable "identifier" {
  descirption = "Identifier for the database that will also help with naming of the security groups"
  type        = string
}