variable "security_group_name" {
  type        = string
  description = "Name of the security group"
}

variable "security_group_description" {
  type        = string
  description = "Description of the security group"
  default     = "Security group managed by Terraform"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the security group will be created"
}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  description = "List of ingress rules"
  default     = []
}

variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  description = "List of egress rules"
  default     = []
}

variable "security_group_tags" {
  type        = map(string)
  description = "Tags to assign to the security group"
  default     = {}
}