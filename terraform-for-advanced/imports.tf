import {
    id = "i-09bfe371ed4c09010"
    to = aws_instance.my_existing_instance
}

resource "aws_instance" "my_existing_instance" {
    ami = "ami-0ec10929233384c7f"
    instance_type = "t3.micro"
    key_name = "terra-key"
    tags = {
      Name = "terraform-practice"
    }
}

resource "aws_ec2_instance_state" "my_existing_instance_state" {
    instance_id = aws_instance.my_existing_instance.id
    state = "running"
}