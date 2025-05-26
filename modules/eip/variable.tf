variable "instance_id" {
  type        = string
  description = "The ID of the instance to associate with the EIP (leave empty for use with NAT Gateway)"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the Elastic IP"
  default     = {}
}