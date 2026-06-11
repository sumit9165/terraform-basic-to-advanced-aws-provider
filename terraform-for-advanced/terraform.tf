terraform {
  required_providers {
    aws = {
            source = "hashicorp/aws"
            version = "6.39.0"
    }
  }
  backend "s3"{
    bucket = "babylone-1234"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "babylone-1234-table"
  }
}


