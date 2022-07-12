resource "aws_security_group" "sg_pod" {
  name        = "${var.service_name}-pod-security-group"
  description = "Security group associated with the POD that will be running the containers and connecting to the RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = var.connected_sg_ids
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
  count = length(var.connected_sg_ids)
  description              = "allow SG_POD inbound to connected security groups"
  type                     = "ingress"
  security_group_id        = var.connected_sg_ids[count.index]
  protocol                 = "-1"
  from_port                = 0
  to_port                  = 0
  source_security_group_id = aws_security_group.sg_pod.id
}
