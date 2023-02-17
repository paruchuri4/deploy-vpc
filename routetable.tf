
# Create route table for web subnet

resource "aws_route_table" "dev-public-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"                     # associated subnet can reach everywhere
    gateway_id = aws_internet_gateway.dev-igw.id # route table uses ig to connect internet
  }

  tags = {
    Name = "dev-public-rt"
  }
}

# Create an association between  route table and public subnet

resource "aws_route_table_association" "dev-rta-web-subnet" {
  subnet_id      = aws_subnet.web-subnet.id
  route_table_id = aws_route_table.dev-public-rt.id
}