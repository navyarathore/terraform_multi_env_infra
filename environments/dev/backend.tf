terraform {
   backend "s3" {
    bucket         = var.backend_bucket
    key            = var.backend_key
    region         = var.backend_region
    encrypt        = var.encrypt_state
    dynamodb_table = var.dynamodb_table
  }
}