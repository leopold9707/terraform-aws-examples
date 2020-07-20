# Network configuration

# VPC creation
resource "aws_vpc" "terraform" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "my-demo-vpc"
  }
}

# http subnet configuration
resource "aws_subnet" "http" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.network_http["cidr"]
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "subnet-http"
  }
  depends_on = [aws_internet_gateway.gw]
}

# External gateway configuration
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name = "internet-gateway"
  }
}

# db subnet configuration
resource "aws_subnet" "db" {
  vpc_id = aws_vpc.terraform.id
  cidr_block = var.network_db["cidr"]
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "subnet-db"
  }
}

# Routing table configuration
resource "aws_route_table" "http" {
  vpc_id = aws_vpc.terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Associate http route
resource "aws_route_table_association" "http" {
  subnet_id      = aws_subnet.http.id
  route_table_id = aws_route_table.http.id
}
