terraform {
    required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "6.39.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "babylone-12345"  # MUST be globally unique

  tags = {
    Name = "babylone-12345"
  }
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0ec10929233384c7f"  # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"

  tags = {
    # Name = "TerraWeek-Day1"
    Name = "TerraWeek-Modified"
  }
}