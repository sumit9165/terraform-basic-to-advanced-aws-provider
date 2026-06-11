# Variable for AWS region
variable "region" {
    description = "AWS region to deploy resources"
    type       = string
    default    = "us-east-1"
}

# Variable for VPC CIDR block
variable "vpc_cidr" {
    description = "VPC CIDR block"
    type       = string
    default    = "10.0.0.0/16"
}

# Variable for Subnet CIDR block
variable "subnet_cidr" {
    description = "Subnet CIDR block"
    type       = string
    default    = "10.0.1.0/24"
}

# Variable for EC2 instance type
variable "instance_type" {
    description = "EC2 instance type"
    type       = string
    default    = "t3.micro"
}

# Variable for project name
variable "project_name" {
    description = "Name of the project"
    type       = string
}

# Variable for environment (e.g., dev, staging, prod)
variable "environment" {
    description = "Environment name"
    type       = string
    default    = "dev"
}

# Variable for allowed ports
variable "allowed_ports" {
    description = "List of allowed ports"
    type       = list(string)
    default    = ["80", "443", "22"]
}

# Variable for extra tags
variable "extra_tags" {
    description = "List of extra tags"
    type       = map(string)
    default    = {}
}
