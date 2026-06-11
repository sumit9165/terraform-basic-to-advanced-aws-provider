output "subnet_id" {
  value = aws_subnet.TerraWeek-Public-Subnet.id
}

output "security_group_id" {
  value = aws_security_group.TerraWeek-SG.id
}