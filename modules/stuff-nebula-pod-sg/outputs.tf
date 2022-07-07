output "sg_pod" {
  description = "Pod security group generated to be attached to the pod"
  value       = aws_security_group.sg_pod
}
