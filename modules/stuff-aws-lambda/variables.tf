variable function_filename {
  type = string
  description = "zip file name along with path."
}

variable function_name {
  type = string
  description = "lambda function name."
}

variable function_description {
  type = string
  description = "lambda function description."
}

variable function_sourcefile {
  type = string
  description = "source file along with path to be zipped."
}

variable function_role {
  type = string
  description = "iam role resource arn."
}

variable function_handler {
  type = string
  description = "handler method in the source file."
}

variable function_runtime {
  type = string
  description = "function supported runtime."
}

variable create_lambda_layer {
  type = string
  description = "any non blank value. default to no to create/use lambda layer."
  default = ""
}

variable function_timeout {
  type = number
  description = "lambda function timeout in seconds."
  default = 30
}

variable function_env_vars {
  type = map(object)
  description = "key value pairs to set as environment variables."
  default = "{}"
}

variable create_lambda_url {
  type = string
  description = "any non blank value. default to no to generate function url."
  default = ""
}

variable layer_filename {
  type = string
  description = "zip layer file name along with its path."
}

variable layer_name {
  type = string
  description = "name of the layer."
}

variable layer_runtimes {
  type = list(string)
  description = "lambda function layer supported runtimes."
}
