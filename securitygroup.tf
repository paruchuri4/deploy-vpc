
# Create security group

resource "aws_security_group" "dev-sg" {
  vpc_id = aws_vpc.dev-vpc.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # This means, all ip address are allowed to ssh !
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # This means, all ip address are allowed to port 80 !
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"] # This means, we can reach outside world !
  }

  tags = {
    Name = " to allow ssh and port 80"
  }
}