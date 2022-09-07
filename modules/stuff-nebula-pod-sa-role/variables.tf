variable "name" {
  description = "Name of the application the SSM service account is going to be used for"
  type        = string
}

variable "environment" {
  description = "Environment the service account is being used for"
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

variable "cluster_account_id" {
  description = "AWS account ID that holds the cluster that the service account is being deployed to"
  type        = string
}

variable "project_name" {
  description = "Name of the project the SSM service account is going to be used for"
  type        = string
}