# Network configuration

# VPC creation
resource "aws_vpc" "vpc_1" {
  cidr_block           = var.vpc_cidr_1
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-1"
  }
}

/*resource "aws_vpc" "vpc_2" {
  cidr_block		= var.vpc_cidr_2
  enable_dns_hostnames	= true
  tags = {
    Name = "VPC-2"
  }
}*/

# Subnets Creation
resource "aws_subnet" "subnets" {
  for_each = { for subnet in var.subnets : subnet => var.subnet_info[subnet] }

  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["availability_zone"]
  tags = {
    Name = each.key
  }
  depends_on = [aws_internet_gateway.gw_1]
}

# External gateway configuration
resource "aws_internet_gateway" "gw_1" {
  vpc_id = aws_vpc.vpc_1.id
  tags = {
    Name = "internet-gateway-1"
  }
}

# Routing table configuration
resource "aws_route_table" "router_1" {
  vpc_id = aws_vpc.vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_1.id
  }
}

# Associate http route
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.subnets["public_subnet_1"].id
  route_table_id = aws_route_table.router_1.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id	 = aws_subnet.subnets["public_subnet_2"].id
  route_table_id = aws_route_table.router_1.id
}
