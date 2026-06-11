# Region

locals {
        ec2_key_name= var.env == "dev" ? "terra-automate-key" : "terra-automate-key-prod"
}


# Key value pair

resource "aws_key_pair" "my-key-pair" {
        key_name= local.ec2_key_name
        public_key=file("terra-automate-key.pub")
}

# VPC default

resource "aws_default_vpc" "default"{
        tags = {
        Name = "Default VPC"
        }
}

# Security Group

resource "aws_security_group" "my_security_group" {
        name = "terra-security-group"
        vpc_id = aws_default_vpc.default.id
        description = "this is Inbound and outbound for instance security group"

}

# Inbound & Outbound port rules

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
        security_group_id = aws_security_group.my_security_group.id
        cidr_ipv4 = "0.0.0.0/0"
        from_port = 80
        ip_protocol = "tcp"
        to_port = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
        security_group_id = aws_security_group.my_security_group.id
        cidr_ipv4 = "0.0.0.0/0"
        from_port = 22
        ip_protocol = "tcp"
        to_port = 22
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
        security_group_id = aws_security_group.my_security_group.id
        cidr_ipv4 = "0.0.0.0/0"
        ip_protocol = "-1" # semantically equivalent to all ports
}

# instance

resource "aws_instance" "terra-prac" {
        # count = 3
        ami = "ami-0ec10929233384c7f"
        instance_type = "t3.micro"
        key_name = aws_key_pair.my-key-pair.key_name

        vpc_security_group_ids = [aws_security_group.my_security_group.id]
        root_block_device {
                volume_size = var.ec2_volume_size
                volume_type = "gp3"
        }
        tags ={
                Name = var.ec2_instance_name
        }
}


resource "aws_ec2_instance_state" "my_instance_state" {
    # instance_id = aws_instance.terra-prac[count.index].id
    instance_id = aws_instance.terra-prac.id
    state = var.ec2_instance_state
}