/*
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

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # This means, all ip address are allowed to port 443 !
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # This means, all ip address are allowed to port 8080 !
  }
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # This means, all ip address are allowed to port 3389 !
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"] # This means, we can reach outside world !
  }

  tags = {
    Name = " to allow traffic for specific ports"
  }
}
*/
