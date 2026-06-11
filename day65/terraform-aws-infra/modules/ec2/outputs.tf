
output "instance_id" {
  value = aws_instance.TerraWeek-Server.id
}

output "instance_public_ip" {
  value = aws_instance.TerraWeek-Server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.TerraWeek-Server.public_dns
}

