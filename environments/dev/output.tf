output "ec2_instance_id" {
  description = "ID of the EC2 instance created"
  value       = module.ec2.instance_id
}

output "eip_address" {
  description = "Elastic IP address assigned to the EC2 instance"
  value       = module.eip.eip_address
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.subnet.subnet_id
}

output "subnet_cidr" {
  description = "The CIDR block of the subnet"
  value       = module.subnet.subnet_cidr_block
}

# Outputs for the IGW module
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.igw.igw_id
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = module.igw.igw_arn
}

# Outputs for the NAT Gateway module
output "nat_id" {
  description = "The ID of the NAT Gateway"
  value       = module.nat.nat_id
}

output "nat_public_ip" {
  description = "The public IP address of the NAT Gateway"
  value       = module.nat.nat_public_ip
}

output "nat_private_ip" {
  description = "The private IP address of the NAT Gateway"
  value       = module.nat.nat_private_ip
}

# Outputs for the Security Group module
output "security_group_id" {
  description = "The ID of the Security Group"
  value       = module.security_group.security_group_id
}

output "security_group_arn" {
  description = "The ARN of the Security Group"
  value       = module.security_group.security_group_arn
}

output "security_group_name" {
  description = "The name of the Security Group"
  value       = module.security_group.security_group_name
}