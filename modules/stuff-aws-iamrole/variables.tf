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
