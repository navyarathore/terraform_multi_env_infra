terraform {
#   required_version = ""
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

# provider "aws" {
#     region = "ap-south-1"
#     alias = "acc2"
#     access_key = ""
#     secret_key = ""
# }