variable "vpc_id" {
  description = "id of the VPC being used"
  type        = string
}

variable "connected_sg_ids" {
  description = "List of security group ID's you want the generated sg to provide inbound access to. These security group ids also provide inbound access for the generated security group."
  type        = list(string)
}

variable "service_name" {
  description = "Name of the service to be attached to the pod security group name"
  type        = string
}
