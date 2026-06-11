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

variable "env" {
    description = "This variable holds the environment type"
    default = "dev"
    type = string
}