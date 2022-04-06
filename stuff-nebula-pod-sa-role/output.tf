output "role_service_account" {
  description = "IAM Role generated to be attached to the security group for deployment"
  value       = aws_iam_role.app
}
