output "dynamodb_table_name" {
  description = "The name of the Dynamodb table"
  value       = length(aws_dynamodb_table.dynamodb_pro) > 0 ? aws_dynamodb_table.dynamodb_pro[*].id : aws_dynamodb_table.dynamodb_ppr[*].id
}

output "dynamodb_table_arn" {
  description = "The ARN for the Dynamodb table"
  value       = length(aws_dynamodb_table.dynamodb_pro) > 0 ? aws_dynamodb_table.dynamodb_pro[*].arn : aws_dynamodb_table.dynamodb_ppr[*].arn
}
