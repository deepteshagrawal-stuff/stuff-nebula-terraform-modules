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
  role             = var.function_role
  handler          = var.function_handler
  runtime          = var.function_runtime
  layers           = var.create_lambda_layer ? [aws_lambda_layer_version.lambda_layer.arn] : []
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
  count = var.create_lambda_layer ? 1 : 0  # Conditional creation based on variable

  filename            = var.layer_filename
  layer_name          = var.layer_name
  compatible_runtimes = var.layer_runtimes
}
