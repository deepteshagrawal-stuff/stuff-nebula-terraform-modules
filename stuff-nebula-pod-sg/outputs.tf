output "sg_pod" {
  description = "Pod security group generated to be attached to the pod"
  value       = aws_security_group.pod_sg
}
