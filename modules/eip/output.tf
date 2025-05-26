output "eip_address" {
  value = aws_eip.eip.address
}

output "allocation_id" {
  value = aws_eip.eip.id
  description = "The allocation ID of the Elastic IP address (can be used for EC2 or NAT gateway)"
}

output "public_ip" {
  value = aws_eip.eip.public_ip
}