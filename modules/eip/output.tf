output "eip_address" {
  value = aws_eip.eip.address
  description = "The public IP address of the Elastic IP"
}

output "allocation_id" {
  value = aws_eip.eip.id
  description = "The allocation ID of the Elastic IP address (can be used for EC2 or NAT gateway)"
}

output "public_ip" {
  value = aws_eip.eip.public_ip
  description = "The public IP address of the Elastic IP"
}