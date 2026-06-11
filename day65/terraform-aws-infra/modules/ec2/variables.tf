# Variable for AWS region
variable "region" {
    description = "AWS region to deploy resources"
    type       = string
    default    = "us-east-1"
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

# Variable for extra tags
variable "extra_tags" {
    description = "List of extra tags"
    type       = map(string)
    default    = {}
}
