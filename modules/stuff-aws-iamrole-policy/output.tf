output "iam_role_details" {
  value = aws_iam_role.role
}

output "iam_policy_details" {
  value = aws_iam_policy.policy
}

output "iam_role_policy_attachment" {
  value = aws_iam_role_policy_attachment.role_policy_attach
}
