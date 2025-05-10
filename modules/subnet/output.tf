output "name" {
    value = aws_subnet.subnet1.tags["Name"]
}

output "subnet_id" {
    value = aws_subnet.subnet1.id
}

output "subnet_cidr_block" {
    value = aws_subnet.subnet1.cidr_block
}