terraform {
#   required_version = ""
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.0"
    }
  }
#   backend "s3" {
#     bucket         = "terraform-multienv-statebucket"
#     key            = "environments/prod/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-lock"
#   }
}

provider "aws" {
    region = "ap-south-1"
}

# provider "aws" {
#     region = "ap-south-1"
#     alias = "acc2"
#     access_key = ""
#     secret_key = ""
# }