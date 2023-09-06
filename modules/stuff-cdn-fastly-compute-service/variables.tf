
variable "package" {
  type          = string
}

variable "name" {
  type          = string
}

variable "activate" {
  type          = bool
  default       = false
}

variable "backends" {
  type          = list(object({
    name        = string
    address     = string
    port        = number
  }))
}

variable "ssl_backend" {
  type          = list(object({
    name        = string
    address     = string
    ssl         = bool
    port        = number
  }))
}

variable "domains" {
  type          = list(object({
    name        = string
  }))
}

variable "resource_links" {
  type          = list(object({
    name        = string
    resource_id = string
  }))
}