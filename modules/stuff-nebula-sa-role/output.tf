output "name" {
  description = "Name of the service account generated"
  value       = aws_iam_role.app_service_account.name
}

output "id" {
  description = "ID of the service account generated"
  value       = aws_iam_role.app_service_account.id
}

output "arn" {
  description = "ARN for service account role"
  value       = aws_iam_role.app_service_account.arn
}
