variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the IGW will be attached"
}

variable "igw_tags" {
  type        = map(string)
  description = "Tags to assign to the IGW"
  default     = {}
}