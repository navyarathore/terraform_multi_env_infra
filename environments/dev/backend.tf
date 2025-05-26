terraform {
   backend "s3" {
    bucket         = "terraform-multienv-statebucket"
    key            = "common-state.tfstate"
    # key            = "environments/dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "dynamodb-state-locking"
  }
}