module "vpc" {
    source = "./modules/vpc"
    project_name = var.project_name
    environment = terraform.workspace
    cidr = var.vpc_cidr
    public_subnet_cidr = var.subnet_cidr
}

module "security-group" {
    source = "./modules/security-group"
    project_name = "terraweek"
    environment = terraform.workspace
    vpc_id = module.vpc.vpc_id
    ingress_ports = var.ingress_ports
}

module "ec2-instance" {
    source = "./modules/ec2-instance"
    project_name = "terraweek"
    environment = terraform.workspace
    ami_id = var.ami_id
    instance_type = var.instance_type
    subnet_id = module.vpc.subnet_id
    security_group_ids = [module.security-group.sg_id]
}
