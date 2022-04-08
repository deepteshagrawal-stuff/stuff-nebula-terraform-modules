variable "name" {
  description = "Application name - Repository Name normally"
  type        = string
}

variable "oidc_issuer_url" {
  description = "OIDC address of the OIDC issuer of the cluster the service account is being implemented in"
  type        = string
}

variable "namespace" {
  description = "Name space the service account is being used in"
  type        = string
}

variable "policies" {
  description = "A list of policys to append to the role generated for the service account"
  type = list(object({
    name = string
    path = string
    })
  )
}