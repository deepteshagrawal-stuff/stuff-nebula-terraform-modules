variable "hosted_zone" {
  type        = string
  description = "The route 53 hosted zone to create the subdomain from"
}

variable "record_name" {
  type        = string
  description = "The name of the route 53 record to be created"
}

variable "alias" {
  type        = string
  description = "The alias the traffic will be routed to"
}

variable "record_type" {
  type        = string
  description = "The type of DNS record"
  default     = "A"
}

variable "elb_hosted_zone" {
  type        = string
  description = "Zone of the ELB"
  default     = "ap-southeast-2"
}
