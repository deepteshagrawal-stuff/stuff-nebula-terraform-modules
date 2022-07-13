variable "hosted_zone" {
  type = string
  description = "The route 53 hosted zone to create the subdomain from" 
}

variable "record_name" {
  type = string
  description = "The name of the route 53 record to be created" 
}

variable "alias" {
  type = string
  description = "The alias the traffic will be routed to" 
}

variable "record_type" {
  type = string
  description = "The type of DNS record" 
}

variable "ttl" {
  type = string
  description = "The time to live for the record" 
}

variable "alias_name" {
  type = string
  description = "The name of the alias the route53 will point to" 
}
