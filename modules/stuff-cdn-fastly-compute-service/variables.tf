
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

variable "backend" {
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

variable "domain" {
  type          = list(object({
    name        = string
  }))
}

variable "resource_link" {
  type          = list(object({
    name        = string
    resource_id = string
  }))
}