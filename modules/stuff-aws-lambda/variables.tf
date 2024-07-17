variable account_number {
  type = string
  description = "account number to deploy the lambda function in."
}

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

variable function_handler {
  type = string
  description = "handler method in the source file."
}

variable function_runtime {
  type = string
  description = "function supported runtime."
}

variable function_timeout {
  type = number
  description = "lambda function timeout in seconds."
  default = 30
}

variable function_env_vars {
  type = map(string)
  description = "key value pairs to set as environment variables."
  default = {}
}

variable create_lambda_url {
  type = bool
  description = "does lambda url need to be created. default to false for not generating function url."
  default = false
}

variable layer_info {
  type = map(object({
    filename  = string        # zip layer file name along with its path.
    name      = string        # name of the layer.
    runtimes  = list(string)  # lambda function layer supported runtimes.
  }))
  description = "it is a map to support multiple layers. it needs to be provided if create_lambda_layer is true."
  default = {}
}

variable "xtended_inline_policies" {
  type = map(object({
    name           = string
    policy_document = any
  }))
  description = "a map of inline policies having name and policy document in json format. default is empty map."
  default = {}
}
