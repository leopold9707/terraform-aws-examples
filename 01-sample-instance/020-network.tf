# Network configuration

# VPC creation
resource "aws_vpc" "terraform" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "terraform-cloud"
  }
}

# Subnet configuration
resource "aws_subnet" "http" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.network_http["cidr"]
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "terraform-cloud"
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

