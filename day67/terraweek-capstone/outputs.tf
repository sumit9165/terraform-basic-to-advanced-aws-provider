output "vpc_id" {
    value = module.vpc.vpc_id
}

output "subnet_id" {
    value = module.vpc.subnet_id
}

output "sg_id" {
    value = module.security-group.sg_id
}

output "instance_id" {
    value = module.ec2-instance.instance_id
}

output "public_ip" {
    value = module.ec2-instance.public_ip
}