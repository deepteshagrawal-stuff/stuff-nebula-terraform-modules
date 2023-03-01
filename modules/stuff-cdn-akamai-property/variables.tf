
variable "property_name" {
  type        = string
}

variable "akamai_group_name" {
  type        = string
}

variable "cname_from" {
  type = string
}

variable "edge_hostname" {
  type  = string
}

variable "product_id" {
  type    = string
}

variable "email" {
  type = set(string)
}

variable "origin_hostname" {
  type = string
}

variable "rules" {
  type = string
}

variable "certificate_id" {
  type = string
}

