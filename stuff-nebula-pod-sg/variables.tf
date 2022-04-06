variable "vpc_id" {
  description = "id of the VPC being used"
  type        = string
}

variable "sg_node_id" {
  description = "ID of the node security group"
  type        = string
}

variable "service_name" {
  descirption = "Name of the service to be attached to the pod security group name"
  type        = string
}