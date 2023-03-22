
# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Create internet gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.ig_name
  }
}

# Create subnets in three availability zones
resource "aws_subnet" "public_0" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_public[0].cidr_block
  availability_zone = var.subnet_public[0].availability_zone

  tags = {
    Name = var.subnet_public[0].name
  }
}

resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_public[1].cidr_block
  availability_zone = var.subnet_public[1].availability_zone

  tags = {
    Name = var.subnet_public[1].name
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_public[2].cidr_block
  availability_zone = var.subnet_public[2].availability_zone

  tags = {
    Name = var.subnet_public[2].name
  }
}

# Create a route table for public traffic
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.route_table_public_name
  }
}

# Add a route to the internet gateway for public traffic
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

# Associate public subnet with the public route table
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_0.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_d" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}


