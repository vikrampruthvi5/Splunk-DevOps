resource "aws_security_group" "kafka-sg" {
  name        = "kafka-sg"
  description = "kafka-sg"
  vpc_id      = aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = var.additional_ingress_rules

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.additional_egress_rules

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
  tags = {
    "Name" = "${var.project}-sg"
  }
}