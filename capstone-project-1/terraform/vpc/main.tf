resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-1"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "igw"
  }
}