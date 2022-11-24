output "docdb_sg" {
  description = "Security group generated for the DocumentDB"
  value       = aws_security_group.docdb_sg
}

output "docdb_instance" {
  description = "Instance of the DocumentDB"
  value       = aws_db_instance.docdb
}
