data "archive_file" "lambda_archive" {
  type        = "zip"
  source_file = var.function_sourcefile
  output_path = var.function_filename
}

resource "aws_lambda_function" "lambda_function" {
  filename         = var.function_filename # zip file name
  function_name    = var.function_name
  description      = var.function_description
  source_code_hash = data.archive_file.lambda_archive.output_base64sha256
  role             = module.iamrole_policy_module.iam_role_details.arn
  handler          = var.function_handler
  runtime          = var.function_runtime
  layers           = values(aws_lambda_layer_version.lambda_layer)[*].arn
  timeout          = var.function_timeout

  # Environment variables
  environment {
    variables = var.function_env_vars
  }
}

resource "aws_lambda_function_url" "lambda_url" {
  count = var.create_lambda_url ? 1 : 0  # Conditional creation based on variable

  function_name      = aws_lambda_function.lambda_function.arn
  authorization_type = "AWS_IAM"
}

resource "aws_lambda_layer_version" "lambda_layer" {
  for_each = var.layer_info

  filename            = each.value.filename
  layer_name          = each.value.name
  compatible_runtimes = each.value.runtimes
}

data "aws_iam_policy_document" "lambda_cloudwatch_policy" {
  statement {
    effect    = "Allow"
    actions   = ["logs:CreateLogGroup"]
    resources = ["arn:aws:logs:ap-southeast-2:${var.account_number}:*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["arn:aws:logs:ap-southeast-2:${var.account_number}:log-group:/aws/lambda/${var.function_name}:*"]
  }
}

locals {
  inline_policies = merge(var.xtended_inline_policies,
  {
    cloudwatch_logging_policy = {
      name            = "cloudwatch_logging_policy"
      policy_document = data.aws_iam_policy_document.lambda_cloudwatch_policy.json
    }
  })
}

module "iamrole_policy_module" {
  source                  = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-aws-iamrole-policy/1.0.2.zip"
  create_role             = true
  role_name               = "${var.function_name}_lambda_role"
  role_description        = "Lambda role for ${var.function_name}"
  role_service            = "lambda.amazonaws.com"
  role_inline_policies    = local.inline_policies
}

resource "aws_lambda_permission" "invoke_function_url_permission" {
  count                   = var.create_lambda_url && var.invoke_function_url_principal_arn != "" ? 1 : 0
  action                  = "lambda:InvokeFunctionUrl"
  function_name           = aws_lambda_function.lambda_function.function_name
  principal               = var.invoke_function_url_principal_arn
  source_account          = var.account_number
  function_url_auth_type  = "AWS_IAM"
}
