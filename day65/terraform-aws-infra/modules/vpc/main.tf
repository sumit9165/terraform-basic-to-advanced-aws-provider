resource "aws_vpc" "TerraWeek-VPC" {
  cidr_block                   = var.vpc_cidr             # Use the variable for VPC CIDR
  instance_tenancy             = "default"
  assign_generated_ipv6_cidr_block = true
  enable_dns_support   = true                     # Enable DNS support for the VPC
  enable_dns_hostnames = true                # Enable DNS hostnames for instances launched in this VPC  
  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}