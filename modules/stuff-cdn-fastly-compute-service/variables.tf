
variable "package" {
  type                  = string
}

variable "name" {
  type                  = string
}

variable "version_comment" {
  type                  = string
  default               = ""
}

variable "activate" {
  type                  = bool
  default               = false
}

variable "one_login" {
  type                  = bool
}

variable "backend" {
  type                  = list(object({
    name                = string
    address             = string
    port                = number
  }))
}

variable "domain" {
  type                  = list(object({
    name                = string
  }))
}

variable "resource_link" {
  type                  = list(object({
    name                = string
    resource_id         = string
  }))
}