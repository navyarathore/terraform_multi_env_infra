resource "aws_subnet" "subnet1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags              = merge(
    var.subnet_tags,
    {
      Name = var.aws_subnet_name
    }
  )
}
