resource "aws_nat_gateway" "nat" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id
  
  tags = var.nat_tags

  # To ensure proper ordering, add the depends_on argument to the nat gateway
  depends_on = [var.depends_on_resource]
}