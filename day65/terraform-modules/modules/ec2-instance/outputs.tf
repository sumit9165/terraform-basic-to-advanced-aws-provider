output "instance_id" {
  value = aws_instance.day65-instance.id
}

output "public_ip" {
  value = aws_instance.day65-instance.public_ip
}

output "private_ip" {
  value = aws_instance.day65-instance.private_ip
}