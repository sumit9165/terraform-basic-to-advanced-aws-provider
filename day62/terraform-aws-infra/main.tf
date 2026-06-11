resource "aws_vpc" "TerraWeek-VPC" {
  cidr_block                   = "10.0.0.0/16"
  instance_tenancy             = "default"
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "TerraWeek-VPC"
  }
}

resource "aws_subnet" "TerraWeek-Public-Subnet" {
  vpc_id     = aws_vpc.TerraWeek-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
}

resource "aws_internet_gateway" "TerraWeek-IGW" {
  vpc_id = aws_vpc.TerraWeek-VPC.id

  tags = {
    Name = "TerraWeek-IGW"
  }
}

resource "aws_egress_only_internet_gateway" "TerraWeek-eg-IGW" {
  vpc_id = aws_vpc.TerraWeek-VPC.id
}

resource "aws_route_table" "TerraWeek-Public-Route-Table" {
  vpc_id = aws_vpc.TerraWeek-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.TerraWeek-IGW.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.TerraWeek-eg-IGW.id
  }

  tags = {
    Name = "TerraWeek-Public-Route-Table"
  }
}

resource "aws_route_table_association" "TerraWeek-Public-Route-Table-Association" {
  subnet_id      = aws_subnet.TerraWeek-Public-Subnet.id
  route_table_id = aws_route_table.TerraWeek-Public-Route-Table.id
}

#Security Group to allow TLS inbound traffic and all outbound traffic
resource "aws_security_group" "TerraWeek-SG" {
  name        = "TerraWeek-SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.TerraWeek-VPC.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


  tags = {
    Name = "TerraWeek-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_ipv4" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv4         = aws_vpc.TerraWeek-VPC.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv6         = aws_vpc.TerraWeek-VPC.ipv6_cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_instance" "TerraWeek-Server" {
    ami           = "ami-01b14b7ad41e17ba4" # Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-01b14b7ad41e17ba4
    # ami           = "ami-0ec10929233384c7f"   # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type - ami-0ec10929233384c7f
    instance_type = "t3.micro"
    associate_public_ip_address = true
    vpc_security_group_ids =  [aws_security_group.TerraWeek-SG.id]
    subnet_id = aws_subnet.TerraWeek-Public-Subnet.id
    tags = {
        Name = "TerraWeek-Server"
    }
    lifecycle {
  create_before_destroy = true  # Ensures that a new resource is created before the old one is destroyed during updates
  # prevent_destroy = true        # Prevents the resource from being destroyed without manual intervention
  # ignore_changes = [tags]       # Ignores changes to the 'tags' attribute, allowing updates to tags without triggering resource replacement
}
}


resource "aws_s3_bucket" "terraweek2-logs-bucket" {
  bucket = "terraweek-2-logs-bucket"

  depends_on = [aws_instance.TerraWeek-Server]
}

