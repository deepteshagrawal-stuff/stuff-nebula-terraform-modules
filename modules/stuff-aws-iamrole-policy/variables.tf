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

variable "inline_policies" {
  type = map(object({
    name           = string
    policy_document = any
  }))
  description = "a map of inline policies having name and policy document in json format. it will not get created if map is empty."
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

variable "create_role" {
  type = bool
  description = "does role need to be created."
  default = false
}

variable "create_policy" {
  type = bool
  description = "does policy need to be created."
  default = false
}

variable "create_policy_attachment" {
  type = bool
  description = "does policy need to be attached to the role."
  default = false
}
