variable "role_name" {
  type = string
  description = "name of the iam role."
}

variable "role_description" {
  type = string
  description = "description of the iam role."
}

variable "role_service" {
  type = string
  description = "name of the assume role service."
}

variable "policy_name" {
  type = string
  description = "name of the policy."
}

variable "policy_description" {
  type = string
  description = "description of the policy."
}

variable "allow_policy_actions" {
  type = list(string)
  description = "allow policy actions."
}

variable "allow_policy_resources" {
  type = list(string)
  description = "allow policy resources arn."
}
