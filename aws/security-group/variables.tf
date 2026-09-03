variable "sg_name" {
  type        = string
  description = "The name of the security group"
}

variable "sg_description" {
  type        = string
  description = "The description of the security group"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC in which to create the security group."
}

variable "ingress_rules" {
  type = list(object({
    description = optional(string)
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Inbound traffic rules for the security group."
  default     = []
}

variable "egress_rules" {
  type = list(object({
    description = optional(string)
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Outbound traffic rules for the security group."
  default     = []
}
