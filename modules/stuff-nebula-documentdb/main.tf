resource "aws_db_subnet_group" "default" {
  name       = "${var.cluster_id}_subnet_group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "docdb_sg" {
  name        = "${var.cluster_id}-docdb-security-group"
  description = "Security group associated with the DocumentDB"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 27017
    to_port         = 27017
    security_groups = var.inbound_sg_ids
  }
}

resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier      = var.cluster_id
  db_subnet_group_name    = aws_db_subnet_group.default.name
  engine                  = var.engine
  engine_version          = var.engine_version
  master_username         = var.username
  master_password         = var.password
  backup_retention_period = var.backup_retention
  preferred_backup_window = var.backup_window
  skip_final_snapshot     = true
}

resource "aws_docdb_cluster_instance" "docdb_instance" {
  count              = 2
  identifier         = "docdb-cluster-${count.index}"
  cluster_identifier = aws_docdb_cluster.default.id
  instance_class     = var.instance_class
}