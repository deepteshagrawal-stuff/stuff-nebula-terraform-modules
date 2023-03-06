
variable "property_name" {
  type        = string
}

variable "group_name" {
  type        = string
}

variable "product_id" {
  type    = string
  default = "prd_SPM"
}

variable "email" {
  type = set(string)
}

variable "rules" {
  type = string
}

variable "certificate_id" {
  type = string
}

variable "hostnames" {
  type = list(object({
    cname_from = string
    edge_hostname   = string
  }))
}

