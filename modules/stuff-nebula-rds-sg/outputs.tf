output "rds_sg_id" {
    description = "ID of the security group generated for the RDS"
    value = aws_security_group.rds_sg.id
}