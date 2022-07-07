resource "aws_db_subnet_group" "default" {
  name       = "${var.rds_object.db_name}_subnet_group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.rds_object.identifier}-rds-security-group"
  description = "Security group associated with the RDS"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
    security_groups = var.inbound_sg_ids
  }
}

resource "aws_db_instance" "rds" {
  db_name                     = var.rds_object.db_name
  identifier                  = var.rds_object.identifier
  allocated_storage           = var.rds_object.allocated_storage
  engine                      = var.rds_object.engine
  engine_version              = var.rds_object.engine_version
  instance_class              = var.rds_object.instance_class
  username                    = var.rds_object.username
  password                    = var.rds_object.password
  skip_final_snapshot         = var.rds_object.skip_final_snapshot
  vpc_security_group_ids      = [aws_security_group.rds_sg.id]
  db_subnet_group_name        = aws_db_subnet_group.default.name
  allow_major_version_upgrade = false
}

