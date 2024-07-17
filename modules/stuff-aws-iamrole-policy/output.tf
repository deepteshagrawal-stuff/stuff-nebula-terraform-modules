output "iam_role_details" {
  value = var.create_role ? aws_iam_role.role[0] : null
}

output "iam_policy_details" {
  value = var.create_policy ? aws_iam_policy.policy[0] : null
}

output "iam_role_policy_attachment" {
  value = var.create_policy_attachment ? aws_iam_role_policy_attachment.role_policy_attach[0] : null
}
