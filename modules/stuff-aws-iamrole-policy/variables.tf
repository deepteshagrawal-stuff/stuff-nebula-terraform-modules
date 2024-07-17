variable "role_name" {
  type = string
  description = "name of the iam role."
  default = ""
}

variable "role_description" {
  type = string
  description = "description of the iam role."
  default = ""
}

variable "role_service" {
  type = string
  description = "name of the assume role service."
  default = ""
}

variable "role_inline_policies" {
  type = map(object({
    name           = string
    policy_document = any
  }))
  description = "a map of inline policies having name and policy document in json format. it will not get created if map is empty."
  default = {}
}

variable "policy_name" {
  type = string
  description = "name of the policy."
  default = ""
}

variable "policy_description" {
  type = string
  description = "description of the policy."
  default = ""
}

variable "allow_policy_actions" {
  type = list(string)
  description = "allow policy actions."
  default = []
}

variable "allow_policy_resources" {
  type = list(string)
  description = "allow policy resources arn."
  default = []
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

variable "role_to_attach" {
  type = string
  description = "name of the role to attach if its not created using this module. this is only relevant if create_role is false."
  default = ""
}

variable "policy_to_attach" {
  type = string
  description = "arn of the policy to attach if its not created using this module. this is only releavant if create_policy is false."
  default = ""
}
