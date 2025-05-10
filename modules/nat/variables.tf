variable "allocation_id" {
  type        = string
  description = "The allocation ID of the Elastic IP address for the NAT gateway"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID in which the NAT gateway will be placed"
}

variable "nat_tags" {
  type        = map(string)
  description = "Tags to assign to the NAT gateway"
  default     = {}
}

variable "depends_on_resource" {
  type        = any
  description = "Resource that the NAT gateway depends on (typically IGW)"
  default     = []
}