variable "ami" {
 type = string 
}

variable "instance_type" {
 type = string 
}

variable "common_tags" {
  type = map(string)
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the subnet"
  type        = string
}

variable "subnet_tags" {
  description = "Tags for the subnet"
  type        = map(string)
}

# Variables for Internet Gateway
variable "igw_tags" {
  description = "Tags for the Internet Gateway"
  type        = map(string)
  default     = {}
}


variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "default-sg"
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group managed by Terraform"
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  default = []
}

# variables for backend configuration
variable "backend_bucket" {
  description = "S3 bucket for Terraform state"
  type        = string
}

variable "backend_key" {
  description = "S3 key for Terraform state"
  type        = string
}

variable "backend_region" {
  description = "AWS region for the S3 bucket"
  type        = string
}

variable "encrypt_state" {
  description = "Enable encryption for the Terraform state"
  type        = bool
}
variable "dynamodb_table" {
  description = "DynamoDB table for state locking"
  type        = string
}