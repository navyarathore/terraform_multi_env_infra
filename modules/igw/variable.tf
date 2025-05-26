variable "vpc_id" {
  type        = string
}

variable "igw_tags" {
  type        = map(string)
  default     = {}
}