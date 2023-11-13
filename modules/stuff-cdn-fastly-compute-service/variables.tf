
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
    use_ssl             = bool
    ssl_check_cert      = bool
    shield              = string
    ssl_sni_hostname    = string
    ssl_cert_hostname   = string
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