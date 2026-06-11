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

resource "aws_subnet" "TerraWeek-Public-Subnet" {
  vpc_id     = aws_vpc.TerraWeek-VPC.id
  cidr_block = var.subnet_cidr                  # Use the variable for subnet CIDR
  # map_public_ip_on_launch = true                # Automatically assign public IPs to instances launched in this subnet
  availability_zone = data.aws_availability_zones.available.names[1]  # Use the first available AZ for the subnet
  tags = {
    Name = "${local.name_prefix}-subnet"
  }
}

resource "aws_internet_gateway" "TerraWeek-IGW" {
  vpc_id = aws_vpc.TerraWeek-VPC.id

  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-server"
})
}

resource "aws_egress_only_internet_gateway" "TerraWeek-IGW" {
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
    egress_only_gateway_id = aws_egress_only_internet_gateway.TerraWeek-IGW.id
  }

  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-server"
})
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

  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-server"
})
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.allowed_ports[2]  # Using the variable for allowed ports (22 for SSH)
  ip_protocol       = "tcp"
  to_port           = var.allowed_ports[2]  # Using the variable for allowed ports (22 for SSH)
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.allowed_ports[0]  # Using the variable for allowed ports (80 for HTTP)
  ip_protocol       = "tcp"
  to_port           = var.allowed_ports[0]  # Using the variable for allowed ports (80 for HTTP)
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.TerraWeek-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.allowed_ports[1]  # Using the variable for allowed ports (443 for HTTPS)
  ip_protocol       = "tcp"
  to_port           = var.allowed_ports[1]  # Using the variable for allowed ports (443 for HTTPS)
}

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
#   security_group_id = aws_security_group.TerraWeek-SG.id
#   cidr_ipv6         = "::/0"
#   from_port         = var.allowed_ports[1]  # Using the variable for allowed ports (443 for HTTPS)
#   ip_protocol       = "tcp"
#   to_port           = var.allowed_ports[1]  # Using the variable for allowed ports (443 for HTTPS)
# }


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
    # ami           = "ami-01b14b7ad41e17ba4" # Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-01b14b7ad41e17ba4
    # ami           = "ami-0ec10929233384c7f"   # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type - ami-0ec10929233384c7f
    ami          = data.aws_ami.amazon_linux_2.id # Using the data source to get the latest Amazon Linux 2 AMI
    # instance_type = var.instance_type         # t3.micro for dev, t3.small for prod
    instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
    associate_public_ip_address = true
    vpc_security_group_ids =  [aws_security_group.TerraWeek-SG.id]
    subnet_id = aws_subnet.TerraWeek-Public-Subnet.id
    tags = {
        Name = "${local.name_prefix}-server"
    }
    lifecycle {
  create_before_destroy = true  # Ensures that a new resource is created before the old one is destroyed during updates
  # prevent_destroy = true        # Prevents the resource from being destroyed without manual intervention
  # ignore_changes = [tags]       # Ignores changes to the 'tags' attribute, allowing updates to tags without triggering resource replacement
}
}


resource "aws_s3_bucket" "terraweek2-logs-bucket" {
  bucket = "terraweek-2-logs-bucket"
   tags = {
    Name = "terraweek-2-logs-bucket"
  }
  depends_on = [aws_instance.TerraWeek-Server]
}

