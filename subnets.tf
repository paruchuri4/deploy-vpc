# Create Subnets

# public subnet for web instances

resource "aws_subnet" "web-subnet" {
  vpc_id                  = aws_vpc.dev-vpc.id
  map_public_ip_on_launch = true #  instances launched into the subnet will have publicIP
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-web-subnet"
  }
}


# private subnet for application instances

resource "aws_subnet" "app-subnet" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "dev-app-subnet"
  }
}

# private subnet for database instances

resource "aws_subnet" "db-subnet" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "dev-db-subnet"
  }
}

