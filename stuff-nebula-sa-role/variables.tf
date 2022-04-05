variable "name" {
  description = "Name of the application the SSM service account is going to be used for"
  type        = string
}

variable "oidc_issuer_url" {
  description = "URL of the OIDC issuer bound to the cluster"
  type        = string
}

variable "namespace" {
  description = "Namespace of the service account"
  type        = string
}
