
variable "property_name" {
  type        = string
}

variable "akamai_group_name" {
  description = "Name of the group in Akamai."
  type        = string
  default     = "STUFF LIMITED-V-3XKYJ97"
}

variable "cname_from" {
  type = string
}

variable "edge_hostname" {
  type  = string
}

variable "product_id" {
  type    = string
  default = "prd_SPM"
}

variable "email" {
  type = set(string)
}

variable "origin_hostname" {
  type = string
}

variable "contract_id" {
  type = string
}

variable "group_id" {
  type = string
}

variable "rules" {
  type = string
}

variable "certificate_id" {
  type = string
}

variable "cp_code" {
  type = string
}

