terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.0"
    }
  }
#   backend "s3" {
#     bucket         = "terraform-multienv-statebucket"
#     key            = "environments/test/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-lock"
#   }
}

provider "aws" {
    region = "ap-south-1"
}
