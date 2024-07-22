## stuff-aws-lambda-module
## **Overview**
Module for generating an AWS Lambda either with or without layers, function url (by default it does not generate lambda function url.)
This module will create account specific log group and account specific log streams by default.
Any other policy to introduce in lambda can be handled by providing different policies as a map below.

```
inline_policies = {
  policy_1  = {
    name            = "s3_inline_policy"
    policy_document = data.aws_iam_policy_document.policy1.json
  },
  policy_2  = {
    name            = "ecs_inline_policy"
    policy_document = data.aws_iam_policy_document.policy2.json
  },
}
```
inline_policies can be defined as a variable in locals and use this variable in the module to provide xtended_inline_policies as below

```
module "stuff_aws_lambda_module" {
  ...
  xtended_inline_policies   = local.inline_policies
}
```
OR a policy document can be generated and attached to lambda role by using stuff-aws-iamrole-policy module.

```
module "iamrole_policy_module" {
  source                  = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-aws-iamrole-policy/1.0.2.zip"
  create_policy           = true
  policy_name             = "lambda-s3-policy-test"
  policy_description      = "lambda s3 policy test"
  allow_policy_actions    = ["s3:GetObject", "s3:PutObject"]
  allow_policy_resources  = [ for res in local.s3_policy_resources : "arn:aws:s3:::${res.s3_resource_bucket_name}/${res.s3_resource_file_key}" ]
  create_policy_attachment = true
  role_to_attach          = module.stuff_aws_lambda_module.lambda_role_details.name
}
```

While creating zip file for this module, other dependant module "stuff-aws-iamrole-policy" will be sitting under .terraform/modules/iamrole_policy_module/main.tf and so on.

## **Variables**
Only default attribute is the only way to differentiate between a mandatory and an optional attribute and hence most of the attributes are kept Blank or Empty to avoid defining them unnecessarily.

Variable | Description | Default
-------------------|----------------------------------------|------
function_filename	    | Zip file name along with path. |
function_name	        | Lambda function name. |
function_description	| Lambda function description. |
function_sourcefile	  | Source file along with path to be zipped. |
function_role	        | IAM role resource arn. |
function_handler	    | Handler method in the source file. |
function_runtime	    | Function supported runtime. |
function_timeout	    | Lambda function timeout in seconds. | 30 seconds
function_env_vars	    | Key value pairs to set as environment variables. | Empty Map
create_lambda_url	    | Does lambda url need to be created. Function URL will not generated if its false. | False
layer_info              | It is a map of object(filename, name, runtimes) to support multiple layers. lambda layers will not get created if its empty. | Empty Map
xtended_inline_policies | It is a map of inline policies having name and policy document in json format. It will only create cloudwatch logs policy if its empty. | Empty Map


## **Usage**
```
module "stuff_aws_lambda_module" {
  source                    = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-aws-lambda/1.0.0.zip"
  function_name             = "Function Name"
  function_description      = "Function Description"
  function_filename         = "../function/test-function.zip"
  function_handler          = "test-function.lambda_handler"
  function_sourcefile       = "../function/test-function.py"
  function_env_vars         = local.s3_env_vars                 # Not Mandatory
  function_runtime          = "python3.12"
  function_timeout          = 60                                # Not Mandatory
  create_lambda_url         = true                              # Not Mandatory
  layer_info                = local.layer_information           # Not Mandatory
  account_number            = var.account_number
  xtended_inline_policies   = local.inline_policies             # Not Mandatory
}
```