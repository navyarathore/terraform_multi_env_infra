variable "aws_subnet_name" {
  type        = string
}

variable "subnet_cidr_block" {
  type        = string
}

variable "availability_zone" {
  type        = string
}

variable "subnet_tags" {
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the subnet will be created"
}