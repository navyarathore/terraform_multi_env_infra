output "nat_id" {
  value = aws_nat_gateway.nat.id
}

output "nat_network_interface_id" {
  value = aws_nat_gateway.nat.network_interface_id
}

output "nat_private_ip" {
  value = aws_nat_gateway.nat.private_ip
}

output "nat_public_ip" {
  value = aws_nat_gateway.nat.public_ip
}