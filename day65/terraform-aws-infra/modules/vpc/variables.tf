# Variable for VPC CIDR block
variable "vpc_cidr" {
    description = "VPC CIDR block"
    type       = string
    default    = "10.0.0.0/16"
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
