resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr_block
  tags = var.vpc_tags
}
