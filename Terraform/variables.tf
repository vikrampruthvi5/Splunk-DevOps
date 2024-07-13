variable "additional_ingress_rules" {
  description = "value for additional ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "additional_egress_rules" {
  description = "value for additional egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "project" {
  description = "Name for project"
  type        = string
}
