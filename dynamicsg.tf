
# Create security group with dynamic block

locals {
  ingress_rules = [
    {
      port        = 22
      description = "Ingress rule for port 22"
    },
    {
      port        = 80
      description = "Ingress rule for port 80"
    },
    {
      port        = 443
      description = "Ingress rule for port 443"
    },
    {
      port        = 8080
      description = "Ingress rule for port 8080"
    },
    {
      port        = 3389
      description = "Ingress rule for port 3389"
    }
  ]
}

resource "aws_security_group" "dev-sg" {
  vpc_id = aws_vpc.dev-vpc.id


  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"] # This means, we can reach outside world !
  }

  tags = {
    Name = "AWS security group dynamic block"
  }
}


