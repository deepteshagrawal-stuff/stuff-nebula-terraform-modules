resource "aws_security_group" "pod_sg" {
  name        = "${var.identifier}-pod-security-group"
  description = "Security group associated with the POD that will be running the containers and connecting to the RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [var.node_sg_id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group_rule" "pod_to_node_all_traffic" {
  description              = "allow POD_SG to connect to NODE_GROUP_SG"
  type                     = "ingress"
  security_group_id        = var.node_sg_id
  protocol                 = "-1"
  from_port                = 0
  to_port                  = 0
  source_security_group_id = aws_security_group.pod_sg.id
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.identifier}-rds-security-group"
  description = "Security group associated with the RDS"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
    security_groups = [aws_security_group.pod_sg.id]
  }
}