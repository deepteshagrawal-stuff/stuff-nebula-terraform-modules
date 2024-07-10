output "lambda_function_details" {
  value = aws_lambda_function.lambda_function
}

output "lambda_url_details" {
    value = aws_lambda_function_url.lambda_url
}

output "lambda_layer_details" {
    value = aws_lambda_layer_version.lambda_layer
}
