output "service_account_role" {
  description = "IAM Role generated to be attached to the security group for deployment"
  value       = aws_iam_role.app
}
