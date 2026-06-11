output "vpc_id" {
  value = aws_vpc.TerraWeek-VPC.id
}

output "subnet_id" {
  value = aws_subnet.TerraWeek-Public-Subnet.id
}

output "instance_id" {
  value = aws_instance.TerraWeek-Server.id
}

output "instance_public_ip" {
  value = aws_instance.TerraWeek-Server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.TerraWeek-Server.public_dns
}

output "security_group_id" {
  value = aws_security_group.TerraWeek-SG.id
}