output "public_ip" {
  value = {
    for name, instance in aws_instance.my_instance : name => {
    public_ip = instance.public_ip
    user = var.instances[name].user
  }
  }
}