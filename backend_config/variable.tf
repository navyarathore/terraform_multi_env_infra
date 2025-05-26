variable "aws_region" {
  description = "AWS region where the S3 bucket and DynamoDB table will be created"
  type        = string
  default     = "ap-south-1"
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket to store Terraform state"
  type        = string
  default     = "terraform-multienv-statebucket"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "dynamodb-state-locking"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "all"
    Purpose     = "terraform-state"
  }
}