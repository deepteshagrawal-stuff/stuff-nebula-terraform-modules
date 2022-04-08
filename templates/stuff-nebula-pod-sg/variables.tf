variable "vpc_id" {
  description = "ID of the VPC being deployed to"
  type        = string
}

variable "sg_node_id" {
  description = "Security Group ID of the EKS nodes"
  type        = string
}