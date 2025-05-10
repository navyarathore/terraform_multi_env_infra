resource "aws_eip" "eip" {
  instance = var.instance_id != "" ? var.instance_id : null
  domain   = "vpc"
  tags = var.tags
}