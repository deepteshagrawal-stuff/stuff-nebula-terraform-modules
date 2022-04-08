variable "account_role_arn" {
  description = "Role arn to assume admin in the account ID the cluster is deployed in"
  type        = string
}

variable "backend_state_key" {
  descritpion = "Path to store the state in inside of the shared s3 bucket. I.E. staging/dev/stuff-alpha-service.tfstate"
  type        = string
}