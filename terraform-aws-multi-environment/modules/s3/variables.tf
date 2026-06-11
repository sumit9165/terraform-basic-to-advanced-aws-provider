# This file defines the variables for the S3 module in a Terraform AWS multi-environment setup.
variable "aws_s3_bucket_name" {
    description = "This variable holds the S3 bucket name"
    default = "babylone-1234"
    type = string
}


variable "env" {
    description = "This variable holds the environment type"
    type = string
}

variable "s3_bucket_count" {
    description = "This variable holds the number of S3 buckets to create"
    type = number
}