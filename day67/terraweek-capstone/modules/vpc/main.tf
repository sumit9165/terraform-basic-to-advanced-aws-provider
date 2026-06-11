resource "aws_vpc" "day67-vpc" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

resource "aws_subnet" "day67-subnet" {
  vpc_id     = aws_vpc.day67-vpc.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "${var.project_name}-${var.environment}-subnet"
  }
}


resource "aws_internet_gateway" "day67-igw" {
  vpc_id = aws_vpc.day67-vpc.id

  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

resource "aws_route_table" "day67-route-table" {
  vpc_id = aws_vpc.day67-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.day67-igw.id
  }


  tags = {
    Name = "${var.project_name}-${var.environment}-route-table"
  }
}


resource "aws_route_table_association" "day67-route-table-association" {
  subnet_id      = aws_subnet.day67-subnet.id
  route_table_id = aws_route_table.day67-route-table.id
}