variable "ec2_instance_name" {
    description = "This variable holds EC2 instance name"
    default = "babylone-ec2-instance"
    type = string
}

variable "ec2_volume_size" {
    description = "This variable holds EC2 volume size"
    default = 10
    type = number
}

variable "ec2_instance_state" {
    description = "This variable holds EC2 instance state"
    default = "running"
    type = string
}

variable "ec2_instance_count" {
    description = "This variable holds the number of EC2 instances to create"
    type = number
}

variable "ec2_ami_id" {
    description = "This variable holds the EC2 AMI ID"
    default = "ami-0ec10929233384c7f"
    type = string
}

variable "ec2_instance_type" {
    description = "This variable holds the EC2 instance type"
    default = "t3.micro"
    type = string
}

variable "env" {
    description = "This variable holds the environment type"
    type = string
}