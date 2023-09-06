
variable "package" {
  type                  = string
}

variable "name" {
  type                  = string
}

variable "activate" {
  type                  = bool
  default               = false
}

variable "backend" {
  type                  = list(object({
    name                = string
    address             = string
    port                = number
    sl_sni_hostname     = string
    ssl_cert_hostname   = string
    use_ssl             = bool
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