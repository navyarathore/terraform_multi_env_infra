resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucket_name
  tags = var.tags
  
  # # Added force_destroy to make it easier to clean up during testing
  # force_destroy = true
}