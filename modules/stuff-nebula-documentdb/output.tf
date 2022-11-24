output "docdb_sg" {
  description = "Security group generated for the DocumentDB"
  value       = aws_security_group.docdb_sg
}

output "docdb_endpoint" {
  description = "Endpoint of the DocumentDB"
  value       = aws_docdb_cluster.docdb_cluster.endpoint
}
